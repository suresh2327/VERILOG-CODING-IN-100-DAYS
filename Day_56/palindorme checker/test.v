module tb_palin;

    reg [3:0] din;
    wire is_palin;

    palin uut (
        .din(din),
        .is_palin(is_palin)
    );

    initial begin
        $monitor("din = %b, is_palin = %b", din, is_palin);

        din = 4'b0101; #10; // Not a palindrome
        din = 4'b1010; #10; // Not a palindrome
        din = 4'b1111; #10; // Palindrome
        din = 4'b0111; #10; // Not a palindrome
        din = 4'b1001; #10; // Palindrome

        $finish;
    end

endmodule
