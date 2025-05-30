module tb_lfsr;

    reg clk = 0;
    reg rst;
    wire [3:0] lfsr_out;

    lfsr lfsr (.clk(clk), .rst(rst), .lfsr_out(lfsr_out));

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b | lfsr_out=%b", $time, rst, lfsr_out);
        rst = 1; #10;
        rst = 0;
        #100;
        $finish;
    end

endmodule
