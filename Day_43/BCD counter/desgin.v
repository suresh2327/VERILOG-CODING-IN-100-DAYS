module counter(clk, rst, q, enable);
  input clk, rst, enable;
  output reg [7:0] q;

  always @(posedge clk) begin
    if (rst) begin
      q <= 0;
    end
    else if (enable) begin
      if (q == 9)
        q <= 0;
      else
        q <= q + 1;
    end
  end
endmodule
