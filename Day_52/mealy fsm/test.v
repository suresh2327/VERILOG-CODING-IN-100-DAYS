
module mealyfsm_tb;
  reg clk,x;
  wire z;
  mealyfsm u1(.z(z),.x(x),.clk(clk));
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t,clk=%0b,x=%0b,z=%0b",$time,clk,x,z);
      x=0; #10; // s0 => z=0
      x=1; #10; // s1 => z=0
      x=1; #10; // s2 => z=0
      x=1; #10; // s3 => z=0
     // x=1; #10; // s0 => z=1
      //x=0; #10; // s1 => z=1
      //x=1; #10; // s2 => z=1
      //x=0; #10; // s3 => z=1
      $finish;
    end
endmodule
