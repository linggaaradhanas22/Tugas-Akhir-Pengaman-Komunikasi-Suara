module Scrambler8(
    input       clock,
    input       reset,
    
    input       [23:0] current_key,
    input       [15:0] in_real,
    input       [15:0] in_imag,
    input       [06:0] do_in,

    output reg  [07:0] do_count,
    output reg  [15:0] out_real,
    output reg  [15:0] out_imag
);

    always @(posedge clock) begin 
        if (reset) begin 
            do_count <= 8'b0;
        end else
        if (do_in == 7) begin 
            do_count <= 8'b0;
        end else begin 
            do_count <= do_count + 1'b1;
        end 
    end

    // imaginary and real data to be concatenated 
    reg [31:0] buf1, buf2, buf3, buf4, buf5, buf6, buf7, buf8;
    reg [255:0] temp;

    // 9 clk buffer
    // has to be at the same clock edge as data input, ideally
    always @(posedge clock) begin
        
        if (reset) begin
            buf1        <= 32'b0;
            buf2        <= 32'b0;
            buf3        <= 32'b0;
            buf4        <= 32'b0;
            buf5        <= 32'b0;
            buf6        <= 32'b0;
            buf7        <= 32'b0;
            buf8        <= 32'b0;
            temp        <= 256'b0;
            out_real    <= 16'b0;
            out_imag    <= 16'b0; 
            //do_count    <= 7'b0; 
        end

        else if (current_key == 0) begin
            buf1 <= {in_real, in_imag};

            buf2 <= buf1;
            buf3 <= buf2;
            buf4 <= buf3;
            buf5 <= buf4;
            buf6 <= buf5;
            buf7 <= buf6;
            buf8 <= buf7;
            
            out_real <= buf8[31:16];
            out_imag <= buf8[15:00];

            temp <= {buf1, buf2, buf3, buf4, buf5, buf6, buf7, buf8}; 
        end

        else begin
            // buffer still
            temp <= {{in_real, in_imag}, buf1, buf2, buf3, buf4, buf5, buf6, buf7}; 

            // scramble according to current_key
            buf1 <= temp[ (256 - ((current_key[23:21]+1)  * 32)) +: 32 ];
            buf2 <= temp[ (256 - ((current_key[20:18]+1)  * 32)) +: 32 ];
            buf3 <= temp[ (256 - ((current_key[17:15]+1)  * 32)) +: 32 ];
            buf4 <= temp[ (256 - ((current_key[14:12]+1)  * 32)) +: 32 ];
            buf5 <= temp[ (256 - ((current_key[11:09]+1)  * 32)) +: 32 ];
            buf6 <= temp[ (256 - ((current_key[08:06]+1)  * 32)) +: 32 ];
            buf7 <= temp[ (256 - ((current_key[05:03]+1)  * 32)) +: 32 ];
            buf8 <= temp[ (256 - ((current_key[02:00]+1)  * 32)) +: 32 ];
        end
    end

endmodule