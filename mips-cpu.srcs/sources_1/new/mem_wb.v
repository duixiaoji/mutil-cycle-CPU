`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/22 16:16:52
// Design Name: 
// Module Name: mem_wb
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


module mem_wb(
    input clk,rst,c_writeReg_m,c_writeMem_m,c_memToReg_m,
    input [31:0] aluOut_m,readData_m,
    input [4:0] writeReg_m,
    output reg c_writeReg_w,c_writeMem_w,c_memToReg_w,
    output reg [31:0] aluOut_w,readData_w,
    output reg [4:0] writeReg_w
    );
    
    initial
    begin
        c_writeReg_w<=0;
        c_writeMem_w<=0;
        c_memToReg_w<=0;
        aluOut_w<=0;
        readData_w<=0;
        writeReg_w<=0;
    end
    
    always@(posedge clk)
    begin
        if(rst)
        begin
            c_writeReg_w<=0;
            c_writeMem_w<=0;
            c_memToReg_w<=0;
            aluOut_w<=0;
            readData_w<=0;
            writeReg_w<=0;
        end
        else
        begin
            c_writeReg_w<=c_writeReg_m;
            c_writeMem_w<=c_writeMem_m;
            c_memToReg_w<=c_memToReg_m;
            aluOut_w<=aluOut_m;
            readData_w<=readData_m;
            writeReg_w<=writeReg_m;
        end
    end    
endmodule
