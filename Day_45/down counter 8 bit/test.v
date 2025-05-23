    module tb_down_counter;
        reg clk = 0;
        reg rst;
        wire [7:0] count;
    
        down_counter u1 (
            .clk(clk),
            .rst(rst),
            .count(count)
        );
    
        
        always #5 clk = ~clk; 
    
        initial begin
            $monitor("Time=%0t | rst=%b | clk=%b | count=%d", $time, rst, clk, count);
            rst = 0;        
            #10;
            rst = 1;         
            #490;
            $finish;
        end
    endmodule
