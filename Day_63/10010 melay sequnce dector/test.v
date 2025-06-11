module tb_sequence_detector_10010_mealy;

    reg clk = 0;
    reg rst;
    reg in;
    wire out;

    sequence_detector_10010_mealy dut (.clk(clk),.rst(rst),.in(in),.out(out));
    always #5 clk = ~clk;
    initial begin
        $monitor("Time=%0t | in=%b | out=%b", $time, in, out);
        rst = 1; in = 0; #10;
        rst = 0;
        // Sequence: 10010
        in = 1; #10;
        in = 0; #10;
        in = 0; #10;
        in = 1; #10;
        in = 0; #10; // Pattern detected here

        // Another instance
        in = 1; #10;
        in = 0; #10;
        in = 0; #10;
        in = 1; #10;
        in = 0; #10; // Detected again

        $finish;
    end
endmodule
