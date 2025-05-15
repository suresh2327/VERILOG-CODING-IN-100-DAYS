    module usr_tb;
      reg clr, clk, right_in, left_in;
      reg [1:0] sel;
      reg [3:0] par_in;
      wire [3:0] q;
    
      usr u1(.q(q), .right_in(right_in), .left_in(left_in), .clk(clk), .clr(clr), .sel(sel), .par_in(par_in));
    
      initial begin
        clk = 0;
        forever #5 clk = ~clk;
      end
    
      initial begin
        $monitor("clr=%0b, sel=%0b, right_in=%0b, left_in=%0b, par_in=%0b, q=%0b", clr, sel, right_in, left_in, par_in, q);
        clr = 1; sel = 2'b01; right_in = 1; left_in = 0; par_in = 4'b110; #10;
        clr = 0; sel = 2'b11; par_in = 4'b110; #10;
        right_in = 0; #10;
        left_in = 0; #10;
        clr = 0; sel = 2'b00; #10;
        $finish;
      end
    endmodule
