module full_adder_using_half_adder(
    input A, B, Cin, 
    output Sum, Cout
);
    wire s1, c1, c2;
    half_adder uut1(.A(A), .B(B), .Sum(s1), .Cout(c1));
    half_adder uut2(.A(s1), .B(Cin), .Sum(Sum), .Cout(c2));
    or uut3(Cout, c1, c2);
endmodule