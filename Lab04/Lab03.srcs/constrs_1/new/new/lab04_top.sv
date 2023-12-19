module lab04_top(
    input logic clk, rst, c_f, switch, btn_l, btn_r,
//    input logic [12:0] temp_sub,
    input logic switch_main,
    output logic [7:0] an_n,
    output logic [6:0] segs_n,
    output logic dp_n,
    
    
    inout tmp_scl,
    inout tmp_sda
    );
  logic dp_n_clk;
  logic [7:0]an_n_clk;
  logic [6:0]segs_n_clk;
  
  logic dp_n_tmp;
  logic [7:0]an_n_tmp;
  logic [6:0]segs_n_tmp;
  logic q;

  
  lab03_top(.clk, .rst, .c_f, .switch,.an_n_tmp,.segs_n_tmp,.dp_n,.tmp_scl,.tmp_sda);
  dig_clock_top(.btn_l, .btn_r, .clk, .rst,.an_n_clk, .segs_n_clk,.dp_n_clk);
  switch_controller(.clk, .q, .switch_main, .rst, .an_n_clk, .segs_n_clk, .dp_n_clk, .an_n_tmp, .segs_n_tmp, .an_n, .segs_n, .dp_n);
    counter2(.rst, .clk, .switch_main, .q);
    
    endmodule