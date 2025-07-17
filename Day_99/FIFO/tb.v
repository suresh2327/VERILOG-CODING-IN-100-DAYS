    module fifo_tb;
        parameter DEPTH = 16;
        parameter ADDR_WIDTH = 4;
        reg clk;
        reg rst;
        reg wr_en;
        reg rd_en;
        reg [7:0] din;
        wire [7:0] dout;
        wire full;
        wire empty;
 fifo u1 (.clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en), .din(din), .dout(dout), .full(full), .empty(empty));
        initial clk = 0;
        always #5 clk = ~clk;  // 100MHz Clock
        // Test Sequence
        initial begin
            // Initial values
            rst = 1;
            wr_en = 0;
            rd_en = 0;
            din = 8'd0;
            // Apply reset
            #10;
            rst = 0;
            // Write 5 values into FIFO
            repeat (5) begin
                @(posedge clk);
                wr_en = 1;
                din = din + 1;
            end
            @(posedge clk);
            wr_en = 0;
    
            // Read 3 values
            repeat (3) begin
                @(posedge clk);
                rd_en = 1;
            end
    
            @(posedge clk);
            rd_en = 0;
    
            // Write 3 more values
            repeat (3) begin
                @(posedge clk);
                wr_en = 1;
                din = din + 1;
            end
    
            @(posedge clk);
            wr_en = 0;
    
            // Read remaining until empty
            while (!empty) begin
                @(posedge clk);
                rd_en = 1;
            end
    
            @(posedge clk);
            rd_en = 0;
    
            // Finish
            #20;
            $finish;
        end
    endmodule
