// Code your testbench here
// or browse Examples
module single_port_ram_tb;
  reg clk,we;
  reg [6:0] write_addr, read_addr;
  reg [7:0] data;
  wire [7:0] q, y;

  single_port_ram u1(.clk(clk), .we(we), .write_addr(write_addr),
                     .read_addr(read_addr), .data(data), .q(q), .y(y));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("we=%0b,write_addr=%0d,read_addr=%0d,data=%0h,q=%0h,y=%0h", 
              we, write_addr, read_addr, data, q, y);
    we = 0; write_addr = 7'd10; read_addr = 7'd10; data = 8'hab; #10;
    we = 1; write_addr = 7'd10; read_addr = 7'd10; data = 8'hab; #10;
    // $finish;
  end
endmodule
