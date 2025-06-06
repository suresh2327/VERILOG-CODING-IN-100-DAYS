module palin (
    input [3:0] din,
    output reg is_palin
);

    always @(*) begin
        if (din[3] == din[0] && din[2] == din[1])
            is_palin = 1;
        else
            is_palin = 0;
    end

endmodule
