    module ring_counter(clk, rst, q);
      input clk, rst;
      output reg [3:0] q;
    
      always @(posedge clk)
      begin
        if (rst)
          q <= 4'b1000;
        else
          q <= {q[0], q[3:1]};
      end
    endmodule
