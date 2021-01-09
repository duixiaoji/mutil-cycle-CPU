`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 18:54:07
// Design Name: 
// Module Name: pc_branch
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


module pc_branch(
    input [31:0] pc4_d,immExt_d,
    output [31:0] pcBranch_d
    );
    
    assign pcBranch_d=pc4_d+{immExt_d[29:0],2'b00};
endmodule
