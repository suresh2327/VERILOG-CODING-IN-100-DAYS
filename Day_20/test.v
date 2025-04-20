module tb_sr_flipflop;
reg clk, s, r;
wire q;
sr_flipflop uut(clk, s, r, q);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
s = 0; r = 0; #10;
s = 1; r = 0; #10;
s = 0; r = 1; #10;
s = 0; r = 0; #10;
s = 1; r = 1; #10;
s = 0; r = 0; #10;
$stop;
end
endmodule
