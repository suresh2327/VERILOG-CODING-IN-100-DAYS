module not_gate_tb;
    reg a;
    wire y;

    not_gate uut (
        .a(a), 
        .y(y)
    );

    initial begin
        $monitor("a=%b | y=%b", a, y);
        
        a = 0; #10;
        a = 1; #10;

        $stop;
    end
endmodule
