`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 16:33:02
// Design Name: 
// Module Name: alu_ctrl
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


module alu_ctrl(
    input [1:0] c_aluOp_d,
    input [5:0] func_d,
    input [5:0] op_d,
    output reg [5:0] c_aluCtrl_d
    );
    
    initial c_aluCtrl_d<=6'b000000;
    
    always@(*)
    begin
        case(c_aluOp_d)
            2'b01: //I
            begin
                case(op_d)
                    6'b001000:c_aluCtrl_d<=6'b100000; //addi
                    6'b001001:c_aluCtrl_d<=6'b100000; //addiu
                    6'b001100:c_aluCtrl_d<=6'b100100; //addi
                    6'b001101:c_aluCtrl_d<=6'b100101; //ori
                    6'b001110:c_aluCtrl_d<=6'b100110; //xori
                    6'b001010:c_aluCtrl_d<=6'b101010; //slti
                    6'b001011:c_aluCtrl_d<=6'b101010; //sltiu
                    6'b100011:c_aluCtrl_d<=6'b100000; //lw
                    6'b101011:c_aluCtrl_d<=6'b100000; //sw
                    default:c_aluCtrl_d<=6'b111111;
                endcase
            end
            2'b00: //R
            begin
                case(func_d)
                    6'b100000:c_aluCtrl_d<=6'b100000; //add
                    6'b100010:c_aluCtrl_d<=6'b100010; //sub
                    6'b100100:c_aluCtrl_d<=6'b100100; //and
                    6'b100101:c_aluCtrl_d<=6'b100101; //or
                    6'b101010:c_aluCtrl_d<=6'b101010; //slt
                    6'b100110:c_aluCtrl_d<=6'b100110; //xor
                    6'b100111:c_aluCtrl_d<=6'b100111; //nor
                    6'b000000:c_aluCtrl_d<=6'b000000; //sll
                    6'b000010:c_aluCtrl_d<=6'b000010; //srl
                    6'b000011:c_aluCtrl_d<=6'b000011; //sra
                    6'b000100:c_aluCtrl_d<=6'b000100; //sllv
                    6'b000110:c_aluCtrl_d<=6'b000110; //srlv
                    6'b000111:c_aluCtrl_d<=6'b000111; //srav
                    
                    default:c_aluCtrl_d<=6'b111111;
                endcase
            end
            default:c_aluCtrl_d<=6'b111111;
        endcase
    end
    
endmodule
