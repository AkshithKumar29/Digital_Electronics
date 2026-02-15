module logic_gates_tb;
    reg A, B;
    wire not_out, and_out, or_out, nand_out, nor_out, xor_out, xnor_out;
    
    // Instantiate the logic gates module
    logic_gates uut (
        .A(A), 
        .B(B), 
        .not_out(not_out),
        .and_out(and_out),
        .or_out(or_out),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out)
    );
    
    initial begin
        // Generate VCD file for GTKWave
        $dumpfile("logic_gates.vcd");
        $dumpvars(0, logic_gates_tb);
        
        // Test all combinations
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        
        $finish;
    end
endmodule