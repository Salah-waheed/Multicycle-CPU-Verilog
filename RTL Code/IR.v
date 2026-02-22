module InstructionRegister (
  input  clk, rst, load,pc_ld, branch,flush,  
  input  [7:0] branch_addr,  
  output reg [15:0] instr_out
);

      // Internal signals

  wire [7:0] pc_w;
  wire [15:0] instr_w;
  
     // Program Counter
     
  ProgramCounter PC_inst(.clk(clk), .rst(rst), .load(pc_ld), .branch(branch),.branch_addr(branch_addr), .pc(pc_w));
  
     // Instruction Memory
     
  InstMem IM(.addr(pc_w), .data(instr_w));

  always @(posedge clk or posedge rst) begin
    if (rst || flush) instr_out <= 16'b0;   // Clear instruction on reset/flush
    
    else if (load) instr_out <= instr_w;    // Load new instruction
  end
endmodule
