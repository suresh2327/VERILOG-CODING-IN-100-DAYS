module dff_tb;
reg d,clk,set,rst;
wire q;
dff u1(.d(d),.clk(clk),.set(set),.rst(rst),.q(q));
initial
begin
   $monitor("time=%0t,set=%0b,rst=%0b,clk=%0b,d=%0b,q=%0b",$time,set,rst,clk,d,q);
        set = 0; rst = 0; clk = 0; d = 0; #10;
        set = 0; rst = 0; clk = 0; d = 1; #10;
        set = 0; rst = 0; clk = 1; d = 0; #10;
        set = 0; rst = 0; clk = 1; d = 1; #10;
        set = 0; rst = 1; clk = 0; d = 0; #10;
        set = 0; rst = 1; clk = 0; d = 1; #10;
        set = 0; rst = 1; clk = 1; d = 0; #10;
        set = 0; rst = 1; clk = 1; d = 1; #10;
        set = 1; rst = 0; clk = 0; d = 0; #10;
        set = 1; rst = 0; clk = 0; d = 1; #10;
        set = 1; rst = 0; clk = 1; d = 0; #10;
        set = 1; rst = 0; clk = 1; d = 1; #10;
        set = 1; rst = 1; clk = 0; d = 0; #10;
        set = 1; rst = 1; clk = 0; d = 1; #10;
        set = 1; rst = 1; clk = 1; d = 0; #10;
        set = 1; rst = 1; clk = 1; d = 1; #10;
        $stop;
end
endmodule
