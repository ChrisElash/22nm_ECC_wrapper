//32 bits input, so 6 bits parity 
module ECC_S1D_encoder(
    input	[31:0]	EDI,
    output	[37:0]	EDO

);



assign EDO[0] = EDI[0]^EDI[1]^EDI[3]^EDI[4]^EDI[6]^EDI[8]^EDI[10]^EDI[12]^EDI[14]^EDI[17]^EDI[19]^EDI[24]^EDI[28];
assign EDO[1] = EDI[0]^EDI[2]^EDI[3]^EDI[5]^EDI[6]^EDI[9]^EDI[11]^EDI[12]^EDI[15]^EDI[18]^EDI[20]^EDI[22]^EDI[25]^EDI[29];
assign EDO[2] = EDI[0];
assign EDO[3] = EDI[1]^EDI[2]^EDI[3]^EDI[7]^EDI[8]^EDI[9]^EDI[13]^EDI[14]^EDI[15]^EDI[21]^EDI[22]^EDI[26]^EDI[30];
assign EDO[4] = EDI[1];
assign EDO[5] = EDI[2];
assign EDO[6] = EDI[3];
assign EDO[7] = EDI[4]^EDI[5]^EDI[6]^EDI[7]^EDI[8]^EDI[9]^EDI[16]^EDI[17]^EDI[18]^EDI[23]^EDI[24]^EDI[25]^EDI[26]^EDI[31];
assign EDO[8] = EDI[4];
assign EDO[9] = EDI[5];
assign EDO[10] = EDI[6];
assign EDO[11] = EDI[7];
assign EDO[12] = EDI[8];
assign EDO[13] = EDI[9];
assign EDO[14] = EDI[10]^EDI[11]^EDI[12]^EDI[13]^EDI[14]^EDI[15]^EDI[16]^EDI[17]^EDI[18]^EDI[27]^EDI[28]^EDI[29]^EDI[30]^EDI[31];
assign EDO[15] = EDI[10];
assign EDO[16] = EDI[11];
assign EDO[17] = EDI[12];
assign EDO[18] = EDI[13];
assign EDO[19] = EDI[14];
assign EDO[20] = EDI[15];
assign EDO[21] = EDI[16];
assign EDO[22] = EDI[17];
assign EDO[23] = EDI[18];
assign EDO[24] = EDI[19]^EDI[20]^EDI[21]^EDI[22]^EDI[23]^EDI[24]^EDI[25]^EDI[26]^EDI[27]^EDI[28]^EDI[29]^EDI[30]^EDI[31];
assign EDO[25] = EDI[19];
assign EDO[26] = EDI[20];
assign EDO[27] = EDI[21];
assign EDO[28] = EDI[22];
assign EDO[29] = EDI[23];
assign EDO[30] = EDI[24];
assign EDO[31] = EDI[25];
assign EDO[32] = EDI[26];
assign EDO[33] = EDI[27];
assign EDO[34] = EDI[28];
assign EDO[35] = EDI[29];
assign EDO[36] = EDI[30];
assign EDO[37] = EDI[31];

endmodule