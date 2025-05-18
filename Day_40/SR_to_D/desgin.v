    module sr_flip_flop_using_d (
        input wire clk,
        input wire rst,
        input wire S,
        input wire R,
        output reg Q
    );
    
        wire D;
        assign D = S | (Q & ~R);
    
        always @(posedge clk) begin
            if (rst)
                Q <= 0;
            else
                Q <= D;
        end
    
    endmodule
