module ALU(alu_in_a,alu_in_b,opcode,alu_out,carry,out_zero);

input [7:0]alu_in_a,alu_in_b;
input [2:0]opcode;

output reg [7:0]alu_out;
output reg carry,out_zero;

always@(alu_in_b or opcode)
	out_zero <= ((alu_in_a^alu_in_b)==8'h00)?1:0;

always@(alu_in_a or alu_in_b or opcode)begin
	case(opcode)
		3'b000:begin
			{carry,alu_out}<=alu_in_a+alu_in_b;
			/*
			sum_t <= {a_i[3], a_i} + {{2{b_i[2]}}, b_i};
    
			sum_o = (~sum_t[4] &  sum_t[3]) ? 4'b0111 : // + overflow
             	( sum_t[4] & ~sum_t[3]) ? 4'b1000 : // - overflow
                sum_t[3:0];
			*/
		end
		3'b001:alu_out<=alu_in_a-alu_in_b;
		3'b010:alu_out<=0;
		3'b011:alu_out<=0;
		3'b100:alu_out<=alu_in_a&alu_in_b;
		3'b101:alu_out<=alu_in_a^alu_in_b;
		3'b110:alu_out<=0;
		3'b111:alu_out<=0;
		default:alu_out<=0;
	endcase

end

endmodule