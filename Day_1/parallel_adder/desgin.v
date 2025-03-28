parallel_adder// Code your design here
//desgin code for 4bit parallel adder
module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module four_bit_adder (
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire c1, c2, c3;

    full_adder FA0 (.a(A[0]), .b(B[0]), .cin(Cin),  .sum(Sum[0]), .cout(c1));
    full_adder FA1 (.a(A[1]), .b(B[1]), .cin(c1),   .sum(Sum[1]), .cout(c2));
    full_adder FA2 (.a(A[2]), .b(B[2]), .cin(c2),   .sum(Sum[2]), .cout(c3));
    full_adder FA3 (.a(A[3]), .b(B[3]), .cin(c3),   .sum(Sum[3]), .cout(Cout));
endmodule
