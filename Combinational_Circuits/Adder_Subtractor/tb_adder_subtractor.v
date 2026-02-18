`timescale 1ns/1ps
module tb_adder_subtractor;
    reg [3:0] A, B;
    reg M;
    wire [3:0] Sum;
    wire Cout, OVF;
    adder_subtractor uut(.A(A), .B(B), .M(M), .Sum(Sum), .Cout(Cout), .OVF(OVF));
    initial begin
        $dumpfile("adder_subtractor.vcd");
        $dumpvars(0, tb_adder_subtractor);
        $monitor("Time = %0t, A = %b, B = %b, M = %b -> Sum = %b, Cout = %b, OVF = %b", $time,A,B,M,Sum,Cout,OVF);
        A = 4'b0101; B = 4'b0000; M = 0; #10;
        A = 4'b0101; B = 4'b0000; M = 1; #10;
        $finish;
    end
endmodule