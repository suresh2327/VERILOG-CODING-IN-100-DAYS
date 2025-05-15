    // Code your design here
    module usr(clr, clk, sel, par_in, right_in, left_in, q);
      input clr, clk, right_in, left_in;
      input [1:0] sel;
      input [3:0] par_in;
      output reg [3:0] q;
    
      always@(posedge clk) begin
        if(clr) begin
          q <= 4'b0000;
        end
        else begin
          case(sel)
            2'b00: q <= q;
            2'b01: q <= {right_in, q[3:1]};
            2'b10: q <= {q[2:0], left_in};
            2'b11: q <= par_in;
          endcase
        end
      end
    endmodule
