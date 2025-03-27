module testbench;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    
    four_bit_adder uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
    
    initial begin
        $monitor("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);

        
        A = 4'b0001; B = 4'b0010; Cin = 1'b0; #10;
        A = 4'b0101; B = 4'b0011;  #10;
        A = 4'b1111; B = 4'b0001;  #10;
        A = 4'b1010; B = 4'b0101; #10;
        
      $dumpfile("waveforms.vcd");
      $dumpvars(0,testbench);
    end
endmodule
