 module tb;
      reg clk,rst;
      wire [3:0]q;
      Twisted_ring_counter u1(.clk(clk),.rst(rst),.q(q));
      initial
        begin
          clk=0;
          forever #5 clk=~clk;
        end
      initial
        begin
          $monitor("time=%0t,rst=%0b,clk=%0b,q=%0b",$time,rst,clk,q);
          
          rst=1;#10;
          rst=0;#320;
          $stop;
          
        end
