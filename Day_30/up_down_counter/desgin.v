module up_down_counter (
    input clk,
    input reset,
    input enable,
    input up_down,         // 1 = count up, 0 = count down
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (enable) begin
            if (up_down)
                count <= count + 1;
            else
                count <= count - 1;
        end
    end

endmodule
