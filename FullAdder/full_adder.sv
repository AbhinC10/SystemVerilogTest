module full_adder (
    input  logic a,      // First input bit
    input  logic b,     // Second input bit
    input  logic cin,    // Carry input
    output logic sum,    // Sum output
    output logic cout    // Carry output
);

    // Combinational logic - continuous assignment
    // These assignments evaluate whenever inputs change
    
    // Sum is XOR of all three inputs
    assign sum = a ^ b ^ cin;
    
    // Carry out: majority function
    // Can be expressed as: (a AND b) OR (cin AND (a XOR b))
    // Or simplified as: (a AND b) OR (a AND cin) OR (b AND cin)
    assign cout = (a & b) | (cin & (a ^ b));
    
    // Alternative cout implementation (generates same logic):
    // assign cout = (a & b) | (a & cin) | (b & cin);

endmodule : full_adder
