//priority encoder 4:2
module priority_encoder_tb;
    reg  [3:0] in;
    wire [1:0] out;
    wire valid;
    priority_encoder_simple uut (
        .in(in),
        .out(out),
        .valid(valid)
    );
    initial 
    begin
        $monitor("%0t in = %b out = %b, valid = %b", $time, in, out, valid);
        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0100; #10;
        in = 4'b1000; #10;
        in = 4'b1010; #10;
        in = 4'b1111; #10;
        $finish;
    end
endmodule
