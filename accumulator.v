module accumulator(clk,rst,acc_wr,in_mux,in_carry,in_zero,out_data,out_carry,out_zero);
	input rst,clk,acc_wr,in_carry,in_zero;
	input [7:0]in_mux;
	output reg [7:0] out_data;
	output  reg out_carry,out_zero; 
	

	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			out_data<=8'h00;
			
		end else begin

		if (acc_wr)begin
			out_data<=in_mux;
			out_zero<=in_zero;
			out_carry<=in_carry;
		end
		
		end
		
	end
	
	
/*/ini	
	initial begin
			out_data=8'h00;
			out_carry=1'b0;
			out_zero=1'b0;
	end
	*/
	
endmodule