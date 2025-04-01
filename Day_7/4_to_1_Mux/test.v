// Code your testbench here
// or browse Examples
module tb;
  reg[3:0]a;
  reg[1:0]s;
  wire y;
  mux4to1 u1(.y(y),.a(a),.s(s));
  initial 
    begin
      $monitor("s=%0b, y=%0b",s,y);
      a=4'b1011;
      s=2'b00;
      #10; s=2'b01;
      #10; s=2'b10;
      #10; s=2'b11;
    end
endmodule
