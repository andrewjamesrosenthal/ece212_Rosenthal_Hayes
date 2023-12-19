module lab03_top (
    input logic clk, rst, c_f, switch,
    input logic [12:0] temp_sub,
    output logic [7:0] an_n_tmp,
    output logic [6:0] segs_n_tmp,
    output logic dp_n,
    inout tmp_scl,
    inout tmp_sda
);

    logic tmp_rdy, tmp_err;
    logic [12:0] temp, temp_sel;
    logic tx10_sign;
    logic [3:0] thousands, hundreds, tens, ones, d0;
    logic [6:0] d5, thousands_d, hundreds_d;

    always_comb begin
        if (switch)
            temp_sel = temp_sub;
        else
            temp_sel = temp;

        if (c_f)
            d0 = 4'hf;
        else
            d0 = 4'hc;

        if (tx10_sign) begin
            if (thousands)
                d5 = 7'b0111111;
            else
                d5 = 7'b1111111;

            if (thousands == 0 && hundreds)
                thousands_d = 7'b0111111;
            else if (thousands == 0 && hundreds == 0) begin
                hundreds_d = 7'b0111111;
                thousands_d = 7'b1111111;
            end
            else begin
                thousands_d = thousands;
                hundreds_d = hundreds;
            end
        end
        else
            d5 = 7'b1111111;

        if (tx10_sign == 0) begin
            if (thousands == 0)
                thousands_d = 7'b1111111;
            else
                thousands_d = thousands;

            if (thousands == 0 && hundreds == 0)
                hundreds_d = 7'b1111111;
            else
                hundreds_d = hundreds;
        end
    end


    TempSensorCtl U_TSCTL (
        .TMP_SCL(tmp_scl),
        .TMP_SDA(tmp_sda),
        .TEMP_O(temp),
        .RDY_O(tmp_rdy),
        .ERR_O(tmp_err),
        .CLK_I(clk),
        .SRST_I(rst)
    );

    tdisplay U_display (
        .tc(temp_sel),
        .c_f,
        .tx10_sign,
        .thousands(thousands),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );

    sevenseg_ctl U_segment (
        .clk(clk),
        .rst(rst),
        .d7(7'b1111111),
        .d6(7'b1111111),
        .d5,
        .d4(thousands_disp),
        .d3(hundreds_disp),
        .d2({tens[6],2'b10,tens[3:0]}),
        .d1(ones),
        .d0,
        .segs_n(segs_n_tmp),
        .dp_n(dp_n_tmp),
        .an_n(an_n_tmp)
    );

endmodule

