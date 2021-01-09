`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 16:12:24
// Design Name: 
// Module Name: cu
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


module cu(
    input [5:0] op_d,
    output [1:0] c_aluOp_d,
    output c_writeReg_d,c_writeMem_d,c_memTOreg_d,c_aluIn1_d,c_aluIn2_d,c_rdORrt_d,c_branch_d,c_zeroORsign_d
    );
    
    reg [9:0] temp;
    initial temp<=10'b0000000000;
    
    assign {c_aluOp_d,c_writeReg_d,c_writeMem_d,c_memTOreg_d,c_aluIn1_d,c_aluIn2_d,c_rdORrt_d,c_branch_d,c_zeroORsign_d}=temp;
    
    always@(op_d)
    begin
        case(op_d)
            6'b000000: //R
                temp=10'b00_1_0_0_0_0_1_0_0;
            //I
            6'b000100: // beq
                temp=10'b11_0_0_0_0_0_0_1_1;
            
            6'b001000: //addi
                temp=10'b01_1_0_0_0_1_0_0_1;
            6'b001001: //addiu
                temp=10'b01_1_0_0_0_1_0_0_0;
            6'b001100: //andi
                temp=10'b01_1_0_0_0_1_0_0_0;
            6'b001101: //ori
                temp=10'b01_1_0_0_0_1_0_0_0;
            6'b001110: //xori
                temp=10'b01_1_0_0_0_1_0_0_0;
            6'b001010: //slti
                temp=10'b01_1_0_0_0_1_0_0_1;
            6'b001011: //sltiu
                temp=10'b01_1_0_0_0_1_0_0_0;   
            6'b100011: //lw
                temp=10'b01_1_0_1_0_1_0_0_1;
            6'b101011: //sw
                temp=10'b01_0_1_0_0_1_0_0_1;
            default:
                temp <= 10'b000000000;
        endcase
    end
    
endmodule
