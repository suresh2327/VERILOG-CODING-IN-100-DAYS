    module tb_pulse_generator;
    
        reg clk = 0;
        reg rst;
        reg trigger;
        wire pulse;
    
        pulse_generator dut (.clk(clk), .rst(rst), .trigger(trigger), .pulse(pulse));
    
        always #5 clk = ~clk;
    
        initial begin
            $monitor("Time=%0t | rst=%b | trigger=%b | pulse=%b", $time, rst, trigger, pulse);
    
            rst = 1; trigger = 0; #10;
            rst = 0;
    
            #10 trigger = 1;  // rising edge
            #10 trigger = 1;  // held high
            #10 trigger = 0;  // falling edge
            #10 trigger = 1;  // new pulse
            #10 trigger = 0;
    
            #20 $finish;
        end
    
    endmodule
