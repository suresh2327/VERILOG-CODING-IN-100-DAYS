    module tb_sipo_shift_register;
        reg clk = 0;
        reg rst;
        reg serial_in;
        wire [3:0] parallel_out;
        sipo_shift_register sipo (.clk(clk),.rst(rst),.serial_in(serial_in),.parallel_out(parallel_out));
        always #5 clk = ~clk;
        initial begin
            $monitor("Time=%0t | rst=%b | serial_in=%b | parallel_out=%b", $time, rst, serial_in, parallel_out);
            rst = 1; serial_in = 0; #10;
            rst = 0;
            serial_in = 1; #10;
            serial_in = 0; #10;
            serial_in = 1; #10;
            serial_in = 1; #10;
            serial_in = 0; #40;
            $finish;
        end
    endmodule
