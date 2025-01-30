
// single master clock configuration
// clock is to be equivalent to sampling clock

module ScramblerAudio(
    input           clock,
    input           reset,

    input           di_en,

    // set shift key as 24'b0 when scrambling is to be turned off
    input   [23:0]  shift_key,  // for a given 64 samples
    input   [15:0]  in_real,    // real audio input only
    output  [15:0]  out_real      
);

    ///////////////////////////////////////////////////////

    // FFT + order correction
    wire        do_en_fft;      // enable signal for FFT output
    wire [15:0] fft_re, fft_im; // FFT output
    wire [7:0]  fft_do_count;       // FFT output counter
    wire [15:0] rev_re, rev_im;
    wire [7:0]  rev_do_count;

    // scrambler
    wire [23:0] permute_key1, permute_key2;
    reg  [23:0] current_key;
    wire [15:0] scrambled_re, scrambled_im;

    // IFFT + order correction
    wire        do_en_ifft;
    reg scramble_do_en, ifft_reset;
    wire [15:0] ifft_re, ifft_im;
    wire [7:0]  ifft_do_count;
    wire [15:0] rev_re2;
    wire [15:0] rev_im2;
    wire [7:0]  rev_do_count2; 

    /////////////////////////////////////////////////////

    FFT FFT64 (
        .clock  (clock      ),
        .reset  (reset      ),

        .di_en  (di_en      ),
        .di_re  (in_real    ),
        .di_im  (16'b0      ),

        .do_en  (do_en_fft  ),
        .do_re  (fft_re     ),
        .do_im  (fft_im     ),
        .do_count(fft_do_count)
    );

    ReverseBitOrder ReorderFFT (
        .clock      (clock      ),
        .di_re      (fft_re     ),
        .di_im      (fft_im     ),
        .di_count   (fft_do_count),
        .do_count   (rev_do_count),
        .do_re      (rev_re     ),
        .do_im      (rev_im     )
    );

    GenPermutateKey GenKeyInst (
        .shift_key      (shift_key      ),
        .permute_key1   (permute_key1   ),
        .permute_key2   (permute_key2   )
    );

    // Scrambler should only be turned on for the
    // first and last 8 samples; in the case of the
    // scrambler instance, current_key should only 
    // be "turned on" for indices 7 (end of first 8
    // samples) and 63 (end of last 8 samples)

    always @(posedge clock) begin

        if (rev_do_count == 7'd8) begin
            current_key <= permute_key1;
        end else if (rev_do_count == 7'd71) begin
            current_key <= permute_key2;
        end else begin 
            current_key <= 24'd0;
        end
    end

    Scrambler8 ScramblerInst (
        .clock      (clock      ),
        .reset      (reset      ),

        .current_key(current_key),
        .in_real    (rev_re),
        .in_imag    (rev_im),
        .do_in      (rev_do_count),
        
        .do_count   (scrambler_do_count),
        .out_real   (scrambled_re),
        .out_imag   (scrambled_im)
    );

    always @(posedge clock) begin
        // reset before inputting fft
        if (rev_do_count == 7'd6) begin
            ifft_reset = 1;
        end else
        // account for additional delay
        if (rev_do_count == 7'd8) begin
            scramble_do_en = 1'b1;
            ifft_reset = 0;
        end 
    end 

    FFT IFFT64 (
        .clock  (clock                ),
        .reset  (ifft_reset           ),

        .di_en  (scramble_do_en       ),
        .di_re  (scrambled_re         ),
        .di_im  (scrambled_im         ),

        .do_en  (do_en_ifft           ),
        .do_re  (ifft_im              ),
        .do_im  (ifft_re              ),
        .do_count(ifft_do_count       )
    );
    
    ReverseBitOrder ReorderIFFT (
        .clock      (clock      ),
        .di_re      (ifft_re     ),
        .di_im      (16'b0     ),
        .di_count   (ifft_do_count),
        .do_count   (rev_do_count2),
        .do_re      (rev_re2     ),
        .do_im      (rev_im2     )
    );

    assign out_real = rev_re2;

endmodule