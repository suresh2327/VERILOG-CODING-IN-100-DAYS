module tb_up_down_counter;

    reg clk = 0;
    reg rst;
    reg up_down;
    wire [7:0] count;
     up_down_counter uut (.clk(clk),.rst(rst),.up_down(up_down), .count(count));
    always #5 clk = ~clk;
       initial begin
        $monitor("Time=%0t | rst=%b | up_down=%b | count=%d", $time, rst, up_down, count);
        rst = 0; up_down = 1;
        #10;
        rst = 1;
        up_down = 1;
        #100;
        up_down = 0;
        #100;
        up_down = 1;
        #50;
        $finish;
    end
endmodule
