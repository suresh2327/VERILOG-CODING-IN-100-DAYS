//test bench code for 4bit subtractor using full adder
module sub_4bit_adder_tb;
  reg [3:0] A, B;
  wire [3:0] d;
  wire bo;

  sub_4bit_adder uut (
    .d(d),
    .bo(bo),
    .A(A),
    .B(B)
  );

  initial begin
    $monitor(" A=%b B=%b | A-B=%b Borrow=%b", A, B, d, bo);

    A = 4'b0101; B = 4'b0011; #10;
    A = 4'b1001; B = 4'b1001; #10;
    A = 4'b0011; B = 4'b0101; #10;
    A = 4'b1011; B = 4'b0001; #10;
    A = 4'b0000; B = 4'b0011; #10;
    A = 4'b0111; B = 4'b1111; #10;
	 $finish;
  end
endmodule
