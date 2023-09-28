`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 02:38:43 PM
// Design Name: 
// Module Name: tconvert
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


module tconvert(
  input signed [12:0] tc, 
    input c_f,               
    output signed [17:0] tx10 
);
    assign tx10 = (c_f == 0) ? (tc << 1) + tc : 
                                 (tc * 29) + 5120; 
endmodule
