`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 18:57:03
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(
    input [15:0] imm_d,
    input c_zeroORsign_d,
    output [31:0] immExt_d
    );
    
    assign immExt_d[31:16]=c_zeroORsign_d ? (imm_d[15] ? 16'hffff : 16'h0000) : 16'h0000;
    assign immExt_d[15:0]=imm_d;
endmodule
