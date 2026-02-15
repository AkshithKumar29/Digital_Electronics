module logic_gates_using_nor(
    input A, B, 
    output and_out, or_out, not_out , nand_out, xor_out, xnor_out
);
    //NOT gate
    nor g1(not_out, A, A);

    //OR gate
    wire t1;
    nor g2(t1, A, B);
    nor g3(or_out, t1, t1);

    //AND gate
    wire t2;
    nor g4(t2, B, B);
    nor g5(and_out, not_out, t2);

    //NAND gate
    nor g6(nand_out, and_out, and_out);

    //XNOR gate
    wire t3, t4;
    nor g7(t3, t1, A);
    nor g8(t4, t1, B);
    nor g9(xnor_out, t3, t4);

    //xor gate
    nor g10(xor_out, xnor_out, xnor_out);
endmodule