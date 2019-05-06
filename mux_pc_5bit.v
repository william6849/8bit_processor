module mux_pc_5bit(jump,in_pc,in_ir,out_pc);
	input jump;
	input [4:0]in_pc,in_ir;
	output [4:0]out_pc;
	
	assign out_pc = jump ? in_ir : in_pc;
endmodule