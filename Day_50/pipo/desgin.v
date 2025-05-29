module pipo_shift_register(
    input clk,
    input rst,
    input load,
    input [3:0] parallel_in,
    output reg [3:0] parallel_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            parallel_out <= 4'b0000;
        else if (load)
            parallel_out <= parallel_in;
    end
endmodule
