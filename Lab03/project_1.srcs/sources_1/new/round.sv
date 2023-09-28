
module round (
  input logic [16:0] tx10_mag,
  output logic [12:0] tx10_mag_r
);

  always_comb begin
      if (tx10_mag[3] && |tx10_mag[2:0] != 3'b0) begin
      tx10_mag_r = tx10_mag + 1;
    end
    else begin
      tx10_mag_r = tx10_mag;
    end
  end

endmodule
