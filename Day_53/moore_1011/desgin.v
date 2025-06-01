module moore_1011 (
    input clk,
    input rst,
    input din,
    output reg detected
);
    typedef enum reg [2:0] {S0, S1, S2, S3, S4} state_t;
    state_t state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            detected <= 0;
        end else begin
            case (state)
                S0: state <= (din == 1) ? S1 : S0;
                S1: state <= (din == 0) ? S2 : S1;
                S2: state <= (din == 1) ? S3 : S0;
                S3: state <= (din == 1) ? S4 : S2;
                S4: state <= (din == 1) ? S1 : S2;
                default: state <= S0;
            endcase

            detected <= (state == S4);
        end
    end
endmodule
        
