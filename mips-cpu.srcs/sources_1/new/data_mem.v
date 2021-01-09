`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/22 15:58:52
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input clk,c_writeMem_m,
    input [31:0] writeData_m,aluOut_m,
    output [31:0] readData_m
    );
    
    reg [31:0] dataMem[0:1023];
    integer i;
    
    initial for (i = 0; i < 1023; i = i + 1) dataMem[i] <= 0;
    
    always@(posedge clk)
    begin
        if(c_writeMem_m) dataMem[aluOut_m[11:2]]<=writeData_m;
    end
    
    assign readData_m=dataMem[aluOut_m[11:2]];
endmodule
