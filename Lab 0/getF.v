module getF(R, Key, out);
	input [31:0] R; 
	input [47 :0] Key; 
	output [31:0] out; 
	wire [31:0] out; 
	wire [47:0] E;
	wire [47:0] KE; 
	wire [31:0] Sout; 
	
	GetE getE(R,E); 
	assign KE = Key ^ E; 
	SBoxTransformation sBox(KE, Sout);  
	GetPPermutation getPPerm(Sout, out); 
	
endmodule 