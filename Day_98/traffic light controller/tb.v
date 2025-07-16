    
    module traffic_light_controller_tb;
    
    reg clk, rst;
    wire red, yellow, green;
    
    traffic_light_controller u1 (.clk(clk), .rst(rst), .red(red), .yellow(yellow), .green(green));
    
    initial begin clk = 0; forever #5 clk = ~clk; end
    
    initial begin
      rst = 1; #20; rst = 0;
      #1000;
      $finish;
    end
    
    initial begin
      $monitor("Time=%0t RED=%b GREEN=%b YELLOW=%b", $time, red, green, yellow);
    end
    
    endmodule
