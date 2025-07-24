//test bench code for password locking system
module tb_password_lock_system;
  reg clk, reset;
  reg [15:0] passin, newpass;
  reg enter, chg_pass;
  wire access, alarm;
  wire [1:0] count;

  // Instantiate Design Under Test
  password_lock_system dut (
    .reset(reset), .clk(clk),
    .passin(passin), .newpass(newpass),
    .enter(enter), .chg_pass(chg_pass),
    .access(access), .alarm(alarm), .count(count)
  );

  reg [1:0] attempt_count;
  remaining_attempts_display disp (.count(attempt_count));

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 0;
    enter = 0;
    chg_pass = 0;
    passin = 16'h0000;
    newpass = 16'h0000;

    // Apply reset
    #10 reset = 1;

    // Feature 1: Correct password
    $display("\n\tFeature 1 :Correct password ");
    #10 passin = 16'h1234; enter = 1;
    #10 enter = 0;
    $display("	Test 1: reset=%b  passin=%h  current=%h  master=%h  access=%b  alarm=%b  count=%h",
             reset, passin, dut.current_password, dut.master_password, access, alarm, count);
    attempt_count = count;

    // Feature 2: Alarm triggering
    $display("\n\tFeature 2 : alaram triggering condtion ");
    #10 passin = 16'h1516; enter = 1; #10 enter = 0;
    $display("	Test 2.1: reset=%b  passin=%h  current=%h  master=%h  access=%b  alarm=%b  count=%h",
             reset, passin, dut.current_password, dut.master_password, access, alarm, count);
    attempt_count = count;

    #10 passin = 16'h2127; enter = 1; #10 enter = 0;
    $display("	Test 2.2: reset=%b  passin=%h  current=%h  master=%h  access=%b  alarm=%b  count=%h",
             reset, passin, dut.current_password, dut.master_password, access, alarm, count);
    attempt_count = count;

    #10 passin = 16'h0348; enter = 1; #10 enter = 0;
    $display("	Test 2.3: reset=%b  passin=%h  current=%h  master=%h  access=%b  alarm=%b  count=%h",
             reset, passin, dut.current_password, dut.master_password, access, alarm, count);
    attempt_count = count;

    // Feature 3: Change password with current password
    $display("\n\tFeature 3 : Password changing option using current password ");
    #10 passin = 16'h1234; newpass = 16'h4321; chg_pass = 1; enter = 1;
    #10 enter = 0; chg_pass = 0;
    $display("	Test 3.1 : current password changed to '4321'");

    #10 passin = 16'h4321; enter = 1; #10 enter = 0;
    $display("	Test 3.2: reset=%b  passin=%h  current=%h  master=%h  access=%b  alarm=%b  count=%h",
             reset, passin, dut.current_password, dut.master_password, access, alarm, count);
    attempt_count = count;

    #10 passin = 16'h1234; enter = 1; #10 enter = 0;
    $display("	Test 3.3: reset=%b  passin=%h  current=%h  master=%h  access=%b  alarm=%b  count=%h",
             reset, passin, dut.current_password, dut.master_password, access, alarm, count);
    attempt_count = count;

    // Feature 4: Change password using master password
    $display("\n\tFeature 4 : changing current password  with master password ");
    #10 passin = 16'habcd; newpass = 16'h9866; chg_pass = 1; enter = 1;
    #10 enter = 0; chg_pass = 0;
    $display("	Test 4.1:   current password changed to '9866'");

    // Unlocking with master password
    $display("\n\t unlocking system  with master password ");
    #10 passin = 16'habcd; enter = 1; #10 enter = 0;
    $display("	Test 4.2: reset=%b  passin=%h  current=%h  master=%h  access=%b  alarm=%b  count=%h",
             reset, passin, dut.current_password, dut.master_password, access, alarm, count);
    attempt_count = count;

    // Feature 5: Reset behavior
    $display("\n\tFeature 5 : on reset condition : ");
    #10 reset = 0; #10 reset = 1; #10 reset = 0;
    $display("	Test 5.1: reset=%b  passin=%h  current=%h  master=%h  access=%b  alarm=%b  count=%h",
             reset, passin, dut.current_password, dut.master_password, access, alarm, count);
    attempt_count = count;
    $display("	System unlocked successfully.");

    #10 $display("\n\tSimulation Complete.");
    $finish;
  end
endmodule

// Must be defined OUTSIDE of tb
module remaining_attempts_display(
    input [1:0] count
);
  always @(*) begin
    case (count)
      2'd0: $display("\tSystem unlocked successfully.");
      2'd1: $display("\tIncorrect password. You have 2 attempts left.");
      2'd2: $display("\tIncorrect password. You have 1 attempt left.");
      2'd3: $display("\tLimit reached! Alarm triggered.\n");
      default: $display("\tInvalid count value.\n");
    endcase
  end
endmodule
