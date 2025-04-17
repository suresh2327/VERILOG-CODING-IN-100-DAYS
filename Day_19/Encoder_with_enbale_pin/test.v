//test bench code for 8:3 ecnoder with enable input
module tb_encoder_8to3_with_enable;
reg  enable;
reg  [7:0] din;
wire [2:0] dout;

encoder_8to3_with_enable u1(
    .enable(enable),
    .din(din),
    .dout(dout)
);
initial begin
 $monitor("Time = %0t | Enable = %b | DIN = %b | DOUT = %b", $time, enable, din, dout);
    enable = 0; din = 8'b00000001;
    #10 enable = 1;
    
    din = 8'b00000001; #10;
    din = 8'b00000010; #10;
    din = 8'b00000100; #10;
    din = 8'b00001000; #10;
    din = 8'b00010000; #10;
    din = 8'b00100000; #10;
    din = 8'b01000000; #10;
    din = 8'b10000000; #10;   
    enable = 0; din = 8'b01000000; #10;   
    $stop;
end
endmodule
