`timescale 1ns/1ps

module logic_gates_using_nor_tb;
    // Declare testbench signals
    reg A, B;
    wire and_out, or_out, not_out, nand_out, xor_out, xnor_out;
    
    // Instantiate the Unit Under Test (UUT)
    logic_gates_using_nor uut (
        .A(A),
        .B(B),
        .and_out(and_out),
        .or_out(or_out),
        .not_out(not_out),
        .nand_out(nand_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out)
    );
    
    // Generate VCD file for GTKWave
    initial begin
        $dumpfile("logic_gates_nor.vcd");
        $dumpvars(0, logic_gates_using_nor_tb);
    end
    
    // Test all input combinations
    initial begin
        $display("Time\tA\tB\t|\tAND\tOR\tNOT\tNAND\tXOR\tXNOR");
        $display("--------------------------------------------------------------------");
        
        // Test case 1: A=0, B=0
        A = 0; B = 0;
        #10;
        $display("%0t\t%b\t%b\t|\t%b\t%b\t%b\t%b\t%b\t%b", 
                 $time, A, B, and_out, or_out, not_out, nand_out, xor_out, xnor_out);
        
        // Test case 2: A=0, B=1
        A = 0; B = 1;
        #10;
        $display("%0t\t%b\t%b\t|\t%b\t%b\t%b\t%b\t%b\t%b", 
                 $time, A, B, and_out, or_out, not_out, nand_out, xor_out, xnor_out);
        
        // Test case 3: A=1, B=0
        A = 1; B = 0;
        #10;
        $display("%0t\t%b\t%b\t|\t%b\t%b\t%b\t%b\t%b\t%b", 
                 $time, A, B, and_out, or_out, not_out, nand_out, xor_out, xnor_out);
        
        // Test case 4: A=1, B=1
        A = 1; B = 1;
        #10;
        $display("%0t\t%b\t%b\t|\t%b\t%b\t%b\t%b\t%b\t%b", 
                 $time, A, B, and_out, or_out, not_out, nand_out, xor_out, xnor_out);
        
        #10;
        $display("\nExpected outputs:");
        $display("A=0,B=0: AND=0, OR=0, NOT=1, NAND=1, XOR=0, XNOR=1");
        $display("A=0,B=1: AND=0, OR=1, NOT=1, NAND=1, XOR=1, XNOR=0");
        $display("A=1,B=0: AND=0, OR=1, NOT=0, NAND=1, XOR=1, XNOR=0");
        $display("A=1,B=1: AND=1, OR=1, NOT=0, NAND=0, XOR=0, XNOR=1");
        
        $finish;
    end
endmodule