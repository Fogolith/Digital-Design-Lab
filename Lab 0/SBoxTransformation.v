module SBoxTransformation(KE, Sout); 
input [0:47] KE; 
output [0:31] Sout; 
reg [0:31] Sout; 
wire [5:0] Split [1:8]; 
wire [5:0] SplitOrdered [1:8]; 

assign Split[1] = KE[0:5]; 
assign Split[2] = KE[6:11];
assign Split[3] = KE[12:17];
assign Split[4] = KE[18:23];
assign Split[5] = KE[24:29];
assign Split[6] = KE[30:35];
assign Split[7] = KE[36:41];
assign Split[8] = KE[42:47];

assign SplitOrdered[1] = {Split[1][5], Split[1][0], Split[1][4 : 1]};
assign SplitOrdered[2] = {Split[2][5], Split[2][0], Split[2][4 : 1]};
assign SplitOrdered[3] = {Split[3][5], Split[3][0], Split[3][4 : 1]};
assign SplitOrdered[4] = {Split[4][5], Split[4][0], Split[4][4 : 1]};
assign SplitOrdered[5] = {Split[5][5], Split[5][0], Split[5][4 : 1]};
assign SplitOrdered[6] = {Split[6][5], Split[6][0], Split[6][4 : 1]};
assign SplitOrdered[7] = {Split[7][5], Split[7][0], Split[7][4 : 1]};
assign SplitOrdered[8] = {Split[8][5], Split[8][0], Split[8][4 : 1]};


always @(SplitOrdered[1])
  begin 
	 case (SplitOrdered[1])
			6'b000000: Sout[0:3] <= 4'hE;
			6'b000001: Sout[0:3] <= 4'h4;
			6'b000010: Sout[0:3] <= 4'hD;
			6'b000011: Sout[0:3] <= 4'h1;
			6'b000100: Sout[0:3] <= 4'h2;
			6'b000101: Sout[0:3] <= 4'hF;
			6'b000110: Sout[0:3] <= 4'hB;
			6'b000111: Sout[0:3] <= 4'h8;
			6'b001000: Sout[0:3] <= 4'h3;
			6'b001001: Sout[0:3] <= 4'hA;
			6'b001010: Sout[0:3] <= 4'h6;
			6'b001011: Sout[0:3] <= 4'hC;
			6'b001100: Sout[0:3] <= 4'h5;
			6'b001101: Sout[0:3] <= 4'h9;
			6'b001110: Sout[0:3] <= 4'h0;
			6'b001111: Sout[0:3] <= 4'h7;
			6'b010000: Sout[0:3] <= 4'h0;
			6'b010001: Sout[0:3] <= 4'hF;
			6'b010010: Sout[0:3] <= 4'h7;
			6'b010011: Sout[0:3] <= 4'h4;
			6'b010100: Sout[0:3] <= 4'hE;
			6'b010101: Sout[0:3] <= 4'h2;
			6'b010110: Sout[0:3] <= 4'hD;
			6'b010111: Sout[0:3] <= 4'h1;
			6'b011000: Sout[0:3] <= 4'hA;
			6'b011001: Sout[0:3] <= 4'h6;
			6'b011010: Sout[0:3] <= 4'hC;
			6'b011011: Sout[0:3] <= 4'hB;
			6'b011100: Sout[0:3] <= 4'h9;
			6'b011101: Sout[0:3] <= 4'h5;
			6'b011110: Sout[0:3] <= 4'h3;
			6'b011111: Sout[0:3] <= 4'h8;
			6'b100000: Sout[0:3] <= 4'h4;
			6'b100001: Sout[0:3] <= 4'h1;
			6'b100010: Sout[0:3] <= 4'hE;
			6'b100011: Sout[0:3] <= 4'h8;
			6'b100100: Sout[0:3] <= 4'hD;
			6'b100101: Sout[0:3] <= 4'h6;
			6'b100110: Sout[0:3] <= 4'h2;
			6'b100111: Sout[0:3] <= 4'hB;
			6'b101000: Sout[0:3] <= 4'hF;
			6'b101001: Sout[0:3] <= 4'hC;
			6'b101010: Sout[0:3] <= 4'h9;
			6'b101011: Sout[0:3] <= 4'h7;
			6'b101100: Sout[0:3] <= 4'h3;
			6'b101101: Sout[0:3] <= 4'hA;
			6'b101110: Sout[0:3] <= 4'h5;
			6'b101111: Sout[0:3] <= 4'h0;
			6'b110000: Sout[0:3] <= 4'hF;
			6'b110001: Sout[0:3] <= 4'hC;
			6'b110010: Sout[0:3] <= 4'h8;
			6'b110011: Sout[0:3] <= 4'h2;
			6'b110100: Sout[0:3] <= 4'h4;
			6'b110101: Sout[0:3] <= 4'h9;
			6'b110110: Sout[0:3] <= 4'h1;
			6'b110111: Sout[0:3] <= 4'h7;
			6'b111000: Sout[0:3] <= 4'h5;
			6'b111001: Sout[0:3] <= 4'hB;
			6'b111010: Sout[0:3] <= 4'h3;
			6'b111011: Sout[0:3] <= 4'hE;
			6'b111100: Sout[0:3] <= 4'hA;
			6'b111101: Sout[0:3] <= 4'h0;
			6'b111110: Sout[0:3] <= 4'h6;
			6'b111111: Sout[0:3] <= 4'hD;
			default:   Sout[0:3] <= 4'h0;
		endcase
	end
	
always @(SplitOrdered[2])
  begin
	 case(SplitOrdered[2])
		6'b000000: Sout[4:7] <= 4'hF;
		6'b000001: Sout[4:7] <= 4'h1;
		6'b000010: Sout[4:7] <= 4'h8;
		6'b000011: Sout[4:7] <= 4'hE;
		6'b000100: Sout[4:7] <= 4'h6;
		6'b000101: Sout[4:7] <= 4'hB;
		6'b000110: Sout[4:7] <= 4'h3;
		6'b000111: Sout[4:7] <= 4'h4;
		6'b001000: Sout[4:7] <= 4'h9;
		6'b001001: Sout[4:7] <= 4'h7;
		6'b001010: Sout[4:7] <= 4'h2;
		6'b001011: Sout[4:7] <= 4'hD;
		6'b001100: Sout[4:7] <= 4'hC;
		6'b001101: Sout[4:7] <= 4'h0;
		6'b001110: Sout[4:7] <= 4'h5;
		6'b001111: Sout[4:7] <= 4'hA;
		6'b010000: Sout[4:7] <= 4'h3;
		6'b010001: Sout[4:7] <= 4'hD;
		6'b010010: Sout[4:7] <= 4'h4;
		6'b010011: Sout[4:7] <= 4'h7;
		6'b010100: Sout[4:7] <= 4'hF;
		6'b010101: Sout[4:7] <= 4'h2;
		6'b010110: Sout[4:7] <= 4'h8;
		6'b010111: Sout[4:7] <= 4'hE;
		6'b011000: Sout[4:7] <= 4'hC;
		6'b011001: Sout[4:7] <= 4'h0;
		6'b011010: Sout[4:7] <= 4'h1;
		6'b011011: Sout[4:7] <= 4'hA;
		6'b011100: Sout[4:7] <= 4'h6;
		6'b011101: Sout[4:7] <= 4'h9;
		6'b011110: Sout[4:7] <= 4'hB;
		6'b011111: Sout[4:7] <= 4'h5;
		6'b100000: Sout[4:7] <= 4'h0;
		6'b100001: Sout[4:7] <= 4'hE;
		6'b100010: Sout[4:7] <= 4'h7;
		6'b100011: Sout[4:7] <= 4'hB;
		6'b100100: Sout[4:7] <= 4'hA;
		6'b100101: Sout[4:7] <= 4'h4;
		6'b100110: Sout[4:7] <= 4'hD;
		6'b100111: Sout[4:7] <= 4'h1;
		6'b101000: Sout[4:7] <= 4'h5;
		6'b101001: Sout[4:7] <= 4'h8;
		6'b101010: Sout[4:7] <= 4'hC;
		6'b101011: Sout[4:7] <= 4'h6;
		6'b101100: Sout[4:7] <= 4'h9;
		6'b101101: Sout[4:7] <= 4'h3;
		6'b101110: Sout[4:7] <= 4'h2;
		6'b101111: Sout[4:7] <= 4'hF;
		6'b110000: Sout[4:7] <= 4'hD;
		6'b110001: Sout[4:7] <= 4'h8;
		6'b110010: Sout[4:7] <= 4'hA;
		6'b110011: Sout[4:7] <= 4'h1;
		6'b110100: Sout[4:7] <= 4'h3;
		6'b110101: Sout[4:7] <= 4'hF;
		6'b110110: Sout[4:7] <= 4'h4;
		6'b110111: Sout[4:7] <= 4'h2;
		6'b111000: Sout[4:7] <= 4'hB;
		6'b111001: Sout[4:7] <= 4'h6;
		6'b111010: Sout[4:7] <= 4'h7;
		6'b111011: Sout[4:7] <= 4'hC;
		6'b111100: Sout[4:7] <= 4'h0;
		6'b111101: Sout[4:7] <= 4'h5;
		6'b111110: Sout[4:7] <= 4'hE;
		6'b111111: Sout[4:7] <= 4'h9;
		default:   Sout[4:7] <= 4'h0;
	endcase
end

always @(SplitOrdered[3])
  begin
	case(SplitOrdered[3])
		6'b000000: Sout[8:11] <= 4'hA;
		6'b000001: Sout[8:11] <= 4'h0;
		6'b000010: Sout[8:11] <= 4'h9;
		6'b000011: Sout[8:11] <= 4'hE;
		6'b000100: Sout[8:11] <= 4'h6;
		6'b000101: Sout[8:11] <= 4'h3;
		6'b000110: Sout[8:11] <= 4'hF;
		6'b000111: Sout[8:11] <= 4'h5;
		6'b001000: Sout[8:11] <= 4'h1;
		6'b001001: Sout[8:11] <= 4'hD;
		6'b001010: Sout[8:11] <= 4'hC;
		6'b001011: Sout[8:11] <= 4'h7;
		6'b001100: Sout[8:11] <= 4'hB;
		6'b001101: Sout[8:11] <= 4'h4;
		6'b001110: Sout[8:11] <= 4'h2;
		6'b001111: Sout[8:11] <= 4'h8;
		6'b010000: Sout[8:11] <= 4'hD;
		6'b010001: Sout[8:11] <= 4'h7;
		6'b010010: Sout[8:11] <= 4'h0;
		6'b010011: Sout[8:11] <= 4'h9;
		6'b010100: Sout[8:11] <= 4'h3;
		6'b010101: Sout[8:11] <= 4'h4;
		6'b010110: Sout[8:11] <= 4'h6;
		6'b010111: Sout[8:11] <= 4'hA;
		6'b011000: Sout[8:11] <= 4'h2;
		6'b011001: Sout[8:11] <= 4'h8;
		6'b011010: Sout[8:11] <= 4'h5;
		6'b011011: Sout[8:11] <= 4'hE;
		6'b011100: Sout[8:11] <= 4'hC;
		6'b011101: Sout[8:11] <= 4'hB;
		6'b011110: Sout[8:11] <= 4'hF;
		6'b011111: Sout[8:11] <= 4'h1;
		6'b100000: Sout[8:11] <= 4'hD;
		6'b100001: Sout[8:11] <= 4'h6;
		6'b100010: Sout[8:11] <= 4'h4;
		6'b100011: Sout[8:11] <= 4'h9;
		6'b100100: Sout[8:11] <= 4'h8;
		6'b100101: Sout[8:11] <= 4'hF;
		6'b100110: Sout[8:11] <= 4'h3;
		6'b100111: Sout[8:11] <= 4'h0;
		6'b101000: Sout[8:11] <= 4'hB;
		6'b101001: Sout[8:11] <= 4'h1;
		6'b101010: Sout[8:11] <= 4'h2;
		6'b101011: Sout[8:11] <= 4'hC;
		6'b101100: Sout[8:11] <= 4'h5;
		6'b101101: Sout[8:11] <= 4'hA;
		6'b101110: Sout[8:11] <= 4'hE;
		6'b101111: Sout[8:11] <= 4'h7;
		6'b110000: Sout[8:11] <= 4'h1;
		6'b110001: Sout[8:11] <= 4'hA;
		6'b110010: Sout[8:11] <= 4'hD;
		6'b110011: Sout[8:11] <= 4'h0;
		6'b110100: Sout[8:11] <= 4'h6;
		6'b110101: Sout[8:11] <= 4'h9;
		6'b110110: Sout[8:11] <= 4'h8;
		6'b110111: Sout[8:11] <= 4'h7;
		6'b111000: Sout[8:11] <= 4'h4;
		6'b111001: Sout[8:11] <= 4'hF;
		6'b111010: Sout[8:11] <= 4'hE;
		6'b111011: Sout[8:11] <= 4'h3;
		6'b111100: Sout[8:11] <= 4'hB;
		6'b111101: Sout[8:11] <= 4'h5;
		6'b111110: Sout[8:11] <= 4'h2;
		6'b111111: Sout[8:11] <= 4'hC;
		default:   Sout[8:11] <= 4'h0;		
	endcase		
end

always @(SplitOrdered[4])
  begin
	case(SplitOrdered[4])
		6'b000000: Sout[12:15] <= 4'h7;
		6'b000001: Sout[12:15] <= 4'hD;
		6'b000010: Sout[12:15] <= 4'hE;
		6'b000011: Sout[12:15] <= 4'h3;
		6'b000100: Sout[12:15] <= 4'h0;
		6'b000101: Sout[12:15] <= 4'h6;
		6'b000110: Sout[12:15] <= 4'h9;
		6'b000111: Sout[12:15] <= 4'hA;
		6'b001000: Sout[12:15] <= 4'h1;
		6'b001001: Sout[12:15] <= 4'h2;
		6'b001010: Sout[12:15] <= 4'h8;
		6'b001011: Sout[12:15] <= 4'h5;
		6'b001100: Sout[12:15] <= 4'hB;
		6'b001101: Sout[12:15] <= 4'hC;
		6'b001110: Sout[12:15] <= 4'h4;
		6'b001111: Sout[12:15] <= 4'hF;
		6'b010000: Sout[12:15] <= 4'hD;
		6'b010001: Sout[12:15] <= 4'h8;
		6'b010010: Sout[12:15] <= 4'hB;
		6'b010011: Sout[12:15] <= 4'h5;
		6'b010100: Sout[12:15] <= 4'h6;
		6'b010101: Sout[12:15] <= 4'hF;
		6'b010110: Sout[12:15] <= 4'h0;
		6'b010111: Sout[12:15] <= 4'h3;
		6'b011000: Sout[12:15] <= 4'h4;
		6'b011001: Sout[12:15] <= 4'h7;
		6'b011010: Sout[12:15] <= 4'h2;
		6'b011011: Sout[12:15] <= 4'hC;
		6'b011100: Sout[12:15] <= 4'h1;
		6'b011101: Sout[12:15] <= 4'hA;
		6'b011110: Sout[12:15] <= 4'hE;
		6'b011111: Sout[12:15] <= 4'h9;
		6'b100000: Sout[12:15] <= 4'hA;
		6'b100001: Sout[12:15] <= 4'h6;
		6'b100010: Sout[12:15] <= 4'h9;
		6'b100011: Sout[12:15] <= 4'h0;
		6'b100100: Sout[12:15] <= 4'hC;
		6'b100101: Sout[12:15] <= 4'hB;
		6'b100110: Sout[12:15] <= 4'h7;
		6'b100111: Sout[12:15] <= 4'hD;
		6'b101000: Sout[12:15] <= 4'hF;
		6'b101001: Sout[12:15] <= 4'h1;
		6'b101010: Sout[12:15] <= 4'h3;
		6'b101011: Sout[12:15] <= 4'hE;
		6'b101100: Sout[12:15] <= 4'h5;
		6'b101101: Sout[12:15] <= 4'h2;
		6'b101110: Sout[12:15] <= 4'h8;
		6'b101111: Sout[12:15] <= 4'h4;
		6'b110000: Sout[12:15] <= 4'h3;
		6'b110001: Sout[12:15] <= 4'hF;
		6'b110010: Sout[12:15] <= 4'h0;
		6'b110011: Sout[12:15] <= 4'h6;
		6'b110100: Sout[12:15] <= 4'hA;
		6'b110101: Sout[12:15] <= 4'h1;
		6'b110110: Sout[12:15] <= 4'hD;
		6'b110111: Sout[12:15] <= 4'h8;
		6'b111000: Sout[12:15] <= 4'h9;
		6'b111001: Sout[12:15] <= 4'h4;
		6'b111010: Sout[12:15] <= 4'h5;
		6'b111011: Sout[12:15] <= 4'hB;
		6'b111100: Sout[12:15] <= 4'hC;
		6'b111101: Sout[12:15] <= 4'h7;
		6'b111110: Sout[12:15] <= 4'h2;
		6'b111111: Sout[12:15] <= 4'hE;
		default:   Sout[12:15] <= 4'h0;
	endcase	
end

always @(SplitOrdered[5])
  begin
	case(SplitOrdered[5])
		6'b000000: Sout[16:19] <= 4'h2;
		6'b000001: Sout[16:19] <= 4'hC;
		6'b000010: Sout[16:19] <= 4'h4;
		6'b000011: Sout[16:19] <= 4'h1;
		6'b000100: Sout[16:19] <= 4'h7;
		6'b000101: Sout[16:19] <= 4'hA;
		6'b000110: Sout[16:19] <= 4'hB;
		6'b000111: Sout[16:19] <= 4'h6;
		6'b001000: Sout[16:19] <= 4'h8;
		6'b001001: Sout[16:19] <= 4'h5;
		6'b001010: Sout[16:19] <= 4'h3;
		6'b001011: Sout[16:19] <= 4'hF;
		6'b001100: Sout[16:19] <= 4'hD;
		6'b001101: Sout[16:19] <= 4'h0;
		6'b001110: Sout[16:19] <= 4'hE;
		6'b001111: Sout[16:19] <= 4'h9;
		6'b010000: Sout[16:19] <= 4'hE;
		6'b010001: Sout[16:19] <= 4'hB;
		6'b010010: Sout[16:19] <= 4'h2;
		6'b010011: Sout[16:19] <= 4'hC;
		6'b010100: Sout[16:19] <= 4'h4;
		6'b010101: Sout[16:19] <= 4'h7;
		6'b010110: Sout[16:19] <= 4'hD;
		6'b010111: Sout[16:19] <= 4'h1;
		6'b011000: Sout[16:19] <= 4'h5;
		6'b011001: Sout[16:19] <= 4'h0;
		6'b011010: Sout[16:19] <= 4'hF;
		6'b011011: Sout[16:19] <= 4'hA;
		6'b011100: Sout[16:19] <= 4'h3;
		6'b011101: Sout[16:19] <= 4'h9;
		6'b011110: Sout[16:19] <= 4'h8;
		6'b011111: Sout[16:19] <= 4'h6;
		6'b100000: Sout[16:19] <= 4'h4;
		6'b100001: Sout[16:19] <= 4'h2;
		6'b100010: Sout[16:19] <= 4'h1;
		6'b100011: Sout[16:19] <= 4'hB;
		6'b100100: Sout[16:19] <= 4'hA;
		6'b100101: Sout[16:19] <= 4'hD;
		6'b100110: Sout[16:19] <= 4'h7;
		6'b100111: Sout[16:19] <= 4'h8;
		6'b101000: Sout[16:19] <= 4'hF;
		6'b101001: Sout[16:19] <= 4'h9;
		6'b101010: Sout[16:19] <= 4'hC;
		6'b101011: Sout[16:19] <= 4'h5;
		6'b101100: Sout[16:19] <= 4'h6;
		6'b101101: Sout[16:19] <= 4'h3;
		6'b101110: Sout[16:19] <= 4'h0;
		6'b101111: Sout[16:19] <= 4'hE;
		6'b110000: Sout[16:19] <= 4'hB;
		6'b110001: Sout[16:19] <= 4'h8;
		6'b110010: Sout[16:19] <= 4'hC;
		6'b110011: Sout[16:19] <= 4'h7;
		6'b110100: Sout[16:19] <= 4'h1;
		6'b110101: Sout[16:19] <= 4'hE;
		6'b110110: Sout[16:19] <= 4'h2;
		6'b110111: Sout[16:19] <= 4'hD;
		6'b111000: Sout[16:19] <= 4'h6;
		6'b111001: Sout[16:19] <= 4'hF;
		6'b111010: Sout[16:19] <= 4'h0;
		6'b111011: Sout[16:19] <= 4'h9;
		6'b111100: Sout[16:19] <= 4'hA;
		6'b111101: Sout[16:19] <= 4'h4;
		6'b111110: Sout[16:19] <= 4'h5;
		6'b111111: Sout[16:19] <= 4'h3;
		default:   Sout[16:19] <= 4'h0;
	endcase
end
	
always @(SplitOrdered[6])
	begin
		 case(SplitOrdered[6])
		6'b000000: Sout[20:23] <= 4'hC;
		6'b000001: Sout[20:23] <= 4'h1;
		6'b000010: Sout[20:23] <= 4'hA;
		6'b000011: Sout[20:23] <= 4'hF;
		6'b000100: Sout[20:23] <= 4'h9;
		6'b000101: Sout[20:23] <= 4'h2;
		6'b000110: Sout[20:23] <= 4'h6;
		6'b000111: Sout[20:23] <= 4'h8;
		6'b001000: Sout[20:23] <= 4'h0;
		6'b001001: Sout[20:23] <= 4'hD;
		6'b001010: Sout[20:23] <= 4'h3;
		6'b001011: Sout[20:23] <= 4'h4;
		6'b001100: Sout[20:23] <= 4'hE;
		6'b001101: Sout[20:23] <= 4'h7;
		6'b001110: Sout[20:23] <= 4'h5;
		6'b001111: Sout[20:23] <= 4'hB;
		6'b010000: Sout[20:23] <= 4'hA;
		6'b010001: Sout[20:23] <= 4'hF;
		6'b010010: Sout[20:23] <= 4'h4;
		6'b010011: Sout[20:23] <= 4'h2;
		6'b010100: Sout[20:23] <= 4'h7;
		6'b010101: Sout[20:23] <= 4'hC;
		6'b010110: Sout[20:23] <= 4'h9;
		6'b010111: Sout[20:23] <= 4'h5;
		6'b011000: Sout[20:23] <= 4'h6;
		6'b011001: Sout[20:23] <= 4'h1;
		6'b011010: Sout[20:23] <= 4'hD;
		6'b011011: Sout[20:23] <= 4'hE;
		6'b011100: Sout[20:23] <= 4'h0;
		6'b011101: Sout[20:23] <= 4'hB;
		6'b011110: Sout[20:23] <= 4'h3;
		6'b011111: Sout[20:23] <= 4'h8;
		6'b100000: Sout[20:23] <= 4'h9;
		6'b100001: Sout[20:23] <= 4'hE;
		6'b100010: Sout[20:23] <= 4'hF;
		6'b100011: Sout[20:23] <= 4'h5;
		6'b100100: Sout[20:23] <= 4'h2;
		6'b100101: Sout[20:23] <= 4'h8;
		6'b100110: Sout[20:23] <= 4'hC;
		6'b100111: Sout[20:23] <= 4'h3;
		6'b101000: Sout[20:23] <= 4'h7;
		6'b101001: Sout[20:23] <= 4'h0;
		6'b101010: Sout[20:23] <= 4'h4;
		6'b101011: Sout[20:23] <= 4'hA;
		6'b101100: Sout[20:23] <= 4'h1;
		6'b101101: Sout[20:23] <= 4'hD;
		6'b101110: Sout[20:23] <= 4'hB;
		6'b101111: Sout[20:23] <= 4'h6;
		6'b110000: Sout[20:23] <= 4'h4;
		6'b110001: Sout[20:23] <= 4'h3;
		6'b110010: Sout[20:23] <= 4'h2;
		6'b110011: Sout[20:23] <= 4'hC;
		6'b110100: Sout[20:23] <= 4'h9;
		6'b110101: Sout[20:23] <= 4'h5;
		6'b110110: Sout[20:23] <= 4'hF;
		6'b110111: Sout[20:23] <= 4'hA;
		6'b111000: Sout[20:23] <= 4'hB;
		6'b111001: Sout[20:23] <= 4'hE;
		6'b111010: Sout[20:23] <= 4'h1;
		6'b111011: Sout[20:23] <= 4'h7;
		6'b111100: Sout[20:23] <= 4'h6;
		6'b111101: Sout[20:23] <= 4'h0;
		6'b111110: Sout[20:23] <= 4'h8;
		6'b111111: Sout[20:23] <= 4'hD;
		default:   Sout[20:23] <= 4'h0;
	endcase
end

always @(SplitOrdered[7])
  begin
	 case(SplitOrdered[7])
		6'b000000: Sout[24:27] <= 4'h4;
		6'b000001: Sout[24:27] <= 4'hB;
		6'b000010: Sout[24:27] <= 4'h2;
		6'b000011: Sout[24:27] <= 4'hE;
		6'b000100: Sout[24:27] <= 4'hF;
		6'b000101: Sout[24:27] <= 4'h0;
		6'b000110: Sout[24:27] <= 4'h8;
		6'b000111: Sout[24:27] <= 4'hD;
		6'b001000: Sout[24:27] <= 4'h3;
		6'b001001: Sout[24:27] <= 4'hC;
		6'b001010: Sout[24:27] <= 4'h9;
		6'b001011: Sout[24:27] <= 4'h7;
		6'b001100: Sout[24:27] <= 4'h5;
		6'b001101: Sout[24:27] <= 4'hA;
		6'b001110: Sout[24:27] <= 4'h6;
		6'b001111: Sout[24:27] <= 4'h1;
		6'b010000: Sout[24:27] <= 4'hD;
		6'b010001: Sout[24:27] <= 4'h0;
		6'b010010: Sout[24:27] <= 4'hB;
		6'b010011: Sout[24:27] <= 4'h7;
		6'b010100: Sout[24:27] <= 4'h4;
		6'b010101: Sout[24:27] <= 4'h9;
		6'b010110: Sout[24:27] <= 4'h1;
		6'b010111: Sout[24:27] <= 4'hA;
		6'b011000: Sout[24:27] <= 4'hE;
		6'b011001: Sout[24:27] <= 4'h3;
		6'b011010: Sout[24:27] <= 4'h5;
		6'b011011: Sout[24:27] <= 4'hC;
		6'b011100: Sout[24:27] <= 4'h2;
		6'b011101: Sout[24:27] <= 4'hF;
		6'b011110: Sout[24:27] <= 4'h8;
		6'b011111: Sout[24:27] <= 4'h6;
		6'b100000: Sout[24:27] <= 4'h1;
		6'b100001: Sout[24:27] <= 4'h4;
		6'b100010: Sout[24:27] <= 4'hB;
		6'b100011: Sout[24:27] <= 4'hD;
		6'b100100: Sout[24:27] <= 4'hC;
		6'b100101: Sout[24:27] <= 4'h3;
		6'b100110: Sout[24:27] <= 4'h7;
		6'b100111: Sout[24:27] <= 4'hE;
		6'b101000: Sout[24:27] <= 4'hA;
		6'b101001: Sout[24:27] <= 4'hF;
		6'b101010: Sout[24:27] <= 4'h6;
		6'b101011: Sout[24:27] <= 4'h8;
		6'b101100: Sout[24:27] <= 4'h0;
		6'b101101: Sout[24:27] <= 4'h5;
		6'b101110: Sout[24:27] <= 4'h9;
		6'b101111: Sout[24:27] <= 4'h2;
		6'b110000: Sout[24:27] <= 4'h6;
		6'b110001: Sout[24:27] <= 4'hB;
		6'b110010: Sout[24:27] <= 4'hD;
		6'b110011: Sout[24:27] <= 4'h8;
		6'b110100: Sout[24:27] <= 4'h1;
		6'b110101: Sout[24:27] <= 4'h4;
		6'b110110: Sout[24:27] <= 4'hA;
		6'b110111: Sout[24:27] <= 4'h7;
		6'b111000: Sout[24:27] <= 4'h9;
		6'b111001: Sout[24:27] <= 4'h5;
		6'b111010: Sout[24:27] <= 4'h0;
		6'b111011: Sout[24:27] <= 4'hF;
		6'b111100: Sout[24:27] <= 4'hE;
		6'b111101: Sout[24:27] <= 4'h2;
		6'b111110: Sout[24:27] <= 4'h3;
		6'b111111: Sout[24:27] <= 4'hC;
		default:   Sout[24:27] <= 4'h0;	
	endcase	
end

always @(SplitOrdered[8])
  begin
	case(SplitOrdered[8])
		6'b000000: Sout[28:31] <= 4'hD;
		6'b000001: Sout[28:31] <= 4'h2;
		6'b000010: Sout[28:31] <= 4'h8;
		6'b000011: Sout[28:31] <= 4'h4;
		6'b000100: Sout[28:31] <= 4'h6;
		6'b000101: Sout[28:31] <= 4'hF;
		6'b000110: Sout[28:31] <= 4'hB;
		6'b000111: Sout[28:31] <= 4'h1;
		6'b001000: Sout[28:31] <= 4'hA;
		6'b001001: Sout[28:31] <= 4'h9;
		6'b001010: Sout[28:31] <= 4'h3;
		6'b001011: Sout[28:31] <= 4'hE;
		6'b001100: Sout[28:31] <= 4'h5;
		6'b001101: Sout[28:31] <= 4'h0;
		6'b001110: Sout[28:31] <= 4'hC;
		6'b001111: Sout[28:31] <= 4'h7;
		6'b010000: Sout[28:31] <= 4'h1;
		6'b010001: Sout[28:31] <= 4'hF;
		6'b010010: Sout[28:31] <= 4'hD;
		6'b010011: Sout[28:31] <= 4'h8;
		6'b010100: Sout[28:31] <= 4'hA;
		6'b010101: Sout[28:31] <= 4'h3;
		6'b010110: Sout[28:31] <= 4'h7;
		6'b010111: Sout[28:31] <= 4'h4;
		6'b011000: Sout[28:31] <= 4'hC;
		6'b011001: Sout[28:31] <= 4'h5;
		6'b011010: Sout[28:31] <= 4'h6;
		6'b011011: Sout[28:31] <= 4'hB;
		6'b011100: Sout[28:31] <= 4'h0;
		6'b011101: Sout[28:31] <= 4'hE;
		6'b011110: Sout[28:31] <= 4'h9;
		6'b011111: Sout[28:31] <= 4'h2;
		6'b100000: Sout[28:31] <= 4'h7;
		6'b100001: Sout[28:31] <= 4'hB;
		6'b100010: Sout[28:31] <= 4'h4;
		6'b100011: Sout[28:31] <= 4'h1;
		6'b100100: Sout[28:31] <= 4'h9;
		6'b100101: Sout[28:31] <= 4'hC;
		6'b100110: Sout[28:31] <= 4'hE;
		6'b100111: Sout[28:31] <= 4'h2;
		6'b101000: Sout[28:31] <= 4'h0;
		6'b101001: Sout[28:31] <= 4'h6;
		6'b101010: Sout[28:31] <= 4'hA;
		6'b101011: Sout[28:31] <= 4'hD;
		6'b101100: Sout[28:31] <= 4'hF;
		6'b101101: Sout[28:31] <= 4'h3;
		6'b101110: Sout[28:31] <= 4'h5;
		6'b101111: Sout[28:31] <= 4'h8;
		6'b110000: Sout[28:31] <= 4'h2;
		6'b110001: Sout[28:31] <= 4'h1;
		6'b110010: Sout[28:31] <= 4'hE;
		6'b110011: Sout[28:31] <= 4'h7;
		6'b110100: Sout[28:31] <= 4'h4;
		6'b110101: Sout[28:31] <= 4'hA;
		6'b110110: Sout[28:31] <= 4'h8;
		6'b110111: Sout[28:31] <= 4'hD;
		6'b111000: Sout[28:31] <= 4'hF;
		6'b111001: Sout[28:31] <= 4'hC;
		6'b111010: Sout[28:31] <= 4'h9;
		6'b111011: Sout[28:31] <= 4'h0;
		6'b111100: Sout[28:31] <= 4'h3;
		6'b111101: Sout[28:31] <= 4'h5;
		6'b111110: Sout[28:31] <= 4'h6;
		6'b111111: Sout[28:31] <= 4'hB;
		default:   Sout[28:31] <= 4'h0;	
	endcase
end
	
endmodule 