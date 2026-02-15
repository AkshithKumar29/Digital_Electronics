module logic_gates(
    input A, B, 
    output not_out, and_out, or_out, nand_out, nor_out, xor_out, xnor_out
);
    //Basic gates 
    assign not_out = ~A;
    assign and_out = A & B; 
    assign or_out = A | B;

    //Universal gates
    assign nand_out = ~( A & B );
    assign nor_out = ~( A | B );

    //Exclusive or Arithmetic gates
    assign xor_out = A ^ B;
    assign xnor_out = ~( A ^ B );
endmodule