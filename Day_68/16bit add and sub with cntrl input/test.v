module tb_add_sub_16bit;

reg [15:0] a, b;
reg ctrl;
wire [15:0] result;
wire carry_borrow;
add_sub_16bit uut (
    .a(a),
    .b(b),
    .ctrl(ctrl),
    .result(result),
    .carry_borrow(carry_borrow)
);
initial begin
    $monitor("a = %d | b = %d | ctrl = %b | result = %d | carry/borrow = %b",
              a, b, ctrl, result, carry_borrow);

    // Test Addition
    a = 16'd10; b = 16'd5; ctrl = 0; #10;

    // Test Subtraction
    a = 16'd20; b = 16'd5; ctrl = 1; #10;

    // Test with carry
    a = 16'd65535; b = 16'd1; ctrl = 0; #10;

    // Test with borrow
    a = 16'd100; b = 16'd200; ctrl = 1; #10;
    $finish;
end
endmodule
