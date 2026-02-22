module STATUS_REG(
    input clk,
    input rst,
    input load,          // load new flags
    input alu_cout,
    input alu_V,
    input alu_N,
    input alu_Z,
    output reg [3:0] status  // {C, V, N, Z}
);

    always @(*) begin
        status = 4'b0;
        if (rst)
            status <= 4'b0;
        else if (load) begin
            status[3] <= alu_cout; // C
            status[2] <= alu_V;    // V
            status[1] <= alu_N;    // N
            status[0] <= alu_Z;    // Z
        end
    end
endmodule

