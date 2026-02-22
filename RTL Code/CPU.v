module CPU(
    input         clk, rst,
    output  [7:0] alu_result, 
    output  [3:0] stat      
);
    // Control signals
    wire        pc_ld, mem_wrt, mem_en, ir_ld, stat_ld, alu_flag, pc_branch, flush, alu_en;
    wire [3:0]  opcode, reg_out;

    // Datapath <-> CPU wires
    wire [15:0] instr_w;
    wire [7:0]  operandA, operandB, branch_addr;

    // ALU <-> Status wires
    wire alu_cout, alu_Z, alu_N, alu_V;

    // Control Unit
    CU CU22 (
        .clk(clk),
        .rst(rst),
	    .inst(instr_w),
        .pc_ld(pc_ld),
	    .ir_ld(ir_ld),
	    .mem_en(mem_en),
        .mem_wrt(mem_wrt),
        .stat_ld(stat_ld),
	    .alu_flag(alu_flag),
	    .pc_branch(pc_branch),
	    .flush(flush),
	    .alu_en(alu_en),
        .opcode(opcode),
        .reg_out(reg_out),
	    .branch_addr(branch_addr)
    );

    // Datapath
    Datapath DP (
        .clk(clk),
        .rst(rst),
        .pc_ld(pc_ld),
        .ir_ld(ir_ld),
        .mem_en(mem_en),
        .mem_wrt(mem_wrt),
	    .pc_branch(pc_branch),
	    .flush(flush),
	    .reg_out(reg_out),
        .alu_result(alu_result),
	    .branch_addr(branch_addr),
	    .inst(instr_w),
        .regA(operandA),
        .regB(operandB)
    );

    // ALU
    ALU_1 ALU (
        .A(operandA),
        .B(operandB),
        .op(opcode),
        .cin(1'b0),
        .flag(alu_flag),
        .alu_en(alu_en),
        .result(alu_result),
        .cout(alu_cout),
        .Z(alu_Z),
        .N(alu_N),
        .V(alu_V)
    );

    // Status Register
    STATUS_REG SR (
        .clk(clk),
        .rst(rst),
        .load(stat_ld),
        .alu_cout(alu_cout),
        .alu_V(alu_V),
        .alu_N(alu_N),
        .alu_Z(alu_Z),
	    .status(stat)
    );

endmodule

