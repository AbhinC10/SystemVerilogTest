module decade_tb;

    logic clk;
    logic rst;
    logic en;
    logic [3:0] count;

    // Clock generation
    always #5 clk = ~clk;

    // DUT
    decade_rtl dut (
        .clk   (clk),
        .rst   (rst),
        .en    (en),
        .count (count)
    );

    // Reference model
    logic [3:0] exp_count;
    
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, decade_tb);
    end
    
    initial begin
        // Initial values
        clk = 0;
        rst = 1;
        en  = 0;
        exp_count = 0;

        // Release reset cleanly (async-safe)
        #7 rst = 0;

        // Drive enable
        en = 1;

        repeat (25) begin
            @(posedge clk);

            // Reference model update
            if (rst)
                exp_count = 0;
            else if (en) begin
                if (exp_count == 9)
                    exp_count = 0;
                else
                    exp_count++;
            end

            // Check
            assert (count == exp_count)
                else $fatal("Mismatch: exp=%0d got=%0d",
                            exp_count, count);
        end

      $display("Success");
        $finish;
    end

endmodule
