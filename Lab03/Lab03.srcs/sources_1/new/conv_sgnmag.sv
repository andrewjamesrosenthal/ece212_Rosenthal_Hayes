module conv_sgnmag(
        input logic [17:0] tx10,
        
        output logic [16:0] tx10_mag,
        output logic [6:0] tx10_sign
    );
  always_comb  
    begin
        if( tx10[17] == 0)
            begin
                tx10_mag = tx10[16:0];
                tx10_sign = tx10[17];
            end
        else
            begin   
                tx10_mag = ~tx10[16:0] + 1;
                tx10_sign = tx10[17];
            end
    end
endmodule
