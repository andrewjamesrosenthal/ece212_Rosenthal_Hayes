module clkdiv(input logic clk, input logic reset, output logic sclk);
   parameter DIVFREQ = 100;  // desired frequency in Hz (change as needed)
   parameter DIVBITS = 26;   // enough bits to divide 100MHz down to 1 Hz
   parameter CLKFREQ = 100_000_000;
   parameter DIVAMT = (CLKFREQ / DIVFREQ) / 2;

   logic [DIVBITS-1:0] q;

   always_ff @(posedge clk)
     if (reset) begin
	    q <= 0;
	    sclk <= 0;
     end
     else if (q == DIVAMT-1) begin
	    q <= 0;
	    sclk <= ~sclk;
     end
     else q <= q + 1;

endmodule // clkdiv