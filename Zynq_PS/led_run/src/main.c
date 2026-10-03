#include "xparameters.h"
#include "xgpio.h"
#include "xgpiops.h"
#include "xtmrctr.h"
#include "xinterrupt_wrap.h"
#include "xil_printf.h"

/* AXI GPIO channels */
#define LED_CH              1           /* 8 LEDs: N17 P18 R16 R17 T16 U17 W18 W19 */
#define BTN_CH              2           /* 2 buttons: P16, T12 */
#define NUM_LEDS            8
#define LED_MASK            ((1u << NUM_LEDS) - 1)

/* Button bits after read_buttons() */
#define BTN_START           0x1         /* P16 (AXI GPIO2 bit 0) */
#define BTN_SPEED           0x2         /* T12 (AXI GPIO2 bit 1) */
#define BTN_DIR             0x4         /* B5  (PS MIO9)         */

/* Button polarity: 1 = pressed reads 0 (button to GND) */
#define PL_BTN_ACTIVE_LOW   0           /* P16, T12 - check schematic */
#define PS_BTN_ACTIVE_LOW   1           /* B5: MIO9 has pull-up enabled */

#define BTN_DIR_MIO_PIN     9           /* B5 = PS_MIO9 */

/* AXI Timer counters */
#define TMR_STEP            0           /* LED step period */
#define TMR_TICK            1           /* 10 ms button tick */

static XGpio   gpio;
static XGpioPs gpiops;
static XTmrCtr tmr;
static u32     clk_hz;

static const u32 speeds_ms[] = {500, 250, 100, 50};
#define NUM_SPEEDS (sizeof(speeds_ms) / sizeof(speeds_ms[0]))

static volatile int running   = 0;
static volatile int dir_left  = 1;
static volatile u32 speed_idx = 0;
static volatile u32 led       = 0x01;

static void set_step_period(u32 ms)
{
    /* new value is used at the next auto-reload */
    XTmrCtr_SetResetValue(&tmr, TMR_STEP, (clk_hz / 1000) * ms);
}

static u32 read_buttons(void)
{
    u32 pl = XGpio_DiscreteRead(&gpio, BTN_CH) & 0x3;
    u32 ps = XGpioPs_ReadPin(&gpiops, BTN_DIR_MIO_PIN) & 0x1;

    if (PL_BTN_ACTIVE_LOW)
        pl = ~pl & 0x3;
    if (PS_BTN_ACTIVE_LOW)
        ps = !ps;

    return pl | (ps << 2);
}

static void handle_buttons(void)
{
    static u32 last_raw, stable;
    u32 raw = read_buttons();

    /* accept a change only if it is the same on two ticks in a row (10 ms) */
    if (raw == last_raw) {
        u32 pressed = raw & ~stable;    /* new presses only */
        stable = raw;

        if (pressed & BTN_START) {
            running = !running;
            xil_printf("%s\r\n", running ? "Start" : "Stop");
        }
        if (pressed & BTN_SPEED) {
            speed_idx = (speed_idx + 1) % NUM_SPEEDS;
            set_step_period(speeds_ms[speed_idx]);
            xil_printf("Speed: %d ms\r\n", speeds_ms[speed_idx]);
        }
        if (pressed & BTN_DIR) {
            dir_left = !dir_left;
            xil_printf("Direction: %s\r\n", dir_left ? "left" : "right");
        }
    }
    last_raw = raw;
}

static void step_leds(void)
{
    if (!running)
        return;

    if (dir_left)
        led = ((led << 1) | (led >> (NUM_LEDS - 1))) & LED_MASK;
    else
        led = ((led >> 1) | (led << (NUM_LEDS - 1))) & LED_MASK;

    XGpio_DiscreteWrite(&gpio, LED_CH, ~led & LED_MASK);
}

static void timer_callback(void *ref, u8 tmr_num)
{
    (void)ref;
    if (tmr_num == TMR_STEP)
        step_leds();
    else
        handle_buttons();
}

int main(void)
{
    int status;

    /* AXI GPIO: LEDs + 2 PL buttons */
    status = XGpio_Initialize(&gpio, XPAR_XGPIO_0_BASEADDR);
    if (status != XST_SUCCESS) {
        xil_printf("AXI GPIO init failed\r\n");
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&gpio, LED_CH, 0x00);    /* outputs */
    XGpio_SetDataDirection(&gpio, BTN_CH, 0x03);    /* inputs  */
    XGpio_DiscreteWrite(&gpio, LED_CH, ~led & LED_MASK);

    /* PS GPIO: direction button on B5 / MIO9 */
    XGpioPs_Config *ps_cfg = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_BASEADDR);
    if (ps_cfg == NULL ||
        XGpioPs_CfgInitialize(&gpiops, ps_cfg, ps_cfg->BaseAddr) != XST_SUCCESS) {
        xil_printf("PS GPIO init failed\r\n");
        return XST_FAILURE;
    }
    XGpioPs_SetDirectionPin(&gpiops, BTN_DIR_MIO_PIN, 0);   /* input */

    /* AXI Timer */
    status = XTmrCtr_Initialize(&tmr, XPAR_XTMRCTR_0_BASEADDR);
    if (status != XST_SUCCESS) {
        xil_printf("Timer init failed\r\n");
        return XST_FAILURE;
    }
    clk_hz = tmr.Config.SysClockFreqHz;             /* 50 MHz from FCLK0 */

    status = XSetupInterruptSystem(&tmr, XTmrCtr_InterruptHandler,
                                   tmr.Config.IntrId, tmr.Config.IntrParent,
                                   XINTERRUPT_DEFAULT_PRIORITY);
    if (status != XST_SUCCESS) {
        xil_printf("Interrupt setup failed\r\n");
        return XST_FAILURE;
    }

    XTmrCtr_SetHandler(&tmr, timer_callback, &tmr);

    u32 opts = XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION | XTC_DOWN_COUNT_OPTION;
    XTmrCtr_SetOptions(&tmr, TMR_STEP, opts);
    XTmrCtr_SetOptions(&tmr, TMR_TICK, opts);

    set_step_period(speeds_ms[speed_idx]);
    XTmrCtr_SetResetValue(&tmr, TMR_TICK, clk_hz / 100);    /* 10 ms */

    XTmrCtr_Start(&tmr, TMR_STEP);
    XTmrCtr_Start(&tmr, TMR_TICK);

    xil_printf("Run lights: P16=start/stop, T12=speed, B5=direction\r\n");

    while (1) {
        /* all work is done in the timer interrupt */
    }
}