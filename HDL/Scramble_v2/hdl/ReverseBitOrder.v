module ReverseBitOrder #(
    parameter   WIDTH = 16,
    parameter   DEPTH = 64
)(
    input               clock,

    input [WIDTH-1:0]   di_re,
    input [WIDTH-1:0]   di_im,
    input [5:0]         di_count,

    output reg            do_en,
    output reg [7:0]    do_count,
    output[WIDTH-1:0]   do_re,
    output[WIDTH-1:0]   do_im
);

reg [WIDTH-1:0] buf_re[0:DEPTH-1];
reg [WIDTH-1:0] buf_im[0:DEPTH-1];

integer n;
always @(posedge clock) begin

    for (n = DEPTH - 1; n > 0; n = n - 1) begin 
        buf_re[n] <= buf_re[n - 1];
        buf_im[n] <= buf_im[n - 1];
    end

    buf_re[0] <= di_re;
    buf_im[0] <= di_im;

    /*
    indices = [ ...
    63 31 47 15 55 23 39 7 ...
    59 27 43 11 51 19 35 3 ...
    61 29 45 13 53 21 37 5 ...
    57 25 41 9 49 17 33 1 ...
    2 34 18 50 10 42 26 58 ...
    6 38 22 54 14 46 30 62 ...
    4 36 20 52 12 44 28 60 ...
        8 40 24 56 16 48 32 64];
        */

        if (di_count == 63) begin
            
            // auto-generated using MATLAB
            buf_re[00] <= buf_re[62];
            buf_im[00] <= buf_im[62];
            buf_re[01] <= buf_re[30];
            buf_im[01] <= buf_im[30];
            buf_re[02] <= buf_re[46];
            buf_im[02] <= buf_im[46];
            buf_re[03] <= buf_re[14];
            buf_im[03] <= buf_im[14];
            buf_re[04] <= buf_re[54];
            buf_im[04] <= buf_im[54];
            buf_re[05] <= buf_re[22];
            buf_im[05] <= buf_im[22];
            buf_re[06] <= buf_re[38];
            buf_im[06] <= buf_im[38];
            buf_re[07] <= buf_re[06];
            buf_im[07] <= buf_im[06];
            buf_re[08] <= buf_re[58];
            buf_im[08] <= buf_im[58];
            buf_re[09] <= buf_re[26];
            buf_im[09] <= buf_im[26];
            buf_re[10] <= buf_re[42];
            buf_im[10] <= buf_im[42];
            buf_re[11] <= buf_re[10];
            buf_im[11] <= buf_im[10];
            buf_re[12] <= buf_re[50];
            buf_im[12] <= buf_im[50];
            buf_re[13] <= buf_re[18];
            buf_im[13] <= buf_im[18];
            buf_re[14] <= buf_re[34];
            buf_im[14] <= buf_im[34];
            buf_re[15] <= buf_re[02];
            buf_im[15] <= buf_im[02];
            buf_re[16] <= buf_re[60];
            buf_im[16] <= buf_im[60];
            buf_re[17] <= buf_re[28];
            buf_im[17] <= buf_im[28];
            buf_re[18] <= buf_re[44];
            buf_im[18] <= buf_im[44];
            buf_re[19] <= buf_re[12];
            buf_im[19] <= buf_im[12];
            buf_re[20] <= buf_re[52];
            buf_im[20] <= buf_im[52];
            buf_re[21] <= buf_re[20];
            buf_im[21] <= buf_im[20];
            buf_re[22] <= buf_re[36];
            buf_im[22] <= buf_im[36];
            buf_re[23] <= buf_re[04];
            buf_im[23] <= buf_im[04];
            buf_re[24] <= buf_re[56];
            buf_im[24] <= buf_im[56];
            buf_re[25] <= buf_re[24];
            buf_im[25] <= buf_im[24];
            buf_re[26] <= buf_re[40];
            buf_im[26] <= buf_im[40];
            buf_re[27] <= buf_re[08];
            buf_im[27] <= buf_im[08];
            buf_re[28] <= buf_re[48];
            buf_im[28] <= buf_im[48];
            buf_re[29] <= buf_re[16];
            buf_im[29] <= buf_im[16];
            buf_re[30] <= buf_re[32];
            buf_im[30] <= buf_im[32];
            buf_re[31] <= buf_re[00];
            buf_im[31] <= buf_im[00];
            buf_re[32] <= buf_re[01];
            buf_im[32] <= buf_im[01];
            //buf_re[33] <= buf_re[33];
            //buf_im[33] <= buf_im[33];
            buf_re[34] <= buf_re[17];
            buf_im[34] <= buf_im[17];
            buf_re[35] <= buf_re[49];
            buf_im[35] <= buf_im[49];
            buf_re[36] <= buf_re[09];
            buf_im[36] <= buf_im[09];
            buf_re[37] <= buf_re[41];
            buf_im[37] <= buf_im[41];
            buf_re[38] <= buf_re[25];
            buf_im[38] <= buf_im[25];
            buf_re[39] <= buf_re[57];
            buf_im[39] <= buf_im[57];
            buf_re[40] <= buf_re[05];
            buf_im[40] <= buf_im[05];
            buf_re[41] <= buf_re[37];
            buf_im[41] <= buf_im[37];
            buf_re[42] <= buf_re[21];
            buf_im[42] <= buf_im[21];
            buf_re[43] <= buf_re[53];
            buf_im[43] <= buf_im[53];
            buf_re[44] <= buf_re[13];
            buf_im[44] <= buf_im[13];
            //buf_re[45] <= buf_re[45];
            //buf_im[45] <= buf_im[45];
            buf_re[46] <= buf_re[29];
            buf_im[46] <= buf_im[29];
            buf_re[47] <= buf_re[61];
            buf_im[47] <= buf_im[61];
            buf_re[48] <= buf_re[03];
            buf_im[48] <= buf_im[03];
            buf_re[49] <= buf_re[35];
            buf_im[49] <= buf_im[35];
            buf_re[50] <= buf_re[19];
            buf_im[50] <= buf_im[19];
            //buf_re[51] <= buf_re[51];
            //buf_im[51] <= buf_im[51];
            buf_re[52] <= buf_re[11];
            buf_im[52] <= buf_im[11];
            buf_re[53] <= buf_re[43];
            buf_im[53] <= buf_im[43];
            buf_re[54] <= buf_re[27];
            buf_im[54] <= buf_im[27];
            buf_re[55] <= buf_re[59];
            buf_im[55] <= buf_im[59];
            buf_re[56] <= buf_re[07];
            buf_im[56] <= buf_im[07];
            buf_re[57] <= buf_re[39];
            buf_im[57] <= buf_im[39];
            buf_re[58] <= buf_re[23];
            buf_im[58] <= buf_im[23];
            buf_re[59] <= buf_re[55];
            buf_im[59] <= buf_im[55];
            buf_re[60] <= buf_re[15];
            buf_im[60] <= buf_im[15];
            buf_re[61] <= buf_re[47];
            buf_im[61] <= buf_im[47];
            buf_re[62] <= buf_re[31];
            buf_im[62] <= buf_im[31];
            //buf_re[63] <= buf_re[63];
            //buf_im[63] <= buf_im[63];
        end
end

always @(posedge clock) begin
    if (di_count == 63) begin 
        do_count <= 8'b0;
        do_en    <= 1'b1;
    end else begin 
        do_count <= do_count + 1'b1;
    end
end

assign  do_re = buf_re[DEPTH-1];
assign  do_im = buf_im[DEPTH-1];

endmodule