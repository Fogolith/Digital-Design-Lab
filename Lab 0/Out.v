module Out (HEX0, HEX1, HEX2, HEX3);
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	output [0:6] HEX3;
   wire [0:63] din = 64'h8787878787878787;//input 64-bit plaintext data
   wire [0:63] key = 64'h0E329232EA6D0D73;//input original 64-bit key
	 		
	 //din <= 64'h8787878787878787;//eight-digital decimal 
	 //key <= 64'h0E329232EA6D0D73;//result of encryption:0x0000000000000000
    wire [63:0] dout;//Encrypted text
	 
	 DES runDESOutput(key, din, dout); 
	 //assign HEX0 = 7'b0000000; 
	 //assign HEX1 = 7'b0000000; 
	 //assign HEX2 = 7'b0000000; 
	 //assign HEX3 = 7'b0000000; 
	 
	 
	 HexToSevenSeg hex0Seg (dout[3:0], HEX0); 
	 HexToSevenSeg hex1Seg (dout[7:4], HEX1); 
	 HexToSevenSeg hex2Seg (dout[11:8], HEX2); 
	 HexToSevenSeg hex3Seg (dout[15:12], HEX3); 
	 
	 
endmodule 