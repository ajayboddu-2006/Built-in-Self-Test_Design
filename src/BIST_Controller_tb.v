`timescale 1ns/1ps

module bist_tb;
    reg         clk;
    reg         rst;
    reg         testmode;
    reg  [3:0]  in;
    wire [3:0]  out;
    wire        fault_detected;

    bist dut (
        .clk(clk),
        .rst(rst),
        .testmode(testmode),
        .in(in),
        .out(out),
        .fault_detected(fault_detected)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("bist_tb.vcd");
        $dumpvars(0, bist_tb);

        rst = 1;
        testmode = 0;
        in = 4'b0000;
        #20;
        rst = 0;
        testmode = 1;
        in = 4'b0000;
        #250;

        #50;
        $finish;
    end
endmodule
