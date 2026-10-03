#include "xparameters.h"
#include "xgpio.h"
#include "xtmrctr.h"
#include "xinterrupt_wrap.h"
#include "xil_printf.h"

/* 1 = behavioral simulation (short times), 0 = real board */
#define SIMULATION          1

/* AXI GPIO channels */
#define LED_CH              1           /* 4 LEDs  (GPIO  bits 0..3) */
#define BTN_CH              2           /* buttons (GPIO2 bits 0..2) */
#define NUM_LEDS            4
#define LED_MASK            ((1u << NUM_LEDS) - 1)

/* Button bits (AXI GPIO2) */
#define BTN_START           0x1         /* bit 0 */
#define BTN_SPEED           0x2         /* bit 1 */
#define BTN_DIR             0x4         /* bit 2 */
#define BTN_STOP            0x8         /* bit 3 */
#define BTN_MASK            (BTN_START | BTN_SPEED | BTN_DIR | BTN_STOP)

#if SIMULATION
#define LED_ACTIVE_LOW      0           /* testbench: 1 = LED on      */
#define BTN_ACTIVE_LOW      0           /* testbench: 1 = pressed     */
static const u32 speeds_us[] = {100, 60, 40, 20};
#define TICK_US             10          /* button tick                */
#else
#define LED_ACTIVE_LOW      1           /* Z7-Lite LEDs are active-low    */
#define BTN_ACTIVE_LOW      1           /* Z7-Lite keys are active-low    */
static const u32 speeds_us[] = {500000, 250000, 100000, 50000};
#define TICK_US             10000       /* 10 ms button tick          */
#endif
#define NUM_SPEEDS (sizeof(speeds_us) / sizeof(speeds_us[0]))

/* AXI Timer counters */
#define TMR_STEP            0           /* LED step period */
#define TMR_TICK            1           /* button tick     */

static XGpio   gpio;
static XTmrCtr tmr;
static u32     clk_hz;

static volatile int running   = 0;
static volatile int dir_left  = 1;
static volatile u32 speed_idx = 0;
static volatile u32 led       = 0x01;

static u32 us_to_ticks(u32 us)
{
    return (clk_hz / 1000000) * us;
}

static void write_leds(u32 value)
{
    if (LED_ACTIVE_LOW)
        value = ~value;
    XGpio_DiscreteWrite(&gpio, LED_CH, value & LED_MASK);
}

static void set_step_period(u32 us)
{
    /* new value is used at the next auto-reload */
    XTmrCtr_SetResetValue(&tmr, TMR_STEP, us_to_ticks(us));
}

static u32 read_buttons(void)
{
    u32 btn = XGpio_DiscreteRead(&gpio, BTN_CH);

    if (BTN_ACTIVE_LOW)
        btn = ~btn;
    return btn & BTN_MASK;
}

static void handle_buttons(void)
{
    static u32 last_raw, stable;
    u32 raw = read_buttons();

    /* accept a change only if it is the same on two ticks in a row */
    if (raw == last_raw) {
        u32 pressed = raw & ~stable;    /* new presses only */
        stable = raw;

        if (pressed & BTN_START) {
            running = 1;
            xil_printf("%s\r\n", "Start");
        }
        if (pressed & BTN_SPEED) {
            speed_idx = (speed_idx + 1) % NUM_SPEEDS;
            set_step_period(speeds_us[speed_idx]);
            xil_printf("Speed: %d us\r\n", speeds_us[speed_idx]);
        }
        if (pressed & BTN_DIR) {
            dir_left = !dir_left;
            xil_printf("Direction: %s\r\n", dir_left ? "left" : "right");
        }
        if (pressed & BTN_STOP) {
            running = 0;
            xil_printf("%s\r\n", "Stop");
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

    write_leds(led);
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

    /* AXI GPIO: 4 LEDs + 3 buttons */
    status = XGpio_Initialize(&gpio, XPAR_XGPIO_0_BASEADDR);
    if (status != XST_SUCCESS) {
        xil_printf("AXI GPIO init failed\r\n");
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&gpio, LED_CH, 0x0);     /* outputs */
    XGpio_SetDataDirection(&gpio, BTN_CH, 0xF);     /* inputs  */
    write_leds(led);

    /* AXI Timer */
    status = XTmrCtr_Initialize(&tmr, XPAR_XTMRCTR_0_BASEADDR);
    if (status != XST_SUCCESS) {
        xil_printf("Timer init failed\r\n");
        return XST_FAILURE;
    }
    clk_hz = tmr.Config.SysClockFreqHz;             /* 100 MHz from clk_wiz */

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

    set_step_period(speeds_us[speed_idx]);
    XTmrCtr_SetResetValue(&tmr, TMR_TICK, us_to_ticks(TICK_US));

    XTmrCtr_Start(&tmr, TMR_STEP);
    XTmrCtr_Start(&tmr, TMR_TICK);

    xil_printf("Run lights: BTN0=start/stop, BTN1=speed, BTN2=direction\r\n");

    while (1) {
        /* all work is done in the timer interrupt */
    }
}