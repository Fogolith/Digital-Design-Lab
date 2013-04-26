

module DES(key, din, dout);

input [0:63] key;
input [0:63] din;
output [0:63] dout;
wire [0:63] dout;
integer PC1[55:0];			
wire [55:0] kPlus; 			
GetKPlus getKPlus(key, kPlus); 

wire [0:55] CD [0:16]; 

Split_56 splitKPlus(kPlus, CD[0][0:27], CD[0][28:55]); 

//C1 D1
Ring_Shift_28 C1 (CD[0][0:27], CD[1][0:27]); 
Ring_Shift_28 D1 (CD[0][28:55], CD[1][28:55]); 

//C2 D2
Ring_Shift_28 C2 (CD[1][0:27], CD[2][0:27]); 
Ring_Shift_28 D2 (CD[1][28:55], CD[2][28:55]); 

//C3 D3
Ring_Shift2_28 C3 (CD[2][0:27], CD[3][0:27]);  
Ring_Shift2_28 D3 (CD[2][28:55], CD[3][28:55]);  

//C4 D4
Ring_Shift2_28 C4 (CD[3][0:27], CD[4][0:27]);  
Ring_Shift2_28 D4 (CD[3][28:55], CD[4][28:55]); 

//C5 D5
Ring_Shift2_28 C5 (CD[4][0:27], CD[5][0:27]);  
Ring_Shift2_28 D5 (CD[4][28:55], CD[5][28:55]); 

//C6 D6
Ring_Shift2_28 C6 (CD[5][0:27], CD[6][0:27]);  
Ring_Shift2_28 D6 (CD[5][28:55], CD[6][28:55]); 

//C7 D7
Ring_Shift2_28 C7 (CD[6][0:27], CD[7][0:27]);  
Ring_Shift2_28 D7 (CD[6][28:55], CD[7][28:55]); 

//C8 D8
Ring_Shift2_28 C8 (CD[7][0:27], CD[8][0:27]);  
Ring_Shift2_28 D8 (CD[7][28:55], CD[8][28:55]); 

//C9 D9
Ring_Shift_28 C9 (CD[8][0:27], CD[9][0:27]);  
Ring_Shift_28 D9 (CD[8][28:55], CD[9][28:55]); 

//C10 D10
Ring_Shift2_28 C10 (CD[9][0:27], CD[10][0:27]);  
Ring_Shift2_28 D10 (CD[9][28:55], CD[10][28:55]); 

//C11 D11
Ring_Shift2_28 C11 (CD[10][0:27], CD[11][0:27]);  
Ring_Shift2_28 D11 (CD[10][28:55], CD[11][28:55]); 

//C12 D12
Ring_Shift2_28 C12 (CD[11][0:27], CD[12][0:27]);  
Ring_Shift2_28 D12 (CD[11][28:55], CD[12][28:55]); 

//C13 D13
Ring_Shift2_28 C13 (CD[12][0:27], CD[13][0:27]);  
Ring_Shift2_28 D13 (CD[12][28:55], CD[13][28:55]); 

//C14 D14
Ring_Shift2_28 C14 (CD[13][0:27], CD[14][0:27]);  
Ring_Shift2_28 D14 (CD[13][28:55], CD[14][28:55]); 

//C15 D15
Ring_Shift2_28 C15 (CD[14][0:27], CD[15][0:27]);  
Ring_Shift2_28 D15 (CD[14][28:55], CD[15][28:55]); 

//C16 D16
Ring_Shift_28 C16 (CD[15][0:27], CD[16][0:27]);  
Ring_Shift_28 D16 (CD[15][28:55], CD[16][28:55]);

wire [47:0] Subkeys [1:16];
GetSubKeys K1(CD[1], Subkeys[1]);
GetSubKeys K2(CD[2], Subkeys[2]);
GetSubKeys K3(CD[3], Subkeys[3]);
GetSubKeys K4(CD[4], Subkeys[4]);
GetSubKeys K5(CD[5], Subkeys[5]);
GetSubKeys K6(CD[6], Subkeys[6]);
GetSubKeys K7(CD[7], Subkeys[7]);
GetSubKeys K8(CD[8], Subkeys[8]);
GetSubKeys K9(CD[9], Subkeys[9]);
GetSubKeys K10(CD[10], Subkeys[10]);
GetSubKeys K11(CD[11], Subkeys[11]);
GetSubKeys K12(CD[12], Subkeys[12]);
GetSubKeys K13(CD[13], Subkeys[13]);
GetSubKeys K14(CD[14], Subkeys[14]);
GetSubKeys K15(CD[15], Subkeys[15]);
GetSubKeys K16(CD[16], Subkeys[16]);

 
wire [63:0] initialPermuation; 
wire [31:0] L [0:16], R [0:16]; 
wire [31:0] F [1:16]; 
GetInitialPermuation getIP(din, initialPermuation); 
Split_64 splitIt(initialPermuation, L[0], R[0]); 


// LR1
assign L[1] = R[0]; 
getF F1(R[0], Subkeys[1], F[1]); 
assign R[1] = L[0] ^ F[1]; 

// LR2
assign L[2] = R[1]; 
getF F2(R[1], Subkeys[2], F[2]); 
assign R[2] = L[1] ^ F[2]; 

// LR3
assign L[3] = R[2]; 
getF F3(R[2], Subkeys[3], F[3]); 
assign R[3] = L[2] ^ F[3]; 

// LR4
assign L[4] = R[3]; 
getF F4(R[3], Subkeys[4], F[4]); 
assign R[4] = L[3] ^ F[4]; 

// LR5
assign L[5] = R[4]; 
getF F5(R[4], Subkeys[5], F[5]); 
assign R[5] = L[4] ^ F[5]; 

// LR6
assign L[6] = R[5]; 
getF F6(R[5], Subkeys[6], F[6]); 
assign R[6] = L[5] ^ F[6]; 

// LR7
assign L[7] = R[6]; 
getF F7(R[6], Subkeys[7], F[7]); 
assign R[7] = L[6] ^ F[7]; 

// LR8
assign L[8] = R[7]; 
getF F8(R[7], Subkeys[8], F[8]); 
assign R[8] = L[7] ^ F[8]; 

// LR9
assign L[9] = R[8]; 
getF F9(R[8], Subkeys[9], F[9]); 
assign R[9] = L[8] ^ F[9]; 

// LR10
assign L[10] = R[9]; 
getF F10(R[9], Subkeys[10], F[10]); 
assign R[10] = L[9] ^ F[10]; 

// LR11
assign L[11] = R[10]; 
getF F11(R[10], Subkeys[11], F[11]); 
assign R[11] = L[10] ^ F[11]; 

// LR12
assign L[12] = R[11]; 
getF F12(R[11], Subkeys[12], F[12]); 
assign R[12] = L[11] ^ F[12]; 

// LR13
assign L[13] = R[12]; 
getF F13(R[12], Subkeys[13], F[13]); 
assign R[13] = L[12] ^ F[13]; 

// LR14
assign L[14] = R[13]; 
getF F14(R[13], Subkeys[14], F[14]); 
assign R[14] = L[13] ^ F[14]; 

// LR15
assign L[15] = R[14]; 
getF F15(R[14], Subkeys[15], F[15]); 
assign R[15] = L[14] ^ F[15]; 

// LR16
assign L[16] = R[15]; 
getF F16(R[15], Subkeys[16], F[16]); 
assign R[16] = L[15] ^ F[16]; 

wire [0:63] RL; 
assign RL[0:31] = R[16]; 
assign RL[32:63] = L[16]; 

GetFinalPermutation getFinalPermutation(RL, dout); 
endmodule
