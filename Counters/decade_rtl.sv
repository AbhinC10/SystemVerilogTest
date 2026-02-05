module decade_rtl (
    input  logic       clk,
    input  logic       rst,     // active-high reset
    input  logic       en,
    output logic [3:0] count
);

always_ff @(posedge clk or posedge rst) 
  begin
    if (rst)
        count <= 4'd0;
    else if (en) 
        begin
            if (count == 4'd9)
                  count <= 4'd0;
            else
                  count <= count + 1'b1;
        end
  end

endmodule
