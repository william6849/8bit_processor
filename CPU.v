module CPU(clk,rst,mem_out_data_bus,mem_in_data_bus,mem_in_addr_bus,im_addr_bus,im_data_bus,mem_rd,mem_wr);
	input clk,rst;
	input [7:0]mem_out_data_bus;
	output [7:0]mem_in_data_bus;
	output [4:0]mem_in_addr_bus;
	output [4:0]im_addr_bus;
	input [7:0]im_data_bus;
	
	output mem_rd,mem_wr;
	
	wire [2:0]opcode;
	wire acc_z;
	wire acc_src,acc_wr;
	
	datapath dp(clk,rst,jump,acc_src,acc_wr,mem_out_data_bus,mem_in_data_bus,mem_in_addr_bus,im_addr_bus,im_data_bus,opcode,acc_z);

	controll_unit cu(opcode,acc_z,jump,mem_rd,mem_wr,acc_src,acc_wr);
	

endmodule