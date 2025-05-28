    module tb_siso_shift_register;
        reg clk = 0;
        reg rst;
        reg serial_in;
        wire serial_out;
        siso_shift_register siso (.clk(clk), .rst(rst), .serial_in(serial_in), .serial_out(serial_out));
        always #5 clk = ~clk;
        initial begin
            $monitor("Time=%0t | rst=%b | serial_in=%b | serial_out=%b", $time, rst, serial_in, serial_out);
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
