module tb_full_adder_decoder;
    reg A, B, Cin;
    wire Sum, Cout;

    full_adder_decoder dut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    initial begin
        $monitor("A=%b B=%b Cin=%b -> Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
        A=0; B=0; Cin=0; #10;
        A=0; B=0; Cin=1; #10;
        A=0; B=1; Cin=0; #10;
        A=0; B=1; Cin=1; #10;
        A=1; B=0; Cin=0; #10;
        A=1; B=0; Cin=1; #10;
        A=1; B=1; Cin=0; #10;
        A=1; B=1; Cin=1; #10;
        $finish;
    end
endmodule
