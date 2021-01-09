`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 15:48:01
// Design Name: 
// Module Name: pc_jump
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


module pc_jump(
    input [31:0] pc4_f,ins_f,
    output c_jump_f,
    output [31:0] pcJump_f
    );
    
    assign c_jump_f=(ins_f[31:26]==6'b000010) ? 1'b1:1'b0;
    assign pcJump_f={pc4_f[31:28],ins_f[25:0],2'b00};
endmodule
