module GetInitialPermuation(PT, IP); 

input [1:64] PT;
output [0:63] IP;
wire [0:63] IP;

assign IP [0:63] = {PT[58], PT[50], PT[42], PT[34], PT[26], PT[18], PT[10], PT[2],
							PT[60], PT[52], PT[44], PT[36], PT[28], PT[20], PT[12], PT[4],
							PT[62], PT[54], PT[46], PT[38], PT[30], PT[22], PT[14], PT[6],
							PT[64], PT[56], PT[48], PT[40], PT[32], PT[24], PT[16], PT[8],
							PT[57], PT[49], PT[41], PT[33], PT[25], PT[17], PT[9], PT[1],
							PT[59], PT[51], PT[43], PT[35], PT[27], PT[19], PT[11], PT[3],
							PT[61], PT[53], PT[45], PT[37], PT[29], PT[21], PT[13], PT[5],
							PT[63], PT[55], PT[47], PT[39], PT[31], PT[23], PT[15], PT[7]};
endmodule 