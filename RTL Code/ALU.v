module ALU_1( 
input signed [7:0] A, B,
input [3:0]        op,
input              cin, flag, alu_en,
output reg signed [7:0] result,
output reg         cout,         // Carry out
                   Z,            // Zero flag
                   N,            // Negative flag
                   V             // Overflow flag
);

// Internel Wires

wire [7:0] sum;
wire c;

FUA fa(A,B,cin,flag,sum,c);

always@(*) begin

// Default outputs

    result = 8'b0;
    cout   = 0;
    V      = 0;
    Z      = 0;
    N      = 0;
    
    if (alu_en) begin  
	case(op)
    
	4'b0000, 4'b0001: begin    // ADD / SUB
		        result = sum;
		        cout = c;
		      end
		      
	4'b0010:   result = A*B;   // Multiply
                     
    4'b0011:   result = (B == 0) ? 8'hFF : (A / B);      // DIV
                      
	4'b0100:   result = A & B;  // AND
                
	4'b0101:   result = A | B;  // OR
                
    4'b0110:   result = A ^ B; // XOR
                
                
    4'b0111: begin             // Logical Shift Left
                cout   = A[7];      // MSB before shift
                result = A << 1;
             end
              
    4'b1000: begin             // Logical Shift Right
                cout   = A[0];      // LSB before shift
                result = A >> 1;
             end
    4'b1001: begin             // Rotate Left
                cout   = A[7];             // MSB rotates out
                result = {A[6:0], A[7]};
             end
             
    4'b1010: begin             // Rotate Right
                cout   = A[0];             // LSB rotates out
                result = {A[0], A[7:1]};
             end
    
endcase
end

        // Update Flags
        
        if (op == 4'b0000 || op == 4'b0001) begin
        // Overflow detection
        if (flag == 0) // addition
            V = (A[7] == B[7]) && (result[7] != A[7]);
        else           // subtraction
            V = (A[7] != B[7]) && (result[7] != A[7]);
    end

    Z = (result == 0);  // Zero flag
    N = result[7];      // Negative flag



end 
endmodule	 
