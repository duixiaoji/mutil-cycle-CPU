`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 18:41:43
// Design Name: 
// Module Name: mux
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


module mux2 #(parameter width = 8)
(
    input [width-1:0] x0, x1, 
    input c, 
    output [width-1:0] y
    );

  assign y = c ? x1 : x0; 
  
endmodule

module mux3 #(parameter width = 8)(
    input [width-1:0] x0, x1, x2,
    input [1:0] c, 
    output [width-1:0] y
    );

  assign y = c[1] ? x2 : (c[0] ? x1 : x0); 
  
endmodule
