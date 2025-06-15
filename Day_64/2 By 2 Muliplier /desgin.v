    module multiplier_2x2(
    input [1:0] a,
    input [1:0] b,
    output [3:0] product
    );
    
    wire w1, w2, w3, s1, c1;
    
    assign product[0] = a[0] & b[0]; // LSB
    
    assign w1 = a[1] & b[0];
    assign w2 = a[0] & b[1];
    assign w3 = a[1] & b[1];
    
    // First Half Adder
    assign s1 = w1 ^ w2;
    assign c1 = w1 & w2;
    
    // Second Half Adder
    assign product[1] = s1;
    assign product[2] = w3 ^ c1;
    assign product[3] = w3 & c1;
    
    endmodule
