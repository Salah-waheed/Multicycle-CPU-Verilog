module Datapath (
    input  clk, rst, pc_ld, ir_ld, mem_en, mem_wrt, pc_branch, flush,
    input  [3:0] reg_out,
    input  [7:0] alu_result, branch_addr,
    output wire [15:0] inst,
    output wire [7:0] regA, regB
);

//  LDI Instruction

wire [7:0] write_data_mux;

assign write_data_mux = (inst[15:12] == 4'b1100) ? inst[7:0] : alu_result;

    // IR + PC + Instruction Memory
    InstructionRegister IR (
        .clk(clk),
        .rst(rst),
        .load(ir_ld),
        .pc_ld(pc_ld),
	    .branch(pc_branch),
	    .branch_addr(branch_addr),
	    .flush(flush),
        .instr_out(inst)   // goes to CU
    );

    // Register File
    REG RF (
        .clk(clk),
        .rst(rst),
        .writ_en(mem_wrt),
	    .mem_en(mem_en),
        .read_addr1(inst[3:0]),
        .read_addr2(inst[7:4]),
        .writ_addr(reg_out),
        .writ_data(write_data_mux), // write-back result from ALU
        .read_data1(regA),
        .read_data2(regB)
    );


endmodule

