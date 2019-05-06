module mux_alu_8bit(acc_src,in_carry,in_zero,in_alu,in_mem,out_data,out_carry,out_zero);
	input acc_src,in_carry,in_zero;
	input [7:0]in_alu,in_mem;
	output [7:0]out_data;
	output out_carry,out_zero;
	
	assign out_zero = acc_src ? in_zero : 1'b0;
	assign out_data = acc_src ? in_alu : in_mem;
	assign out_carry = acc_src ? in_carry : 1'b0;	
/*always@(*)begin
    case(acc_src)
		0:begin 
			out_zero <= 0;
			out_data <=in_mem;
			out_carry <=0;
		end
		1:begin
			out_zero <= in_zero;
			out_data <=in_alu;
			out_carry <=in_carry ;
		end
		default:begin
			out_zero <= 0;
			out_data <=8'h00;
			out_carry <=0;
		end
	endcase

end
*/
endmodule