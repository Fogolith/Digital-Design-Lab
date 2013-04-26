module GetSubKeys(CD, keyOut); 

input [1:56] CD;
output [0:47] keyOut;
wire [0:47] keyOut;

assign keyOut [0:47] = {CD[14], CD[17], CD[11], CD[24], CD[1], CD[5],
								CD[3], CD[28], CD[15], CD[6], CD[21], CD[10],
								CD[23], CD[19], CD[12], CD[4], CD[26], CD[8],
								CD[16], CD[7], CD[27], CD[20], CD[13], CD[2],
								CD[41], CD[52], CD[31], CD[37], CD[47], CD[55],
								CD[30], CD[40], CD[51], CD[45], CD[33], CD[48],
								CD[44], CD[49], CD[39], CD[56], CD[34], CD[53],
								CD[46], CD[42], CD[50], CD[36], CD[29], CD[32]};
endmodule 