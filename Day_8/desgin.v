// Design Code (cla.v)
module cla(a, b, cin, cout, sum);
  input [3:0] a, b;
  input cin;
  output [3:0] sum;
  output cout;

  wire [3:0] p, g;
  wire c0, c1, c2, c3;

  // Generate propagate and generate signals
  assign p = a ^ b;
  assign g = a & b;

  // Calculate carry signals using carry lookahead logic
  assign c0 = g[0] | (p[0] & cin);
  assign c1 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
  assign c2 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
  assign c3 = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

  // Calculate sum bits
  assign sum[0] = p[0] ^ cin;
  assign sum[1] = p[1] ^ c0;
  assign sum[2] = p[2] ^ c1;
  assign sum[3] = p[3] ^ c2;

  // Output carry
  assign cout = c3;

endmodule
