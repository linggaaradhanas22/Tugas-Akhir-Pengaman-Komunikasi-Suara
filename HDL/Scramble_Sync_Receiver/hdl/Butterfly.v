
// Butterfly with Scaling
// Designed for 16 bit fixed point (frac=15)

module Butterfly #(
    parameter   WIDTH = 16,
    parameter   RH = 0      // option for rounding half-up, to be used alternately
)(
    // y0 = x0 + x1
    // y1 = x0 - x1
    // separated into real and imaginary parts

    input   signed  [WIDTH-1:0] x0_re,  
    input   signed  [WIDTH-1:0] x0_im, 
    input   signed  [WIDTH-1:0] x1_re,  
    input   signed  [WIDTH-1:0] x1_im,
    output  signed  [WIDTH-1:0] y0_re,
    output  signed  [WIDTH-1:0] y0_im,
    output  signed  [WIDTH-1:0] y1_re,
    output  signed  [WIDTH-1:0] y1_im 
);

// + 1 bit
wire signed [WIDTH:0]   add_re, add_im, sub_re, sub_im;

// addition and subtraction
assign  add_re = x0_re + x1_re;
assign  add_im = x0_im + x1_im;
assign  sub_re = x0_re - x1_re;
assign  sub_im = x0_im - x1_im;

//  scaling
assign  y0_re = (add_re + RH) >>> 1;
assign  y0_im = (add_im + RH) >>> 1;
assign  y1_re = (sub_re + RH) >>> 1;
assign  y1_im = (sub_im + RH) >>> 1;

endmodule
