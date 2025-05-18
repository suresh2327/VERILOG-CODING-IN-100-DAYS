    module tb_sr_flip_flop;
        reg clk;
        reg rst;
        reg S;
        reg R;
        wire Q;
        sr_flip_flop_using_d u1 (.clk(clk),.rst(rst),.S(S),.R(R),.Q(Q));
        initial begin
            clk = 0;
            forever #5 clk = ~clk;
        end
        initial begin
         $monitor("Time=%0t | clk=%b rst=%b S=%b R=%b Q=%b", $time, clk, rst, S, R, Q);
            rst = 1; S = 0; R = 0;
            #10 rst = 0;
            #10 S = 1; R = 0;
            #10 S = 0; R = 0;
            #10 S = 0; R = 1;
            #10 S = 0; R = 0;
            #10 S = 1; R = 1;
            #10 S = 0; R = 0;
            #20 $finish;
        end
    endmodule
