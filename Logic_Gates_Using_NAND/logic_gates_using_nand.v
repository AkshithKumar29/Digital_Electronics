module logic_gates_using_nand(
    input A, B,
    output and_out, or_out, not_out, nor_out, xor_out, xnor_out
);
    //NOT gate
    nand g1(not_out, A, A);

    //AND gate
    wire t1;
    nand g2(t1, A, B);
    nand g3(and_out, t1, t1);

    //OR gate
    wire t2, t3;
    nand g4(t2, A, A);
    nand g5(t3, B, B);
    nand g6(or_out, t2, t3);

    //NOR gate
    nand g7(nor_out, or_out, or_out);

    //XOR gate
    wire t4, t5;
    nand g8(t4, A, t3);
    nand g9(t5, t2, B);
    nand g10(xor_out, t4, t5);

    //XNOR gate
    nand g11(xnor_out, xor_out, xor_out);
endmodule
