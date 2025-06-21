module tb_tri_state_buffer;
reg in, en;
wire out;

tri_state_buffer dut (.in(in), .en(en), .out(out));

initial begin
    $monitor("in=%b, en=%b, out=%b", in, en, out);
    in = 1; en = 0; #10;
    in = 0; en = 0; #10;
    in = 1; en = 1; #10;
    in = 0; en = 1; #10;
    $finish;
end
endmodule
