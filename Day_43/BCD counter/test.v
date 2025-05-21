// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,enable;
  wire [7:0]q;
  counter u1(.clk(clk),.rst(rst),.enable(enable),.q(q));
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t,rst=%0b,clk=%0b,q=%0d",$time,rst,clk,q);
      rst=1;enable=0;#10;
      rst=0;enable=1;#320;
      $stop;

      
    end
endmodule
