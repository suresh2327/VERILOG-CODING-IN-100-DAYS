    module tb_arm;
    
        reg [9:0] num;
        wire is_arm;
    
        arm uut (
            .num(num),
            .is_arm(is_arm)
        );
    
        initial begin
            $monitor("num = %0d | is_armstrong = %b", num, is_arm);
    
            num = 153; #10; // Armstrong
            num = 143; #10; // Not Armstrong
            num = 999; #10; // Not Armstrong
            num = 222; #10; // Not Armstrong
            num = 370; #10; // Armstrong
    
            $finish;
        end
    
    endmodule
