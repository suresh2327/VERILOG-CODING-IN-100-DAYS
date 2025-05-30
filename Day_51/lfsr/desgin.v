module lfsr(
    input clk,
    input rst,
    output reg [3:0] lfsr_out
);
    wire feedback = lfsr_out[3] ^ lfsr_out[2];

    always @(posedge clk or posedge rst) begin
        if (rst)
            lfsr_out <= 4'b0001;
        else
            lfsr_out <= {lfsr_out[2:0], feedback};
    end
endmodule
