module clock_divider #(
    parameter DIVISOR = 2
)(
    input clk,
    input rst,
    output reg clk_out
);
    reg [$clog2(DIVISOR)-1:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            clk_out <= 0;
        end else begin
            if (count == (DIVISOR - 1)) begin
                count <= 0;
                clk_out <= ~clk_out;
            end else begin
                count <= count + 1;
            end
        end
    end
endmodule
