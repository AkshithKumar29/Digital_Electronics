module full_subtractor_using_half_subtractor(
    input A, B, Bin,
    output D, Bout
);
    wire D1, B1, B2;
    half_subtractor uut1(.A(A), .B(B), .D(D1), .Bout(B1));
    half_subtractor uut2(.A(D1), .B(Bin), .D(D), .Bout(B2));
    assign Bout = B1 || B2;
endmodule