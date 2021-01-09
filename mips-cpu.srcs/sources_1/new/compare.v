`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 18:48:22
// Design Name: 
// Module Name: compare
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


module compare(
    input [31:0] regOut1_1_d,regOut2_1_d,
    input c_branch_d,
    output c_branchComp_d
    );
    
    assign c_branchComp_d=c_branch_d && ((regOut1_1_d==regOut2_1_d) ? 1:0);
endmodule
