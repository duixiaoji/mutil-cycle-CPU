`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 15:42:57
// Design Name: 
// Module Name: ins_mem
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


module ins_mem(
    input [31:0] pc_f,
    output [31:0] ins_f
    );
    reg [31:0] insMem[1023:0];
  
    initial $readmemh("E:\\code\\vivado\\mips-cpu\\mips-cpu.srcs\\sources_1\\new\\code1.txt", insMem);
  
    assign ins_f = insMem[pc_f[11:2]];
endmodule
