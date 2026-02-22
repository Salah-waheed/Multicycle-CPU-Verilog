module InstMem (
  input  [7:0] addr,
  output [15:0] data
);
  reg [15:0] mem [0:255];
   integer i;
    initial begin
        // Initialize all memory to 0
        for (i = 0; i < 256; i = i + 1) begin
            mem[i] = 16'h0000;
        end
        // Hardcode test instructions
        mem[0] = 16'hC005;   // LDI R0, 0x05
        mem[1] = 16'hC103;   // LDI R1, 0x03
        mem[2] = 16'h0201;   // ADD R2, R0, R1
        mem[3] = 16'h1301;   // SUB R3, R0, R1
        mem[4] = 16'h2401;   // MUL R4, R0, R1
        mem[5] = 16'h3501;   // DIV R5, R0, R1
        mem[6] = 16'h4601;   // AND R6, R0, R1
        mem[7] = 16'h5701;   // OR R7, R0, R1
        mem[8] = 16'h6801;   // XOR R8, R0, R1
        mem[9] = 16'h7900;   // LSL R9, R0
        mem[10] = 16'h8A00;   // LSR R10, R0
        mem[11] = 16'h9B00;   // ROL R11, R0
        mem[12] = 16'hAC00;  // ROR R12, R0
        mem[13] = 16'hB020;  // JMP 0x20
        mem[32] = 16'h1D24;  // SUB R13, R2, R4
        // Debug output
        $display("InstMem: mem[0]=%h, mem[1]=%h, mem[32]=%h", mem[0], mem[1], mem[32]);
    end
    assign data = mem[addr];
endmodule
