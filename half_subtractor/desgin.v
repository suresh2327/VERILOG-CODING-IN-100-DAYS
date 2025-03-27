// Code your design here
module half_sub(a,b,diff,bor);
  input a,b;
  output diff,bor;
  wire abar;
  xor(diff,a,b);
  not (abar,a);
  and(bor,abar,b);
  
endmodule
