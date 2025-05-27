module tb_piso_shift_register;
    reg clk = 0;
    reg rst;
    reg load;
    reg [3:0] parallel_in;
    wire serial_out;
piso_shift_register piso (.clk(clk), .rst(rst), .load(load), .parallel_in(parallel_in), .serial_out(serial_out));
    always #5 clk = ~clk;
    initial begin
        $monitor("Time=%0t | rst=%b | load=%b | parallel_in=%b | serial_out=%b",
                  $time, rst, load, parallel_in, serial_out);
        rst = 1; load = 0; parallel_in = 4'b0000; #10;
        rst = 0;
        parallel_in = 4'b1101; load = 1; #10;
        load = 0;
        #50;
        $finish;
    end
endmodule
