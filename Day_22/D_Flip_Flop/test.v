//test bench code for d flip flop
module D_FF_tb;
    reg clk;
    reg d;
    wire q;
    D_FF dff(.clk(clk),.d(d),.q(q));
    always begin
        #10 clk = ~clk;
    end
    initial begin
        clk = 0;
        d = 0;
        #5  d = 1;
        #15 d = 0;
        #20 d = 1;
        #10 d = 0;
        #50;
        $finish;
    end
    initial begin
        $monitor("At time %0t: clk = %b, d = %b, q = %b", $time, clk, d, q);
    end
endmodule
