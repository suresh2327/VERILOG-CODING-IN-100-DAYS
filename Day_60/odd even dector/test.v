module tb_even_odd;

    reg [3:0] num;
    wire is_even;

    even_odd u1 (
        .num(num),
        .is_even(is_even)
    );

    initial begin
        $monitor("num = %0d | is_even = %b", num, is_even);

        num = 4'd0; #10;
        num = 4'd1; #10;
        num = 4'd2; #10;
        num = 4'd3; #10;
        num = 4'd4; #10;
        num = 4'd5; #10;
        num = 4'd6; #10;
        num = 4'd7; #10;
        num = 4'd8; #10;
        num = 4'd9; #10;

        $finish;
    end

endmodule
