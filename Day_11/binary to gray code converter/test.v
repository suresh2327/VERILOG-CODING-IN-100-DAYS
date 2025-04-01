`timescale 1ns / 1ps
module tb;
reg [3:0]b;
wire [3:0]g;
binarytogray u1(.b(b),.g(g));
initial begin
$monitor("b=%b,g=%b",b,g);
    b=4'b1111;#10;
    b=4'b1010;#10;
    b=4'b1101;#10;
    $stop;

end
endmodule
