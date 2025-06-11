module sequence_detector_1101_moore(
    input clk,input rst,input in,
    output reg out);
    reg [2:0] state, next_state;
    parameter S0 = 3'd0,
              S1 = 3'd1,
              S2 = 3'd2,
              S3 = 3'd3,
              S4 = 3'd4;
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end
    always @(*) begin
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S2 : S0;
            S2: next_state = in ? S2 : S3;
            S3: next_state = in ? S4 : S0;
            S4: next_state = in ? S1 : S0;
            default: next_state = S0;
        endcase end
    always @(*) begin
        if (state == S4)
            out = 1;
        else
            out = 0;
    end 
 endmodule
