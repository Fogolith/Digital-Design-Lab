//Split_64 Badass band

module Split_64 (whole, left, right); 
input [63:0] whole; 
output [31:0] left, right; 
wire [31:0] left, right; 
assign left[31:0] = whole[63:32]; 
assign right [31:0] = whole[31:0]; 

endmodule