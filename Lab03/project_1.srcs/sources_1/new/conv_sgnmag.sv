module conv_sgnmag (
  input signed [17:0] tx10,
  output logic tx10_sign,
  output logic [16:0] tx10_mag
);

  always_comb begin
    tx10_sign = (tx10[17] == 1'b1);    
    tx10_mag = (tx10[17:4] >= 0) ? tx10[17:4] : -tx10[17:4];
  end

endmodule
