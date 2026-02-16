`timescale 1ns/1ps
module tb_half_subtractor;
    reg A, B;
    wire D, Bout;
    half_subtractor uut(.A(A), .B(B), .D(D), .Bout(Bout));
    initial begin
        $dumpfile("half_subtractor.vcd");
        $dumpvars(0, tb_half_subtractor);
        $monitor("Time = %0t, A = %b, B = %b -> D = %b, Bout = %b",$time,A,B,D,Bout);
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end
endmodule