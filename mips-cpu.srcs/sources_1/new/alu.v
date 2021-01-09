`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/22 15:17:15
// Design Name: 
// Module Name: alu
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


module alu(
    input [5:0] c_aluCtrl_e,
    input [31:0] aluIn1_e,aluIn2_1_e,
    input [4:0] shamt_e,
    output reg [31:0] aluOut_e
    );
    initial aluOut_e<=0;
    
    always@(*)
    begin
        case(c_aluCtrl_e)
            6'b100000: aluOut_e<=aluIn1_e+aluIn2_1_e; //add
            6'b100010: aluOut_e<=aluIn1_e-aluIn2_1_e; //sub
            6'b100100: aluOut_e<=aluIn1_e&aluIn2_1_e; //and
            6'b100101: aluOut_e<=aluIn1_e|aluIn2_1_e; //or
            6'b101010: aluOut_e<=(aluIn1_e<aluIn2_1_e) ? 1:0; //slt
            6'b100110: aluOut_e<=aluIn1_e^aluIn2_1_e; //xor
            6'b100111: aluOut_e<=~(aluIn1_e|aluIn2_1_e); //nor
            6'b000000: aluOut_e<=aluIn2_1_e<<shamt_e; //sll
            6'b000010: aluOut_e<=aluIn2_1_e>>shamt_e; //srl
            6'b000011: aluOut_e<=$signed(aluIn1_e) >>> $signed(shamt_e); //sra
            6'b000100: aluOut_e<=aluIn2_1_e<<aluIn1_e; //sllv
            6'b000110: aluOut_e<=aluIn2_1_e>>aluIn1_e; //srlv
            6'b000111: aluOut_e<=$signed(aluIn1_e) >>> $signed(aluIn1_e); //srav
            
            default :aluOut_e<=0;
        endcase
    end
    
endmodule
