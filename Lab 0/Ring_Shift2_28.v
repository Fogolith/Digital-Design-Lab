module Ring_Shift2_28(in, out);
input [27:0] in; 
output [27:0] out; 
assign out[27:0] = {in[25:0], in[27:26]}; 

endmodule 