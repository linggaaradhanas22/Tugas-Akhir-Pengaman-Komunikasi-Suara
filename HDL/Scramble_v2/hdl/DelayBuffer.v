
// DelayBuffer
// generate constant delay
// using shift buffer
// at clk posedge

module DelayBuffer #(
    parameter   DEPTH = 32,
    parameter   WIDTH = 16
)(
    input               clock,  //  use master clock
    input   [WIDTH-1:0] di_re,
    input   [WIDTH-1:0] di_im,
    output  [WIDTH-1:0] do_re,
    output  [WIDTH-1:0] do_im 
);

reg [WIDTH-1:0] buf_re[0:DEPTH-1];
reg [WIDTH-1:0] buf_im[0:DEPTH-1];
integer n;

// shift buffer
always @(posedge clock) begin

    for (n = DEPTH-1; n > 0; n = n - 1) begin

        buf_re[n] <= buf_re[n-1];
        buf_im[n] <= buf_im[n-1];
    end
    
    buf_re[0] <= di_re;
    buf_im[0] <= di_im;
end

assign  do_re = buf_re[DEPTH-1];
assign  do_im = buf_im[DEPTH-1];

endmodule
