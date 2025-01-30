
// Radix-2^2 Single-Path Delay Feedback (SDF) Unit for 64-point for FFT  
// consisting of two butterfly modules
// butterfly 1 -> butterfly 2 -> multiplication

module SdfUnit #(
    // 64-point FFT
    parameter   N = 64,   
    // twiddle resolution
    parameter   M = 64,   
    parameter   WIDTH = 16
)(
    input               clock,  // use master clock here
    input               reset,  // active high

    input               di_en,  
    input   [WIDTH-1:0] di_re, 
    input   [WIDTH-1:0] di_im, 

    output              do_en, 
    output  [WIDTH-1:0] do_re, 
    output  [WIDTH-1:0] do_im,
    output  reg [7:0]   do_count  
);

// derive constant for log2M and log2N
// for determining bit length
function integer log2;
    input integer x;
    integer value;

    begin
        value = x-1;
        for (log2=0; value>0; log2=log2+1)
            value = value>>1;
    end

endfunction

localparam  LOG_N = log2(N);
localparam  LOG_M = log2(M);

/////////////////////////////////////////////////////
//  1st butterfly
/////////////////////////////////////////////////////

reg [LOG_N-1:0] di_count;   //  count input data
wire            bf1_bf;     //  butterfly add/sub enable

// butterfly input and output data
wire[WIDTH-1:0] bf1_x0_re;  
wire[WIDTH-1:0] bf1_x0_im;  
wire[WIDTH-1:0] bf1_x1_re; 
wire[WIDTH-1:0] bf1_x1_im;  
wire[WIDTH-1:0] bf1_y0_re;
wire[WIDTH-1:0] bf1_y0_im;
wire[WIDTH-1:0] bf1_y1_re;
wire[WIDTH-1:0] bf1_y1_im;

// data to delay buffer
wire[WIDTH-1:0] db1_di_re;
wire[WIDTH-1:0] db1_di_im;  

// data from delay buffer
wire[WIDTH-1:0] db1_do_re;  
wire[WIDTH-1:0] db1_do_im; 

// single-path data output
wire[WIDTH-1:0] bf1_sp_re; 
wire[WIDTH-1:0] bf1_sp_im; 

// single-path data enable
reg             bf1_sp_en; 

// single-path data count
reg [LOG_N-1:0] bf1_count;  

// single-path output trigger
wire            bf1_start;  

// end of single-path data
wire            bf1_end; 

// twiddle (-j) enable
wire            bf1_mj;     

// 1st butterfly output
reg [WIDTH-1:0] bf1_do_re; 
reg [WIDTH-1:0] bf1_do_im;

/////////////////////////////////////////////////////
//  2nd Butterfly
/////////////////////////////////////////////////////

reg             bf2_bf;     

wire[WIDTH-1:0] bf2_x0_re; 
wire[WIDTH-1:0] bf2_x0_im; 
wire[WIDTH-1:0] bf2_x1_re;  
wire[WIDTH-1:0] bf2_x1_im;  
wire[WIDTH-1:0] bf2_y0_re;  
wire[WIDTH-1:0] bf2_y0_im;
wire[WIDTH-1:0] bf2_y1_re;
wire[WIDTH-1:0] bf2_y1_im;

wire[WIDTH-1:0] db2_di_re;  
wire[WIDTH-1:0] db2_di_im; 
wire[WIDTH-1:0] db2_do_re; 
wire[WIDTH-1:0] db2_do_im;

wire[WIDTH-1:0] bf2_sp_re;  
wire[WIDTH-1:0] bf2_sp_im; 

reg             bf2_sp_en; 

reg [LOG_N-1:0] bf2_count;  

reg             bf2_start;

wire            bf2_end;    

reg [WIDTH-1:0] bf2_do_re; 
reg [WIDTH-1:0] bf2_do_im; 

reg             bf2_do_en; 

//  multiplication
// twiddle seleect (2n/n/3n)
wire[1:0]       tw_sel;     
// twiddle number (n)
wire[LOG_N-3:0] tw_num;     

wire[LOG_N-1:0] tw_addr;   
wire[WIDTH-1:0] tw_re;     
wire[WIDTH-1:0] tw_im;     

// multiplication enable
reg             mu_en;      

// multiplier inputs
wire[WIDTH-1:0] mu_a_re;    
wire[WIDTH-1:0] mu_a_im;  

// multiplier outputs
wire[WIDTH-1:0] mu_m_re;    
wire[WIDTH-1:0] mu_m_im;    

// multiplication output data
reg [WIDTH-1:0] mu_do_re;   
reg [WIDTH-1:0] mu_do_im;   
reg             mu_do_en;   


//----------------------------------------------------------------------
//  1st Butterfly
//----------------------------------------------------------------------
always @(posedge clock or posedge reset) begin
    if (reset) begin
        di_count <= {LOG_N{1'b0}};
    end else begin
        di_count <= di_en ? (di_count + 1'b1) : {LOG_N{1'b0}};
    end
end

// for instance, for M=64,
// bf1_bf is low for di_count 1 to 31 inclusive,
// high for 32 to 63 inclusive
assign  bf1_bf = di_count[LOG_M-1];

//  set unknown value x for verification
//  assign to x0 and x1 if bf1_bf is high
assign  bf1_x0_re = bf1_bf ? db1_do_re : {WIDTH{1'bx}};
assign  bf1_x0_im = bf1_bf ? db1_do_im : {WIDTH{1'bx}};
assign  bf1_x1_re = bf1_bf ? di_re : {WIDTH{1'bx}};
assign  bf1_x1_im = bf1_bf ? di_im : {WIDTH{1'bx}};

Butterfly #(.WIDTH(WIDTH),.RH(0)) BF1 (
    .x0_re  (bf1_x0_re  ),
    .x0_im  (bf1_x0_im  ),
    .x1_re  (bf1_x1_re  ),
    .x1_im  (bf1_x1_im  ),
    .y0_re  (bf1_y0_re  ),
    .y0_im  (bf1_y0_im  ),
    .y1_re  (bf1_y1_re  ),
    .y1_im  (bf1_y1_im  ) 
);

DelayBuffer #(.DEPTH(2**(LOG_M-1)),.WIDTH(WIDTH)) DB1 (
    .clock  (clock      ),
    .di_re  (db1_di_re  ), 
    .di_im  (db1_di_im  ),
    .do_re  (db1_do_re  ), 
    .do_im  (db1_do_im  ) 
);

assign  db1_di_re = bf1_bf ? bf1_y1_re : di_re;
assign  db1_di_im = bf1_bf ? bf1_y1_im : di_im;
assign  bf1_sp_re = bf1_bf ? bf1_y0_re : bf1_mj ?  db1_do_im : db1_do_re;
assign  bf1_sp_im = bf1_bf ? bf1_y0_im : bf1_mj ? -db1_do_re : db1_do_im;

always @(posedge clock or posedge reset) begin

    if (reset) begin
        bf1_sp_en <= 1'b0;
        bf1_count <= {LOG_N{1'b0}};

    end else begin
        bf1_sp_en <= bf1_start ? 1'b1 : bf1_end ? 1'b0 : bf1_sp_en;
        bf1_count <= bf1_sp_en ? (bf1_count + 1'b1) : {LOG_N{1'b0}};
    end
end

assign  bf1_start   = (di_count == (2**(LOG_M-1)-1));
assign  bf1_end     = (bf1_count == (2**LOG_N-1));
assign  bf1_mj      = (bf1_count[LOG_M-1:LOG_M-2] == 2'd3);

always @(posedge clock) begin
    bf1_do_re <= bf1_sp_re;
    bf1_do_im <= bf1_sp_im;
end

//----------------------------------------------------------------------
//  2nd Butterfly
//----------------------------------------------------------------------
always @(posedge clock) begin
    bf2_bf <= bf1_count[LOG_M-2];
end

//  set unknown value x for verification
assign  bf2_x0_re = bf2_bf ? db2_do_re : {WIDTH{1'bx}};
assign  bf2_x0_im = bf2_bf ? db2_do_im : {WIDTH{1'bx}};
assign  bf2_x1_re = bf2_bf ? bf1_do_re : {WIDTH{1'bx}};
assign  bf2_x1_im = bf2_bf ? bf1_do_im : {WIDTH{1'bx}};

//  Note:
//  Negative bias occurs when RH=0 and positive bias occurs when RH=1.
//  Using both alternately reduces the overall rounding error.

Butterfly #(.WIDTH(WIDTH),.RH(1)) BF2 (
    .x0_re  (bf2_x0_re  ),  
    .x0_im  (bf2_x0_im  ),
    .x1_re  (bf2_x1_re  ), 
    .x1_im  (bf2_x1_im  ),
    .y0_re  (bf2_y0_re  ),
    .y0_im  (bf2_y0_im  ),
    .y1_re  (bf2_y1_re  ),  
    .y1_im  (bf2_y1_im  ) 
);

DelayBuffer #(.DEPTH(2**(LOG_M-2)),.WIDTH(WIDTH)) DB2 (
    .clock  (clock      ),
    .di_re  (db2_di_re  ),
    .di_im  (db2_di_im  ),
    .do_re  (db2_do_re  ),
    .do_im  (db2_do_im  ) 
);

assign  db2_di_re = bf2_bf ? bf2_y1_re : bf1_do_re;
assign  db2_di_im = bf2_bf ? bf2_y1_im : bf1_do_im;
assign  bf2_sp_re = bf2_bf ? bf2_y0_re : db2_do_re;
assign  bf2_sp_im = bf2_bf ? bf2_y0_im : db2_do_im;

always @(posedge clock or posedge reset) begin

    if (reset) begin
        bf2_sp_en <= 1'b0;
        bf2_count <= {LOG_N{1'b0}};

    end else begin
        bf2_sp_en <= bf2_start ? 1'b1 : bf2_end ? 1'b0 : bf2_sp_en;
        bf2_count <= bf2_sp_en ? (bf2_count + 1'b1) : {LOG_N{1'b0}};
    end
end

always @(posedge clock) begin
    bf2_start <= (bf1_count == (2**(LOG_M-2)-1)) & bf1_sp_en;
end

assign  bf2_end = (bf2_count == (2**LOG_N-1));

always @(posedge clock) begin
    bf2_do_re <= bf2_sp_re;
    bf2_do_im <= bf2_sp_im;
end

always @(posedge clock or posedge reset) begin
    if (reset) begin
        bf2_do_en <= 1'b0;
    end else begin
        bf2_do_en <= bf2_sp_en;
    end
end

//----------------------------------------------------------------------
//  Multiplication
//----------------------------------------------------------------------
assign  tw_sel[1] = bf2_count[LOG_M-2];
assign  tw_sel[0] = bf2_count[LOG_M-1];

assign  tw_num = bf2_count << (LOG_N-LOG_M);
assign  tw_addr = tw_num * tw_sel;

Twiddle TW (
    .clock  (clock  ), 
    .addr   (tw_addr), 
    .tw_re  (tw_re  ),
    .tw_im  (tw_im  )
);

//  Note:
//  Multiplication is bypassed when twiddle address is 0.

always @(posedge clock) begin
    mu_en <= (tw_addr != {LOG_N{1'b0}});
end

//  Set unknown value x for verification
assign  mu_a_re = mu_en ? bf2_do_re : {WIDTH{1'bx}};
assign  mu_a_im = mu_en ? bf2_do_im : {WIDTH{1'bx}};

Multiply #(.WIDTH(WIDTH)) MU (
    .a_re   (mu_a_re),  //  i
    .a_im   (mu_a_im),  //  i
    .b_re   (tw_re  ),  //  i
    .b_im   (tw_im  ),  //  i
    .m_re   (mu_m_re),  //  o
    .m_im   (mu_m_im)   //  o
);

always @(posedge clock) begin
    mu_do_re <= mu_en ? mu_m_re : bf2_do_re;
    mu_do_im <= mu_en ? mu_m_im : bf2_do_im;
end

always @(posedge clock or posedge reset) begin
    if (reset) begin
        mu_do_en <= 1'b0;
    end else begin
        mu_do_en <= bf2_do_en;
    end
end

//  Note:
//  No multiplication required at final stage

assign  do_en = (LOG_M == 2) ? bf2_do_en : mu_do_en;
assign  do_re = (LOG_M == 2) ? bf2_do_re : mu_do_re;
assign  do_im = (LOG_M == 2) ? bf2_do_im : mu_do_im;

always @(posedge clock) begin
    if (mu_do_en == 0) begin 
        do_count <= 1'b1;
    end else begin 
        do_count <= do_count + 1'b1;
    end
end

endmodule