module add_sub_16bit(
    input [15:0] a,
    input [15:0] b,
    input ctrl, // 0 = add, 1 = subtract
    output reg [15:0] result,
    output reg carry_borrow
);

always @(*) begin
    if (ctrl == 0) begin
        {carry_borrow, result} = a + b; // Addition
    end else begin
        {carry_borrow, result} = a - b; // Subtraction
    end
end

endmodule
