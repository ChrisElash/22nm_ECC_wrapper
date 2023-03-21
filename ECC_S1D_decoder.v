module ECC_S1D_decoder (
    input	[37:0]	DDI,
    output	[31:0]	DDO,
    output  E1
);
    




wire		[5:0]	nc;
wire		[31:0]	errBit;
wire		[37:0]	XI;

assign XI = DDI;

// Create a new syndrome
assign nc[0] = XI[0]^XI[2]^XI[4]^XI[6]^XI[8]^XI[10]^XI[12]^XI[15]^XI[17]^XI[19]^XI[22]^XI[25]^XI[30]^XI[34];
assign nc[1] = XI[1]^XI[2]^XI[5]^XI[6]^XI[9]^XI[10]^XI[13]^XI[16]^XI[17]^XI[20]^XI[23]^XI[26]^XI[28]^XI[31]^XI[35];
assign nc[2] = XI[3]^XI[4]^XI[5]^XI[6]^XI[11]^XI[12]^XI[13]^XI[18]^XI[19]^XI[20]^XI[27]^XI[28]^XI[32]^XI[36];
assign nc[3] = XI[7]^XI[8]^XI[9]^XI[10]^XI[11]^XI[12]^XI[13]^XI[21]^XI[22]^XI[23]^XI[29]^XI[30]^XI[31]^XI[32]^XI[37];
assign nc[4] = XI[14]^XI[15]^XI[16]^XI[17]^XI[18]^XI[19]^XI[20]^XI[21]^XI[22]^XI[23]^XI[33]^XI[34]^XI[35]^XI[36]^XI[37];
assign nc[5] = XI[24]^XI[25]^XI[26]^XI[27]^XI[28]^XI[29]^XI[30]^XI[31]^XI[32]^XI[33]^XI[34]^XI[35]^XI[36]^XI[37];

// Is there an error ?
assign E1 = |nc ;

// For x in 0 to 31; errBit[x] is '1' if it is found faulty
assign errBit[0] =  !nc[5] & !nc[4] &  nc[3] &  nc[2] &  nc[1] &  nc[0];
assign errBit[1] =  !nc[5] &  nc[4] &  nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[2] =  !nc[5] &  nc[4] &  nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[3] =   nc[5] &  nc[4] &  nc[3] &  nc[2] &  nc[1] &  nc[0];
assign errBit[4] =   nc[5] &  nc[4] & !nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[5] =   nc[5] &  nc[4] & !nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[6] =   nc[5] & !nc[4] &  nc[3] &  nc[2] &  nc[1] &  nc[0];
assign errBit[7] =   nc[5] &  nc[4] &  nc[3] &  nc[2] & !nc[1] & !nc[0];
assign errBit[8] =   nc[5] &  nc[4] &  nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[9] =   nc[5] &  nc[4] &  nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[10] =   nc[5] & !nc[4] & !nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[11] =   nc[5] & !nc[4] & !nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[12] =  !nc[5] & !nc[4] &  nc[3] &  nc[2] &  nc[1] &  nc[0];
assign errBit[13] =   nc[5] & !nc[4] &  nc[3] &  nc[2] & !nc[1] & !nc[0];
assign errBit[14] =  !nc[5] &  nc[4] &  nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[15] =  !nc[5] &  nc[4] &  nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[16] =   nc[5] &  nc[4] &  nc[3] & !nc[2] & !nc[1] & !nc[0];
assign errBit[17] =   nc[5] &  nc[4] & !nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[18] =   nc[5] &  nc[4] & !nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[19] =  !nc[5] & !nc[4] & !nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[20] =  !nc[5] & !nc[4] & !nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[21] =  !nc[5] & !nc[4] &  nc[3] &  nc[2] & !nc[1] & !nc[0];
assign errBit[22] =  !nc[5] &  nc[4] &  nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[23] =  !nc[5] &  nc[4] &  nc[3] & !nc[2] & !nc[1] & !nc[0];
assign errBit[24] =   nc[5] &  nc[4] & !nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[25] =   nc[5] &  nc[4] & !nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[26] =   nc[5] &  nc[4] &  nc[3] &  nc[2] & !nc[1] & !nc[0];
assign errBit[27] =   nc[5] &  nc[4] & !nc[3] & !nc[2] & !nc[1] & !nc[0];
assign errBit[28] =   nc[5] & !nc[4] & !nc[3] & !nc[2] &  nc[1] &  nc[0];
assign errBit[29] =   nc[5] & !nc[4] & !nc[3] &  nc[2] &  nc[1] & !nc[0];
assign errBit[30] =   nc[5] & !nc[4] &  nc[3] &  nc[2] & !nc[1] & !nc[0];
assign errBit[31] =   nc[5] &  nc[4] &  nc[3] & !nc[2] & !nc[1] & !nc[0];

// Flip a bit if it is faulty
assign DDO[0] = XI[2] & !errBit[0] | !XI[2] & errBit[0];
assign DDO[1] = XI[4] & !errBit[1] | !XI[4] & errBit[1];
assign DDO[2] = XI[5] & !errBit[2] | !XI[5] & errBit[2];
assign DDO[3] = XI[6] & !errBit[3] | !XI[6] & errBit[3];
assign DDO[4] = XI[8] & !errBit[4] | !XI[8] & errBit[4];
assign DDO[5] = XI[9] & !errBit[5] | !XI[9] & errBit[5];
assign DDO[6] = XI[10] & !errBit[6] | !XI[10] & errBit[6];
assign DDO[7] = XI[11] & !errBit[7] | !XI[11] & errBit[7];
assign DDO[8] = XI[12] & !errBit[8] | !XI[12] & errBit[8];
assign DDO[9] = XI[13] & !errBit[9] | !XI[13] & errBit[9];
assign DDO[10] = XI[15] & !errBit[10] | !XI[15] & errBit[10];
assign DDO[11] = XI[16] & !errBit[11] | !XI[16] & errBit[11];
assign DDO[12] = XI[17] & !errBit[12] | !XI[17] & errBit[12];
assign DDO[13] = XI[18] & !errBit[13] | !XI[18] & errBit[13];
assign DDO[14] = XI[19] & !errBit[14] | !XI[19] & errBit[14];
assign DDO[15] = XI[20] & !errBit[15] | !XI[20] & errBit[15];
assign DDO[16] = XI[21] & !errBit[16] | !XI[21] & errBit[16];
assign DDO[17] = XI[22] & !errBit[17] | !XI[22] & errBit[17];
assign DDO[18] = XI[23] & !errBit[18] | !XI[23] & errBit[18];
assign DDO[19] = XI[25] & !errBit[19] | !XI[25] & errBit[19];
assign DDO[20] = XI[26] & !errBit[20] | !XI[26] & errBit[20];
assign DDO[21] = XI[27] & !errBit[21] | !XI[27] & errBit[21];
assign DDO[22] = XI[28] & !errBit[22] | !XI[28] & errBit[22];
assign DDO[23] = XI[29] & !errBit[23] | !XI[29] & errBit[23];
assign DDO[24] = XI[30] & !errBit[24] | !XI[30] & errBit[24];
assign DDO[25] = XI[31] & !errBit[25] | !XI[31] & errBit[25];
assign DDO[26] = XI[32] & !errBit[26] | !XI[32] & errBit[26];
assign DDO[27] = XI[33] & !errBit[27] | !XI[33] & errBit[27];
assign DDO[28] = XI[34] & !errBit[28] | !XI[34] & errBit[28];
assign DDO[29] = XI[35] & !errBit[29] | !XI[35] & errBit[29];
assign DDO[30] = XI[36] & !errBit[30] | !XI[36] & errBit[30];
assign DDO[31] = XI[37] & !errBit[31] | !XI[37] & errBit[31];

endmodule 