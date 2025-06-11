module sequence_detector_10010_mealy (
    input clk,input rst,input in,output reg out);
    reg [2:0] state;
    parameter S0 = 3'd0,
              S1 = 3'd1,
              S2 = 3'd2,
              S3 = 3'd3,
              S4 = 3'd4;
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else begin
            case (state)
                S0: state <= in ? S1 : S0;
                S1: state <= in ? S1 : S2;
                S2: state <= in ? S3 : S0;
                S3: state <= in ? S1 : S4;
                S4: state <= in ? S1 : S0;
                default: state <= S0;
            endcase
        end
    end

    always @(*) begin
        case (state)
            S3: out = ~in; // Last input should be 0 to go to S4
            S4: out = ~in; // Output high when next input is 0 (Mealy detection point)
            default: out = 0;
        endcase
    end
endmodule
