//test bench code for 2:1 mux
module mux_2_to_1_tb;
reg [1:0]in;
reg sel;
wire y;
mux_2_to_1 u1(.in(in),.sel(sel),.y(y));
initial
begin
$monitor("sel=%b,in=%b,y=%b",sel,in,y);
    in = 2'b00; sel = 1'b0;#10;
    in = 2'b01; sel =  1'b1;#10;
    in = 2'b10;  sel = 1'b0;#10;
    in = 2'b11; sel = 1'b1;#10;
      $stop;
    end
 endmodule
