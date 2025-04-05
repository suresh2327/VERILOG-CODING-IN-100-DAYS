// Code your design here
//desgin code for 4 bit subtractor using full adder
module full_add(s, c, a, b, cin);
  input a, b, cin;
  output reg s, c;

  always @(*) begin
    s = a ^ b ^ cin;
    c = (a & b) | (b & cin) | (cin & a);
  end
endmodule

module sub_4bit_adder(d, bo, A, B);
  input [3:0] A, B;
  output [3:0] d;
  output bo;
  wire [3:0] b;

  full_add sub0(d[0], b[0], A[0], ~B[0], 1'b1);
  full_add sub1(d[1], b[1], A[1], ~B[1], b[0]);
  full_add sub2(d[2], b[2], A[2], ~B[2], b[1]);
  full_add sub3(d[3], b[3],   A[3], ~B[3], b[2]);
  assign bo = ~b[3];
endmodule
