//test bench code for gray to binary code convetor
module tb_graytobinary;

    reg [3:0] g;
    wire [3:0] b;

    graytobinary gtob (
        .g(g),
        .b(b)
    );

    initial begin
        $display("Gray | Binary");
        $monitor(" %b  |  %b", g, b);

        g = 4'b0000; #10;
        g = 4'b0001; #10;
        g = 4'b0011; #10;
        g = 4'b0110; #10;
        g = 4'b1111; #10;
        g = 4'b1000; #10;

        $finish;
    end
endmodule
