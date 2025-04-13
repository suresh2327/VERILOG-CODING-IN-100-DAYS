//test bench code for demux 1 to 4
module tb_demux_1to4;
reg din;
reg [1:0] sel;
wire [3:0] dout;
demux_1to4 u1 (
    .din(din),
    .sel(sel),
    .dout(dout)
);
initial begin
    $monitor("Time=%0t | din=%b sel=%b -> dout=%b", $time, din, sel, dout);
    din = 0; sel = 2'b00; #10;
    din = 1; sel = 2'b00; #10;
    din = 1; sel = 2'b01; #10;
    din = 1; sel = 2'b10; #10;
    din = 1; sel = 2'b11; #10;
    din = 0; sel = 2'b11; #10;
    $finish;
end
endmodule
