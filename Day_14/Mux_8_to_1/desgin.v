//desgin code for 8:1 Mux
module mux_8_to_1(
  input [7:0]in,
  input [2:0]sel,
  output reg y);
  always@(*)
  begin
  case(sel)
  3'b000 : y = in[0];
  3'b001 : y = in[1];
  3'b010 : y = in[2];
  3'b011 : y = in[3];
  3'b100 : y = in[4];
  3'b101 : y = in[5];
  3'b110 : y = in[6];
  3'b111 : y = in[7];
  default : y = 8'bxxxxxxxx;
  endcase
  end
  endmodule
            
