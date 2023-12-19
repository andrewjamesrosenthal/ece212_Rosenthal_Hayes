module single_pulser(input logic clk, din, output logic d_pulse);
    logic dq1, dq2;

    always_ff @(posedge clk)
    begin
        dq1 <= din;
        dq2 <= dq1;
    end

    assign d_pulse = dq1 & ~dq2;
endmodule: single_pulser