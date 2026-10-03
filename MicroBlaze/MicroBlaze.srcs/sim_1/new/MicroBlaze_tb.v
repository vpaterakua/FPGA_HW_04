`timescale 1ns / 1ps

module MicroBlaze_tb;

    reg        clk_50MHz   = 1'b0;
    reg        reset_rtl_0 = 1'b0;     // active-low reset: start in reset
    reg  [3:0] BTN         = 4'b0000;
    wire [3:0] LED;

    // DUT
    MicroBlaze_wrapper dut (
        .clk_50MHz   (clk_50MHz),
        .reset_rtl_0 (reset_rtl_0),
        .BTN_tri_i   (BTN),
        .LED_tri_o   (LED)
    );

    // 50 MHz clock -> 20 ns period
    always #10 clk_50MHz = ~clk_50MHz;

    // Print every LED change
    always @(LED)
        $display("%t ns : LED = %b", $time, LED);

    task press(input [3:0] b);
        begin
            BTN = b;    #40_000;
            BTN = 4'b0; #40_000;
        end
    endtask

    initial begin
        #1000 reset_rtl_0 = 1'b1;        // release reset
        #100_000;                        // MMCM lock + software init

        press(4'b0001);                  // START  -> LEDs rotate left, 100 us/step
        #500_000;
        press(4'b0010);                  // SPEED  -> 60 us/step
        #300_000;
        press(4'b0100);                  // DIR    -> rotate right
        #300_000;
        press(4'b1000);                  // STOP
        #100_000;
        $finish;
    end

endmodule
