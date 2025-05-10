module register(clk,d1,d2,q1,q2,rst,set);
  input [7:0] d1,d2;
  input clk,rst,set;
  output reg [7:0] q1,q2;
  always@(posedge clk or posedge rst or posedge set)
    if(rst)
      begin
      q1<=8'b0000_0000;
      q2<=8'b0000_0000;
      end
  else if(set)
      begin
      q1<=8'b1111_1111;
      q2<=8'b1111_1111;
      end
    else if(clk)
      begin
      q1<=d1;
  	  q2<=d2;
      end
endmodule
