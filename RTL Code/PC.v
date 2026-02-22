module ProgramCounter (
  input clk, rst, load, branch,
  input [7:0] branch_addr,
  output reg [7:0] pc
);
  always @(posedge clk or posedge rst) begin
    if (rst) pc <= 8'b0;
    else if (branch) pc <= branch_addr;        //JUMP
    else if (load) pc <= pc + 1;               //Load 
  end
endmodule
