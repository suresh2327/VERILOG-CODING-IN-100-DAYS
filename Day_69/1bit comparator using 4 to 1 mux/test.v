module tb_comparator_1bit_mux;
    reg a, b;
    wire y;

    comparator_1bit_mux uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $monitor("a = %b, b = %b => Equal = %b", a, b, y);
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end
endmodule
