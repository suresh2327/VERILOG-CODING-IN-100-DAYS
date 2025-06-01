module tb_moore_1011;

    reg clk = 0;
    reg rst;
    reg din;
    wire detected;

    moore_1011 moore (.clk(clk), .rst(rst), .din(din), .detected(detected));

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b | din=%b | detected=%b", $time, rst, din, detected);

        rst = 1; din = 0; #10;
        rst = 0;

        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;

        din = 0; #10;
        din = 1; #10;
        din = 1; #10;

        $finish;
    end

endmodule
