module PC(rst_n,clk,in_addr,out_addr);
	input rst_n,clk;
	input [4:0]in_addr;
	output reg [4:0]out_addr;
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			out_addr <= 5'b00000;
		end else 
			out_addr <= in_addr;
	
	end
	

endmodule