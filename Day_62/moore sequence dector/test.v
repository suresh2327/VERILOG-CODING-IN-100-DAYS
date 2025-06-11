module tb_sequence_detector_1101_moore;
    reg clk = 0;
    reg rst;
    reg in;
    wire out;
    sequence_detector_1101_moore dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | in=%b | out=%b", $time, in, out);

        rst = 1; in = 0; #10;
        rst = 0;

        in = 1; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10; // 1101 detected
        in = 1; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10; // 1101 agai
        $finish;
    end
endmodule
