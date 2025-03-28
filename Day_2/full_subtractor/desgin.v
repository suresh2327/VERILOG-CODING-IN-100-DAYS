module full_subtractor (
    input a, 
    input b, 
    input bin, 
    output diff, 
    output bout
);
    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | (~(a ^ b) & bin);
endmodule
