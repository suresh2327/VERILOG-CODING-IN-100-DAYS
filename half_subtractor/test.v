module half_sub_tb;
  reg a, b;
  wire diff, bor;
  
  // Instantiate the half subtractor module
  half_sub ut (.a(a), .b(b), .diff(diff), .bor(bor));

  initial
    begin
      a = 1'b0; b = 1'b0; #2;
      a = 1'b0; b = 1'b1; #2;
      a = 1'b1; b = 1'b0; #2;
      a = 1'b1; b = 1'b1; #2;
    end

  initial 
    $monitor("Time=%0t | a=%b, b=%b, diff=%b, bor=%b", $time, a, b, diff, bor);
  
  
endmodule
