// Code your testbench here
module register_tb;
    reg [7:0] d1, d2;
    reg clk, rst, set;
    wire [7:0] q1, q2;

  register u1(.q1(q1), .q2(q2), .d1(d1), .d2(d2), .clk(clk), .rst(rst),.set(set));

    initial 
      begin
        clk=0;
        forever #5 clk=~clk;
      end
  
  initial
    begin
      $monitor("Time=%0t  clk=%0b rst=%0b set=%0b  d1=%0b d2=%0b q1=%0b q2=%0b",
                 $time, clk, rst, set, d1, d2, q1, q2);
      rst=0;set=1;d1=8'b10101010;d2=8'b11110000;#5;
      rst=1;set=0;d1=8'b11001100;d2=8'b11100011;#5;
      rst=0;set=0;d1=8'b10111011;d2=8'b11111100;#5;
      rst=0;set=0;d1=8'b10100011;d2=8'b11100100;#5;
      
      $finish;
    end
  
endmodule
