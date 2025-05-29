module tb_pipo_shift_register;

    reg clk = 0;
    reg rst;
    reg load;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    pipo_shift_register pipo (.clk(clk), .rst(rst), .load(load), .parallel_in(parallel_in), .parallel_out(parallel_out));

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b | load=%b | parallel_in=%b | parallel_out=%b", $time, rst, load, parallel_in, parallel_out);
        rst = 1; load = 0; parallel_in = 4'b0000; #10;
        rst = 0;
        parallel_in = 4'b1011; load = 1; #10;
        load = 0; #10;
        parallel_in = 4'b1100; load = 1; #10;
        load = 0; #10;
        $finish;
    end

endmodule
