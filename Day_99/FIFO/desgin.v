  module fifo (
      input wire clk,
      input wire rst,
      input wire wr_en,
      input wire rd_en,
      input wire [7:0] din,
      output reg [7:0] dout,
      output wire full,
      output wire empty
  );
  parameter DEPTH = 16;
      parameter ADDR_WIDTH = 4;  // 2^4 = 16
      reg [7:0] mem [0:DEPTH-1];
      reg [ADDR_WIDTH-1:0] wr_ptr = 0;
      reg [ADDR_WIDTH-1:0] rd_ptr = 0;
      reg [ADDR_WIDTH:0] count = 0; // One bit more to hold count up to DEPTH
      assign full  = (count == DEPTH);
      assign empty = (count == 0);
      always @(posedge clk or posedge rst) begin
          if (rst) begin
              wr_ptr <= 0;
              rd_ptr <= 0;
              count  <= 0;
              dout   <= 0;
          end else begin
              // Write
              if (wr_en && !full) begin
                  mem[wr_ptr] <= din;
                  wr_ptr <= wr_ptr + 1;
                  count <= count + 1;
              end
              // Read
              if (rd_en && !empty) begin
                  dout <= mem[rd_ptr];
                  rd_ptr <= rd_ptr + 1;
                  count <= count - 1;
              end end
      end 
  endmodule
