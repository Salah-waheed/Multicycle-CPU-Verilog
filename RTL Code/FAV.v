module FUA(
    input signed [7:0] A, B,
    input        cin,
    input        flag,
    output signed [7:0] sum,
    output       cout
);
wire carry,cinm;
wire [7:0] bm;
assign bm = (flag) ? ~B : B;
assign cinm = (flag) ? ~cin : cin;
    assign {carry, sum} = A + bm + cinm;
    assign cout = (flag) ? ~carry : carry;
endmodule
