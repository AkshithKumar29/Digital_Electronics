`timescale 1ns/1ps
module tb_half_adder;
    reg A, B;
    wire Sum, Cout;
    half_adder uut(.A(A), .B(B), .Sum(Sum), .Cout(Cout));
    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, tb_half_adder);
        $monitor("Time = %0t A = %b B = %b -> Sum = %b Cout = %b ",$time, A, B, Sum, Cout);
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end
endmodule