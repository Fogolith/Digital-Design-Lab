//Aaron Pravecek & Jacob Haynes
//Key_Permutation will shuffle a given key of 64 bits
//into a 56 bit key


module RunDES(input din, input initkey,input clk,input reset, output subkey1);
always @ (posedge clk) begin
//------------------------Inputs and Outputs------------------------------

integer PC1[55:0];
PC1[0] <= 32'd67; 

/*integer PC1 [55:0] = {57,49,41,33,25,17,9,
										1,58,50,42,34,26,18,
										10,2,59,51,43,35,27,
										19,11,3,60,52,44,36,
										63,55,47,39,31,23,15,
										7,62,54,46,38,30,22,
										14,6,61,53,45,37,29,
										21,13,5,28,20,12,4};*/
											

end
endmodule
