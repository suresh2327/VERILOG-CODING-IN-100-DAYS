module sipo_shift_register (
    input clk,
    input rst,
    input serial_in,
    output reg [3:0] parallel_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            parallel_out <= 4'b0000;
        end else begin
            parallel_out <= {parallel_out[2:0], serial_in};
        end
    end
endmodule
