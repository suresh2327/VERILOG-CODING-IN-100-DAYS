module modulo_10_counter (
    input clk,
    input reset,
    input enable,
    output reg [3:0] count  // 4 bits to hold values 0–9
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (enable) begin
            if (count == 4'd9)
                count <= 4'b0000;
            else
                count <= count + 1;
        end
    end

endmodule
