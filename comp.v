
module comp;
	reg clk;
	reg rst;
	wire [7:0]im_data_bus,mem_in_data_bus,mem_out_data_bus;
	wire [4:0]im_addr_bus,mem_in_addr_bus;
	wire mem_rd,mem_wr;


	CPU cp(clk,rst,mem_out_data_bus,mem_in_data_bus,mem_in_addr_bus,im_addr_bus,im_data_bus,mem_rd,mem_wr);
	
	data_memory dm(mem_rd,mem_wr,mem_in_addr_bus,mem_in_data_bus,mem_out_data_bus);
	
	instruct_memory im(im_addr_bus,im_data_bus);
	
	initial
		begin
			clk=0;rst=0;
			#5 rst=1;
			#2000 $finish;
			
		
		end


	always
	 #10 clk=~clk;
	
	
endmodule