module data_memory(rd,wr,addr_bus,in_data_bus,out_data_bus);
	input rd,wr;
	input [4:0]addr_bus;
	input [7:0]in_data_bus;
	output reg[7:0]out_data_bus;
	
	reg [7:0]mem_arr[31:0];
	
	always@(rd,addr_bus)begin
		if(rd)begin
			out_data_bus<=mem_arr[addr_bus];
		end
	end
	
	always@(wr,in_data_bus)begin
		if(wr)begin
			mem_arr[addr_bus]<=in_data_bus;
		end
	
	end

 initial begin mem_arr[0] = 8'h08; mem_arr[1] = 8'h02; mem_arr[2] = 8'h01;  end

endmodule