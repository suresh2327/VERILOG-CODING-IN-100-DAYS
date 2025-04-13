//test bench code for demux 1 to 2
module tb_demux_1to2;
reg din;
reg sel;
wire y0, y1;
demux_1to2 uut (
    .din(din),
    .sel(sel),
    .y0(y0),
    .y1(y1)
);
initial begin
    $monitor("Time=%0t sel=%b din=%b y0=%b y1=%b", $time, sel, din, y0, y1);
    din = 0; sel = 0; #10;
    din = 1; sel = 0; #10;
    din = 1; sel = 1; #10;
    din = 0; sel = 1; #10;
    $finish;
end
endmodule
