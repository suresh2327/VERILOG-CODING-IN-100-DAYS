module up_down_counter (
    input wire clk,
    input wire rst,        // Active-low reset
    input wire up_down,    // 1: count up, 0: count down
    output reg [7:0] count
);

    always @(posedge clk or negedge rst) begin
        if (!rst)
            count <= 8'd0;
        else if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end

endmodule
