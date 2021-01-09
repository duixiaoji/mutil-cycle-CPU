`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 10:22:18
// Design Name: 
// Module Name: lab_top
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


module lab_top(
    input clk,
    input s,
    input [31:0] x,
    output [6:0] a_to_g_0,
    output [6:0] a_to_g_1,
    output [7:0] an
    );
    wire rst;
    assign rst = s;

    
    lab l1 (.x(x[15:0]),
    .clk(clk),
    .rst(rst),
    .a_to_g(a_to_g_0),
    .an(an[3:0])
    );
    lab l2(.x(x[31:16]),
     .clk(clk),
    .rst(rst),
    .a_to_g(a_to_g_1),
    .an(an[7:4])
    );
endmodule

