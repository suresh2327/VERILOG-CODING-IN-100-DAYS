// Code your design here
module counter(clk,rst,load,data,count);
  input clk,rst,load;
  input [7:0]data;
  output reg [7:0]count;
  always@(posedge clk or negedge rst)
    if(!rst)
      count<=8'd0;
  else if(load)
    count<=data;
  else
    count<=count+1;
    
endmodule
