`timescale 1ns / 1ps

module half_adder_tb;
    // Inputs
    reg a;
    reg b;
    
    // Outputs
    wire sum;
    wire carry;
    
    // Instantiate the Unit Under Test (UUT)
    half_adder uut (
        .a(a), 
        .b(b), 
        .sum(sum), 
        .carry(carry)
    );
    
    // Testbench
    initial begin
        // Initialize Inputs
        a = 0; b = 0;
        #10;
        
        a = 0; b = 1;
        #10;
        
        a = 1; b = 0;
        #10;
        
        a = 1; b = 1;
        #10;
        
        // End of test
        $stop;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t | a=%b b=%b | sum=%b carry=%b", $time, a, b, sum, carry);
    end
    
endmodule
