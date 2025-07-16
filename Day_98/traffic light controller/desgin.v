    module traffic_light_controller(input clk, input rst, output reg red, output reg yellow, output reg green);
    parameter RED=2'b00, GREEN=2'b01, YELLOW=2'b10;
    reg [1:0] current_state, next_state;
    reg [3:0] timer;
    always @(posedge clk or posedge rst) begin
      if (rst) begin
        current_state <= RED;
        timer <= 0;
      end else begin
        if (timer == 4'd9) begin
          current_state <= next_state;
          timer <= 0;
        end else timer <= timer + 1;
      end end
    always @(*) begin
      case (current_state)
        RED: next_state = GREEN;
        GREEN: next_state = YELLOW;
        YELLOW: next_state = RED;
        default: next_state = RED;
      endcase
    end
    always @(*) begin
      red = 0; yellow = 0; green = 0;
      case (current_state)
        RED: red = 1;
        GREEN: green = 1;
        YELLOW: yellow = 1;
      endcase
    end
 endmodule
