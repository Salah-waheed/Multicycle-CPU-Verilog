module REG(
input       clk , rst, writ_en, mem_en,
input [3:0] read_addr1, read_addr2, writ_addr,
input [7:0] writ_data,
output reg [7:0] read_data1, read_data2
);

reg [7:0] regs [0:15];

    integer i;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 16; i = i + 1)
                regs[i] <= {8'b0};
        end
            else if (writ_en) begin
            regs[writ_addr] <= writ_data; // Write operation
        end
    end

always @(*) begin
    if (mem_en) begin
        read_data1 = regs[read_addr1];   // Read operand A
        read_data2 = regs[read_addr2];   // Read operand B
    end else begin
        read_data1 = 8'b0;
        read_data2 = 8'b0;
    end
end
endmodule
