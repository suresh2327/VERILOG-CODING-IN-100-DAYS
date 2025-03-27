// Code your testbench here
// or browse Examples
module tb;
  reg a;
  reg [2:0]sel;
  wire [7:0]y;
  demux8to1 uut(.y(y),.a(a),.sel(sel));
  initial
    begin
      $monitor("a=%b,sel =%b,y=%b",a,sel,y);
      a=1 ; sel = 3'b000;#10;
      a=1 ; sel = 3'b001;#10;
      a=1 ; sel = 3'b010;#10;
      a=1 ; sel = 3'b011;#10;
      a=1 ; sel = 3'b100;#10;
      a=1 ; sel = 3'b101;#10;
      a=1 ; sel = 3'b110;#10;
      a=1 ; sel = 3'b111;#10;
    end
endmodule
