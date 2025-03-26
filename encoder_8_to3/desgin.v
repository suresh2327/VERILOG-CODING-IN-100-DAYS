//8:3 encoder desgin code
module encoder(a, y);
    input [7:0] a;
    output reg [2:0] y;

    always @(*) begin
        y[2] = a[4] | a[5] | a[6] | a[7];
        y[1] = a[2] | a[3] | a[6] | a[7];
        y[0] = a[1] | a[3] | a[5] | a[7];
    end
endmodule
