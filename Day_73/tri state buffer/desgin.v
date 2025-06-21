module tri_state_buffer(
    input wire in,
    input wire en,
    output wire out
);

assign out = en ? in : 1'bz;

endmodule
