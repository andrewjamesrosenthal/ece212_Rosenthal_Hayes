`timescale 1ns / 1ps
module dig_clock(
    input logic clk, rst, adv_hr, adv_min, clr,
    output logic [6:0] h1, h0, m1, m0, s1, s0, am_pm,empty
    );
    logic enb,ampm;
    logic [3:0] oneS, tenS, oneM, tenM, oneH,tenH;
    logic [5:0] h, m,s,h_temp;
    logic sEnb, mEnb, hEnb, enb_out;
    period_enb1000(.clk, .rst, .clr, .enb_out);
    
//    logic[5:0] s,m,h,ampm;
    
    counter_rc_mod  # (.MOD(60)) second(.clk,.rst,.enb(enb_out), .q(s),.cy(sEnb));
    counter_rc_mod  # (.MOD(60)) minute(.clk,.rst,.enb(sEnb||adv_min), .q(m),.cy(mEnb));
    counter_rc_mod  # (.MOD(12)) hour(.clk,.rst,.enb(mEnb||adv_hr), .q(h_temp),.cy(hEnb));

    assign h = h_temp !=0 ? h_temp : 4'd12;
    
    dbl_dabble sDD (.b(s),.tens(tenS),.ones(oneS));
    dbl_dabble mDD (.b(m),.tens(tenM),.ones(oneM));
    dbl_dabble hDD (.b(h),.tens(tenH),.ones(oneH));

    
    assign s0[3:0] = oneS;
    assign s1[3:0] = tenS;

    assign m0[3:0] = oneM;
    assign m1[3:0] = tenM;
    
    assign h0[3:0] = oneH;
    assign h1[3:0] = tenH;



    assign s0[6:4] = 3'b000;
    assign s1[6:4] = 3'b000;

    assign m0[6:4] = 3'b010;
    assign m1[6:4] = 3'b000;
    
    assign h0[6:4] = 3'b010;
    assign h1[5:4] = 2'b00;

    assign h1[6]=h1[3:0]? 1'b0:1'b1;
    
    
    
    counter_rc_mod # (.MOD(2)) ampm1(.clk(clk),.rst(rst),.enb(hEnb), .q(ampm));

    assign am_pm [3:0] = ampm+10;
    assign am_pm [6:4] = 3'b000;

    
endmodule