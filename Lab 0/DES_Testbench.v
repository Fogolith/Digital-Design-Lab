/*------------------------DES_Testbench-------------------------------*/
/*modify this testbench to test your own DES code*/

module DES_Testbench;
//define input and output for the DES_Testbench

    reg [0:63] din;//input 64-bit plaintext data
    reg [0:63] key;//input original 64-bit key
    wire [0:63] dout;//Encrypted text
	
//instantiate the Device Under Test(DUT)
	DES MyDes (
	.din (din),
	.key (key),
	.dout (dout)
	);
//set all input pin into known states
	initial//one time
	begin
		$display($time, "<< Starting the DES Simulation >>");
		
		din = 64'h8787878787878787;//eight-digital decimal 
		key = 64'h0E329232EA6D0D73;//result of encryption:0x0000000000000000 
	end
	
	DES runDES(key, din, dout);
	
	initial
	#2000 $finish;// terminating the simulation after #2000 time units
endmodule

 
	