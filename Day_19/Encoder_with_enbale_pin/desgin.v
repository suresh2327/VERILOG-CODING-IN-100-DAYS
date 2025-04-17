//desgin code for 8:3 ecnoder with enable input
module encoder_8to3_with_enable (
    input        enable,
    input  [7:0] din,
    output reg [2:0] dout
);

always @(*) begin
    if (enable) begin
        casez (din)
            8'b00000001: dout = 3'b000;
            8'b0000001?: dout = 3'b001;
            8'b000001??: dout = 3'b010;
            8'b00001???: dout = 3'b011;
            8'b0001????: dout = 3'b100;
            8'b001?????: dout = 3'b101;
            8'b01??????: dout = 3'b110;
            8'b1???????: dout = 3'b111;
            default:     dout = 3'b000;
        endcase
    end else begin
        dout = 3'b000;
    end
end

endmodule
