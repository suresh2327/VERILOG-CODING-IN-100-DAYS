module dff(d,set,rst,clk,q);
input d,set,rst,clk;
output reg q;
always@(posedge clk or posedge rst or posedge set)
 if(set)
q<=1'b1;
else if(rst)
q<=1'b0;
else 
 q<=d;
endmodule
