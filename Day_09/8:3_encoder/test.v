//8:3 encoder test bench code
module tb;
  reg [7:0]a;
  wire [2:0]y;
  encoder dut(.a(a),.y(y));
  initial
    begin
      $monitor("a=%b,y=%b",a,y);
      a=8'b00000001;#10;
      a=8'b00000010;#10;
      a=8'b00000100;#10;
      a=8'b00001000;#10;
      a=8'b00010000;#10;
      a=8'b00100000;#10;
      a=8'b01000000;#10;
      a=8'b10000000;#10;
    end
  initial 
    begin
      $dumpfile("waveform.vcd");
      $dumpvars(0,tb);
    end
      
endmodule
