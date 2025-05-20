  module Twisted_ring_counter(clk,rst,q);
      input clk,rst;
      output reg [3:0]q;
      always@(posedge clk)
        begin
          if(rst)
            q<='b1000;
          else if(q=='b1111)
            begin
              q<='b1000;
            end
          else   
            q<={~q[0],q[3:1]};
        end
    endmodule
