//Split_56 Badass band

module Split_56 (whole, left, right); 
input [55:0] whole; 
output [27:0] left, right; 
wire [27:0] left, right; 
assign left[27:0] = whole[55:28]; 
assign right = whole[27:0]; 

endmodule