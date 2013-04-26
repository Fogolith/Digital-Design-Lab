module GetPPermutation(S, Pout); 

input [1:32] S;
output [1:32] Pout;
wire [1:32] Pout;

assign Pout [1:32] = {S[16], S[7], S[20], S[21],
							 S[29], S[12], S[28], S[17],
							 S[1], S[15], S[23], S[26],
							 S[5], S[18], S[31], S[10],
							 S[2], S[8], S[24], S[14],
							 S[32], S[27], S[3], S[9],
							 S[19], S[13], S[30], S[6],
							 S[22], S[11], S[4], S[25]}; 
endmodule 