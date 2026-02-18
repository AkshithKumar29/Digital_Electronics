`timescale 1ns/1ps
module tb_carry_look_ahead_adder;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    carry_look_ahead_adder uut(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
    initial begin
        $dumpfile("carry_look_ahead_adder.vcd");
        $dumpvars(0, tb_carry_look_ahead_adder);
        $monitor("Time = %0t, A = %b, B = %b, Cin = %b -> Sum = %b, Cout = %b", $time,A,B,Cin,Sum,Cout);
        A = 4'b0001; B = 4'b0101; Cin = 1'b0; #10;
        A = 4'b0011; B = 4'b0111; Cin = 1'b0; #10;
        $finish;
    end
endmodule