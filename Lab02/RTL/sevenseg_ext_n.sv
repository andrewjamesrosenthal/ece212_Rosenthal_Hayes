`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2023 02:35:58 PM
// Design Name: 
// Module Name: sevenseg_ext_n
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


module  sevenseg_ext_n(input logic [6:0] d,
 output logic [6:0] segs_n,
 output logic dp_n);
 logic [6:0] segs;
 logic [3:0] temp = d[3:0];
 always_comb
 begin
 case (d[3:0])
 // Hexadecimal values 
     4'd0: segs = 7'b111_1110;
     4'd1: segs = 7'b011_0000;
     4'd2: segs = 7'b110_1101;
     4'd3: segs = 7'b111_1001;
     4'd4: segs = 7'b011_0011;
     4'd5: segs = 7'b101_1011;
     4'd6: segs = 7'b101_1111;
     4'd7: segs = 7'b111_0000;
     4'd8: segs = 7'b111_1111;
     4'd9: segs = 7'b111_0011;
     4'Ha: segs = 7'b111_0111;
     4'Hb: segs = 7'b110_0111; // NEW P
     4'Hc: segs = 7'b100_1110; // NEW C
     4'Hf: segs = 7'b100_0111; 
default: segs = 7'b000_0000;
 endcase

 if(d[4]==1) begin
 segs = 7'b000_0001;
 end
 
 if(d[6]==1) begin
 segs=7'b000_0000;
 end
// assign segs = (data[5]? 7'b000_0000);
  segs_n = ~segs;
 end
assign dp_n = (!(d[5]&&!d[6]));

 //assign dp_n = (d[3]);
//(d[4]&&!d[5]?0:1)
endmodule
