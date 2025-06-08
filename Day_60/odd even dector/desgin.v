  module even_odd (
      input [3:0] num,
      output reg is_even
  );

      always @(*) begin
          if (num[0] == 0)
              is_even = 1;
          else
              is_even = 0;
      end

  endmodule
