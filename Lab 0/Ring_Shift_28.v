module Ring_Shift_28(in, out);
input [27:0] in; 
output [27:0] out; 
assign out[27:0] = {in[26:0], in[27]}; 

endmodule 