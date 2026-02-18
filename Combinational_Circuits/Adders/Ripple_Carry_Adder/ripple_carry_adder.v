module ripple_carry_adder(
    input [3:0] A, B,
    output [3:0] Sum,
    output Cout
);
    wire C0, C1, C2;
    half_adder HA0(.A(A[0]), .B(B[0]), .Sum(Sum[0]), .Cout(C0));
    full_adder FA0(.A(A[1]), .B(B[1]), .Cin(C0), .Sum(Sum[1]), .Cout(C1));
    full_adder FA1(.A(A[2]), .B(B[2]), .Cin(C1), .Sum(Sum[2]), .Cout(C2));
    full_adder FA3(.A(A[3]), .B(B[3]), .Cin(C2), .Sum(Sum[3]), .Cout(Cout));
endmodule