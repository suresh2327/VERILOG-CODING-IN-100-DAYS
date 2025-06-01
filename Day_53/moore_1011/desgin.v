module moore_1011 (
    input clk,
    input rst,
    input din,
    output reg detected
);
    reg [2:0] state;

    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;

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
