    module pulse_generator (
        input clk,
        input rst,
        input trigger,
        output reg pulse
    );
        reg trigger_d;
    
        always @(posedge clk or posedge rst) begin
            if (rst) begin
                trigger_d <= 0;
                pulse <= 0;
            end else begin
                trigger_d <= trigger;
                pulse <= trigger & ~trigger_d;
            end
        end
    endmodule
