//test bench code for full adder 
module full_adder_tb;
    reg a,b,c;
    wire sum,carry;
    integer i;
    full_adder fa(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
    initial begin
      $monitor("Time=%0t,a=%b,b=%b,c=%b,sum=%b,carry=%b",$time,a,b,c,sum,carry);
    for(i=0;i<8;i=i+1)begin
        {a,b,c}=i;
    #5;
    end
    end
  initial 
    begin
      $dumpfile("waveforms.vcd");
      $dumpvars(0,full_adder_tb);
    end
endmodule 
