module datapath(clk,rst,jump,acc_src,acc_wr,mem_out_data_bus,mem_in_data_bus,mem_in_addr_bus,im_addr_bus,im_data_bus,opcode,acc_z);
	input clk,rst,acc_src,acc_wr,jump;
	input [7:0]mem_out_data_bus;
	output [7:0]mem_in_data_bus;
	output [4:0]mem_in_addr_bus;
	output [4:0]im_addr_bus;
	input [7:0]im_data_bus;
	output [2:0]opcode;
	output acc_z;
	
	wire [7:0]mux2_o,acc_o,alu_o;
	wire [4:0]pc_o,pc_add_o,mux1_o,im_addr;
	
	wire mux2_c,mux2_z,acc_c,acc_z,alu_c,alu_z;
	
	ALU al(acc_o,mem_out_data_bus,opcode,alu_o,alu_c,alu_z);
	mux_alu_8bit mux2(acc_src,alu_c,alu_z,alu_o,mem_out_data_bus,mux2_o,mux2_c,mux2_z);
	accumulator acc(clk,rst,acc_wr,mux2_o,mux2_c,mux2_z,acc_o,acc_c,acc_z);
	PC programe_count(rst,clk,mux1_o,pc_o);
	PC_add pcadder(pc_o,5'b00001,pc_add_o);
	mux_pc_5bit mux1(jump,pc_add_o,im_data_bus[4:0],mux1_o);

	assign mem_in_addr_bus = im_data_bus[4:0];
	assign opcode = im_data_bus[7:5];
	assign im_addr_bus = pc_o;
	assign mem_in_data_bus = acc_o;

endmodule