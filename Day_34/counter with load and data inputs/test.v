// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,load;
  reg [7:0]data;
  wire [7:0]count;
  counter u1(.clk(clk),.rst(rst),.load(load),.data(data),.count(count));
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t,rst=%0b,clk=%0b,load=%0b,data=%0d,count=%0d",$time,rst,clk,load,data,count);
        rst=0; load=0; data=8'd9;     #10;
        rst=1; load=1; data=8'd9;     #20;
        rst=1; load=0; data=8'd9;     #10;

      $finish;
    end
endmodule
