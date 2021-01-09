`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/22 15:47:08
// Design Name: 
// Module Name: ex_mem
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


module ex_mem(
    input clk,rst,c_writeReg_e,c_writeMem_e,c_memToReg_e,
    input [31:0] aluOut_e,aluIn2_e,
    input [4:0] writeReg_e,
    output reg c_writeReg_m,c_writeMem_m,c_memToReg_m,
    output reg [31:0] aluOut_m,aluIn2_m,
    output reg [4:0] writeReg_m
    );
    
    initial
    begin
        c_writeReg_m<=0;
        c_writeMem_m<=0;
        c_memToReg_m<=0;
        aluOut_m<=0;
        aluIn2_m<=0;
        writeReg_m<=0;
    end
    
    always@(posedge clk)
    begin
        if(rst)
        begin
            c_writeReg_m<=0;
            c_writeMem_m<=0;
            c_memToReg_m<=0;
            aluOut_m<=0;
            aluIn2_m<=0;
            writeReg_m<=0;
        end
        else
        begin
            c_writeReg_m<=c_writeReg_e;
            c_writeMem_m<=c_writeMem_e;
            c_memToReg_m<=c_memToReg_e;
            aluOut_m<=aluOut_e;
            aluIn2_m<=aluIn2_e;
            writeReg_m<=writeReg_e;
        end
    end
endmodule
