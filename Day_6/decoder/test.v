//3 : 8 decoder test bench code
module tb;
  reg [2:0]a;
  wire [7:0]y;
  decoder dut(.a(a),.y(y));
  integer i;
  initial 
    begin
      $monitor("a=%d,y=%b",a,y);
      for(i=0;i<8;i=i+1)
        begin
          a=i;
          #10;
        end
    end
  initial
    begin
      $dumpfile("waveform.vcd");
      $dumpvars(0,tb);
    end
endmodule
