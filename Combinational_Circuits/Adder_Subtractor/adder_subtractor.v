module adder_subtractor(
    input [3:0] A, B, 
    input M,
    output [3:0] Sum, 
    output OVF,  // Overflow for signed arithmetic
    output Cout 
);
    wire [3:0] new_B, G, P;
    wire [3:1] C;
    wire Cin;
    assign Cin = M;
    assign new_B = B ^ {4{M}};
    assign G = A & new_B;
    assign P = A ^ new_B;
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) 
                       | (P[3] & P[2] & P[1] & P[0] & Cin);
    assign Sum = P ^ {C, Cin};
    assign OVF = C[3] ^ Cout;    // Signed overflow detection
endmodule