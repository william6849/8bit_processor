module instruct_memory(pc_addr_bus,im_out_addr_bus);
	input [4:0]pc_addr_bus;
	output reg[7:0] im_out_addr_bus;
	
	reg [7:0]im_array[31:0];
	
	always@(pc_addr_bus)begin
		im_out_addr_bus<=im_array[pc_addr_bus];
	end

 initial begin im_array[0]= 8'b00000000; 
	im_array[1]= 8'b01000001; 
im_array[2]= 8'b00000010; 
im_array[3]= 8'b01100011; 
im_array[4]= 8'b10100000;
im_array[5]= 8'b11101000; 
im_array[6]= 8'b01000011;
im_array[7]= 8'b11000010; 
im_array[8]= 8'b11001000; 
im_array[11]= 8'hE0; 
end
endmodule