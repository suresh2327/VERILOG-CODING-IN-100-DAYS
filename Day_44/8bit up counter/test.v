    // Code your testbench here
    // or browse Examples
    module tb;
        reg rst, clk;
        wire [7:0] count;
    
        up_counter u1 (.rst(rst), .clk(clk), .count(count));
    
        initial begin
            clk = 0;
            forever #5 clk = ~clk;
        end
    
        initial begin
            $monitor("time = %0t, rst=%0b, clk=%0b, count=%0d", $time, rst, clk, count);
            rst = 0;
            #10;
            rst = 1;
            #490;
            $finish;
        end
    endmodule
