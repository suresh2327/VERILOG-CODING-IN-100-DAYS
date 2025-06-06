module arm (
    input [9:0] num,  // Range: 0-999
    output reg is_arm
);
    integer hun, ten, one;
    integer a;

    always @(*) begin
        hun = num / 100;
        ten = (num / 10) % 10;
        one = num % 10;
        a = (hun * hun * hun) + (ten * ten * ten) + (one * one * one);

        if (num == a)
            is_arm = 1;
        else
            is_arm = 0;
    end
endmodule
