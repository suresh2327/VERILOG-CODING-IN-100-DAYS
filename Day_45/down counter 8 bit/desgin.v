    module down_counter (
        input wire clk,
        input wire rst,  // Active-low asynchronous reset
        output reg [7:0] count
    );
    
        always @(posedge clk or negedge rst) begin
            if (!rst)
                count <= 8'd255;  // Start from max value on reset
            else
                count <= count - 1;
        end
    
    endmodule
