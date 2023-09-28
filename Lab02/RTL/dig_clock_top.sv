`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2023 01:20:47 PM
// Design Name: 
// Module Name: dig_clock_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dig_clock_top(
input logic btn_l, btn_r, clk, rst,
output logic [7:0]an_n, 
output logic [6:0] segs_n,
output logic dp_n
);


    logic [6:0]h1, h0, m1, m0, s1, s0, am_pm;
    logic l_db, r_db;
    logic adv_min, adv_hr;
  //  assign empty = 8'b10000000;

    //debounce DBNC(.clk, .pb, .rst, .pb_debounced);
    dig_clock DIGCLK(.rst, .adv_hr, .adv_min, .clk, .h1, .h0, .m1, .m0, .s1, .s0, .am_pm) ;
    sevenseg_ctl(.rst, .clk, .d7(h1), .d6(h0), .d5(m1), .d4(m0), .d3(s1), .d2(s0),.d1(empty), .d0(am_pm), .dp_n(dp_n), .an_n, .segs_n);
debounce dbl( .clk, .pb(btn_l), .rst, .pb_debounced(hr_db));
debounce dbr(.clk, .pb(btn_r), .rst, .pb_debounced(min_db));
single_pulser spl(.clk, .din(hr_db), .d_pulse(adv_hr));
single_pulser spr(.clk, .din(min_db), .d_pulse(adv_min));
    
endmodule
