module HexToSevenSeg( hex, sevenSegOut);

input [3:0] hex; //4 bit input value
output [6:0] sevenSegOut; //seven segment settings: sets each of the 7 segments to on or off

assign sevenSegOut =  (hex == 4'b0000) ? 7'b0000001:   // 0
                      (hex == 4'b0001) ? 7'b1001111:   // 1
                      (hex == 4'b0010) ? 7'b0010010:   // 2
                      (hex == 4'b0011) ? 7'b0000110:   // 3
                      (hex == 4'b0100) ? 7'b1000110:   // 4
                      (hex == 4'b0101) ? 7'b0100100:   // 5
                      (hex == 4'b0110) ? 7'b0100000:   // 6
                      (hex == 4'b0111) ? 7'b0001111:   // 7
                      (hex == 4'b1000) ? 7'b0000000:   // 8
                      (hex == 4'b1001) ? 7'b0000100:   // 9
                      (hex == 4'b1010) ? 7'b0001000:   // A
                      (hex == 4'b1011) ? 7'b1100000:   // b
                      (hex == 4'b1100) ? 7'b0110001:   // C
                      (hex == 4'b1101) ? 7'b1000010:   // d
                      (hex == 4'b1110) ? 7'b0110000:   // E
                      (hex == 4'b1111) ? 7'b0111000:   // F
                      7'b1111111;   // default i.e. all segments off!
                                                        

endmodule
