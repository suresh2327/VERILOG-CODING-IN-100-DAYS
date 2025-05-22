    // 8bit up counter
    module up_counter(clk, rst, count);
        input rst, clk;
        output reg [7:0] count;
    
        always @(posedge clk or negedge rst) begin
            if (!rst)
                count <= 8'd0;
            else
                count <= count + 1;
        end
    endmodule
