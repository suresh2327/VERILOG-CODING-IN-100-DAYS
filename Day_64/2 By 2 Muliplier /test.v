    module tb_multiplier_2x2;
    reg [1:0] a, b;
    wire [3:0] product;
    
    multiplier_2x2 mul (.a(a), .b(b), .product(product));
    
    initial begin
      $monitor("a=%b b=%b -> product=%b (%0d)", a, b, product, product);
      
      a = 2'b00; b = 2'b00; #10;
      a = 2'b01; b = 2'b01; #10;
      a = 2'b10; b = 2'b10; #10;
      a = 2'b11; b = 2'b11; #10;
      a = 2'b01; b = 2'b10; #10;
      a = 2'b10; b = 2'b01; #10;
    
      $finish;
    end
    endmodule
