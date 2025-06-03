module tb_clock_divider;

    reg clk = 0;
    reg rst;
    wire clk_out;

    clock_divider #(.DIVISOR(4)) dut (.clk(clk), .rst(rst), .clk_out(clk_out));

    always #5 clk = ~clk;  // 100 MHz clock

    initial begin
        $monitor("Time=%0t | rst=%b | clk_out=%b", $time, rst, clk_out);

        rst = 1; #20;
        rst = 0; #200;

        $finish;
    end

endmodule
