`timescale 1ns/1ps
module tb_ripple_carry_adder;
    reg [3:0] A, B;
    wire [3:0] Sum;
    wire Cout;
    ripple_carry_adder uut5(.A(A), .B(B), .Sum(Sum), .Cout(Cout));
    initial begin
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0, tb_ripple_carry_adder);
        $monitor("Time = %0t, A = %b, B = %b -> Sum = %b, Cout = %b",$time,A,B,Sum,Cout);
        A = 4'b0011; B = 4'b0101; #10; 
        A = 4'b1011; B = 4'b0111; #10;
        $finish;
    end
endmodule