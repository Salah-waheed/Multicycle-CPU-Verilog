module CU (
    input             clk, rst,
    input  wire [15:0] inst,    // from IR
    output reg        pc_ld, ir_ld, mem_en, mem_wrt, stat_ld, alu_flag, pc_branch, flush,alu_en,     
    output reg [3:0]  opcode, reg_out,
    output reg [7:0]  branch_addr
);

// FSM States

    parameter FETCH   = 2'b00;
    parameter DECODE  = 2'b01;
    parameter EXECUTE = 2'b10;

    reg [1:0] cur_stat = FETCH;

    // FSM state update (SEQ)
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            cur_stat <= FETCH;
        else if (cur_stat == EXECUTE)
            cur_stat <= FETCH;
        else
            cur_stat <= cur_stat + 1;
    end

    // FSM outputs (COMB)
    
    always @(*) begin
    
    // Default values
    
        pc_ld=0; mem_wrt=0; ir_ld=0; mem_en=0; stat_ld=0;
        alu_flag=0; opcode=8'b1111; reg_out=0; pc_branch = 0;
        branch_addr = 8'b0; flush = 0;
        alu_en = 0;
        
        // Control signaLS
        
        case(cur_stat)
        
        // FETCH Stage
        
            FETCH: begin
                pc_ld = 1;      // Increment/load PC
                ir_ld = 1;      // Load instruction into IR
                mem_en = 1;     // Enable instruction memory
            end

        // DECODE Stage
        
            DECODE: begin
		        mem_en = 1;       // Enable register file read
                opcode  = inst[15:12];      // Extract opcode
                reg_out = inst[11:8];       // Extract destination register
            end

        // EXECUTE Stage
        
            EXECUTE: begin
            
                alu_en = 1;     // Enable ALU
                mem_en = 1;     // Enable register file read
                opcode  = inst[15:12];
                reg_out = inst[11:8];
            
                stat_ld = (inst[15:12] <= 4'b1010); // Only for valid Arthimatic and Logical opcodes
                mem_wrt = (inst[15:12] <= 4'b1010); // Write for all defined opcodes
                alu_flag = (inst[15:12] == 4'b0001); // 1 for SUB, 0 otherwise
            
    		// Jump instruction (1011)
    		
    		if(opcode == 4'b1011) begin     // JMP
		        pc_branch = 1 ;
                branch_addr = inst[7:0];
                flush = 1; // Flush on JMP
            end
            
            // Load Immediate instruction (1100)
            
            if (opcode == 4'b1100) // LDI
                mem_wrt = 1;
            end
            
        endcase
    end
endmodule

