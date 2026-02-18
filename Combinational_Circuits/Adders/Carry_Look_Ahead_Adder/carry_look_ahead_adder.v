module carry_look_ahead_adder(
    input  [3:0] A, B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
    wire [3:0] G, P;
    wire [3:1] C;

    // Generate and Propagate
    assign G = A & B;
    assign P = A ^ B;

    // Carry look-ahead logic
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) 
                       | (P[3] & P[2] & P[1] & P[0] & Cin);

    // Sum calculation
    assign Sum = P ^ {C[3], C[2], C[1], Cin}; // Explicit for clarity
endmodule