module controll_unit(opcode,acc_zero,jump,mem_rd,mem_wr,acc_src,acc_wr);
	input [2:0]opcode;
	input acc_zero;
	
	output reg jump , mem_rd, mem_wr, acc_src, acc_wr;

	
	
	always@(opcode)begin
		case(opcode)
		3'b000:begin
			jump<=0;
			mem_rd<=0;
			mem_wr<=0;
			acc_src<=1;
			acc_wr<=1;		
		end
		
		3'b001:begin
			jump<=0;
			mem_rd<=0;
			mem_wr<=0;
			acc_src<=1;
			acc_wr<=1;
		end
		
		3'b010:begin
			jump<=0;
			mem_rd<=1;
			mem_wr<=0;
			acc_src<=0;
			acc_wr<=1;
		end
		
		3'b011:begin
			jump<=0;
			mem_rd<=0;
			mem_wr<=1;
			acc_src<=1;
			acc_wr<=0;
		end
		
		3'b100:begin
			jump<=0;
			mem_rd<=0;
			mem_wr<=0;
			acc_src<=1;
			acc_wr<=1;
		end
		
		3'b101:begin
			jump<=0;
			mem_rd<=1;
			mem_wr<=0;
			acc_src<=1;
			acc_wr<=1;
		end
		
		3'b110:begin
			mem_rd<=0;
			mem_wr<=0;
			acc_src<=1;
			acc_wr<=0;
			jump<=1;
		end
		
		3'b111:begin
			if(acc_zero)begin
				jump<=1;
				mem_rd<=0;
				mem_wr<=0;
				acc_src<=1;
				acc_wr<=0;
			end else
				jump<=0;
			
		end
		default:begin
			jump<=0;
			mem_rd<=0;
			mem_wr<=0;
			acc_src<=0;
			acc_wr<=0;
		end
	
	
		endcase
	end
endmodule