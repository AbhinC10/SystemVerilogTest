module encoder_8to3 (
    input  logic [7:0] in,     // 8-bit input
    output logic [2:0] out,    // 3-bit encoded output
    output logic       valid   // Valid output flag
);

    // Priority encoder using casez (z = don't care)
    // Checks from highest priority (MSB) to lowest (LSB)
    always_comb begin
        casez (in)
            8'b1???????: begin out = 3'b111; valid = 1'b1; end  // in[7]
            8'b01??????: begin out = 3'b110; valid = 1'b1; end  // in[6]
            8'b001?????: begin out = 3'b101; valid = 1'b1; end  // in[5]
            8'b0001????: begin out = 3'b100; valid = 1'b1; end  // in[4]
            8'b00001???: begin out = 3'b011; valid = 1'b1; end  // in[3]
            8'b000001??: begin out = 3'b010; valid = 1'b1; end  // in[2]
            8'b0000001?: begin out = 3'b001; valid = 1'b1; end  // in[1]
            8'b00000001: begin out = 3'b000; valid = 1'b1; end  // in[0]
            8'b00000000: begin out = 3'b000; valid = 1'b0; end  // No input
            default:     begin out = 3'b000; valid = 1'b0; end
        endcase
    end
    
    // Alternative implementation using priority if-else:
    // always_comb begin
    //     valid = (in != 8'b0);
    //     if      (in[7]) out = 3'd7;
    //     else if (in[6]) out = 3'd6;
    //     else if (in[5]) out = 3'd5;
    //     else if (in[4]) out = 3'd4;
    //     else if (in[3]) out = 3'd3;
    //     else if (in[2]) out = 3'd2;
    //     else if (in[1]) out = 3'd1;
    //     else if (in[0]) out = 3'd0;
    //     else            out = 3'd0;
    // end

endmodule : encoder_8to3
