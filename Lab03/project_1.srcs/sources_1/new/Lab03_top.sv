module Lab03_top(
 input logic clk, rst,
 output logic [7:0] an_n,
 output logic [6:0] segs_n,
 output logic dp_n,
 inout tmp_scl, // use inout only - no logic
 inout tmp_sda // use inout only - no logic
 );
 logic tmp_rdy, tmp_err; // unused temp controller outputs
 // 13-bit two's complement result with 4-bit fractional part
 logic [12:0] temp;
logic [12:0] tc;
logic [17:0] tx10;
logic  c_f;
logic tx10_sign ;
logic [16:0] tx10_mag;
logic [12:0] tx10_mag_r;
logic [3:0] ones;
logic [3:0] tens;
logic [3:0] hund;
logic [3:0] thou;
 // instantiate the VHDL temperature sensor controller
 TempSensorCtl U_TSCTL (
 .TMP_SCL(tmp_scl), .TMP_SDA(tmp_sda), .TEMP_O(temp),
 .RDY_O(tmp_rdy), .ERR_O(tmp_err), .CLK_I(clk),
 .SRST_I(rst)
 );
 // add additional signals & instantiations here
    tconvert (.tc(temp), .c_f, .tx10);
    conv_sgnmag(.tx10, .tx10_sign, .tx10_mag);
    round (.tx10_mag, .tx10_mag_r);
    dbl_dabble_ext (.b(tx10_mag_r), .ones, .tens, .hundreds(hund), .thousands(thou));
    sevenseg_ctl (.clk, .rst, .d3(thou), .d2(hund), .d1(tens), .d0(ones), .segs_n, .dp_n, .an_n);
endmodule