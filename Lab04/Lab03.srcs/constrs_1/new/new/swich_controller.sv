module switch_controller(
input clk, rst, q,
input [7:0]an_n_clk,
input [6:0]segs_n_clk,
input dp_n_clk,
input switch_main,

input [7:0]an_n_tmp,
input [6:0]segs_n_tmp,


output reg [7:0]an_n,
output reg [6:0]segs_n,
output reg dp_n
    );
    
reg mux_select;
        
       always@(posedge clk or posedge rst) begin
        if (rst) begin
            segs_n <= 7'b0000000;
            an_n <= 8'b0000000;
            dp_n <= 1'b0;
            mux_select <= 1'b0;
        end else begin
            mux_select <= ~mux_select;
                if (q) begin
                mux_select <= !mux_select;
            end
            if (switch_main) begin
                segs_n <= segs_n_tmp;
                an_n <= an_n_tmp;
            end else begin
                segs_n <= segs_n_clk;
                an_n <= an_n_clk;
                dp_n <= dp_n_clk;
                
            end
        end
    end
endmodule
