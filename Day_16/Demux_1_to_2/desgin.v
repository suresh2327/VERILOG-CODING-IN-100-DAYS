//desgin code for demux 1 to 2
module demux_1to2 (
    input wire din,
    input wire sel,
    output reg y0,
    output reg y1
);
always @(*) begin
    y0 = 0;
    y1 = 0;
    if (sel == 1'b0)
        y0 = din;
    else
        y1 = din;
end

endmodule
