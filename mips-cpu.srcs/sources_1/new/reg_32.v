`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 17:01:10
// Design Name: 
// Module Name: reg_32
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


module reg_32(
    input clk,rst,c_writeReg_w,
    input [4:0] rs_d,rt_d,writeReg_w,
    input [31:0] wbData_w,
    output [31:0] regOut1_d,regOut2_d
    );
    
    reg[31:0] regs[31:0];
    integer i;
  
    initial for (i = 0; i < 32; i = i + 1) regs[i] <= 0;
    
    always@(posedge clk)
    begin
        if(c_writeReg_w&&(writeReg_w!=0)) regs[writeReg_w]<=wbData_w;
    end
    
    always@(rst)
    begin
        for (i = 0; i < 32; i = i + 1) regs[i] <= 0;
    end
    
    assign regOut1_d=(c_writeReg_w && (writeReg_w==rs_d)&&(writeReg_w!=0)) ? wbData_w:regs[rs_d];
    assign regOut2_d=(c_writeReg_w && (writeReg_w==rt_d)&&(writeReg_w!=0)) ? wbData_w:regs[rt_d];
endmodule
