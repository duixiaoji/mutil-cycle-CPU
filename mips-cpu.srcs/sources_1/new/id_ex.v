`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/22 14:44:08
// Design Name: 
// Module Name: id_ex
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


module id_ex(
    input clk,rst,c_empty_e,c_writeReg_d,c_rdORrt_d,c_writeMem_d,c_memToReg_d,c_aluIn2_d,
    input [5:0] c_aluCtrl_d,
    input [4:0] rs_d,rt_d,rd_d,shamt_d,
    input [31:0] regOut1_d,regOut2_d,immExt_d,
    output reg c_writeReg_e,c_rdORrt_e,c_writeMem_e,c_memToReg_e,c_aluIn2_e,
    output reg [5:0] c_aluCtrl_e,
    output reg [4:0] rs_e,rt_e,rd_e,shamt_e,
    output reg [31:0] regOut1_e,regOut2_e,immExt_e
    );
    
    initial
    begin
        c_writeReg_e<=0;
        c_rdORrt_e<=0;
        c_writeMem_e<=0;
        c_memToReg_e<=0;
        c_aluCtrl_e<=0;
        c_aluIn2_e<=0;
        rs_e<=5'b00000;
        rt_e<=5'b00000;
        rd_e<=5'b00000;
        shamt_e<=0;
        regOut1_e<=0;
        regOut2_e<=0;
        immExt_e<=0;
    end
    
    always@(posedge clk)
    begin
        if(c_empty_e || rst)
        begin
            c_writeReg_e<=0;
            c_rdORrt_e<=0;
            c_writeMem_e<=0;
            c_memToReg_e<=0;
            c_aluCtrl_e<=0;
            c_aluIn2_e<=0;
            rs_e<=5'b00000;
            rt_e<=5'b00000;
            rd_e<=5'b00000;
            shamt_e<=0;
            regOut1_e<=0;
            regOut2_e<=0;
            immExt_e<=0;
        end
        else
        begin
            c_writeReg_e<=c_writeReg_d;
            c_rdORrt_e<=c_rdORrt_d;
            c_writeMem_e<=c_writeMem_d;
            c_memToReg_e<=c_memToReg_d;
            c_aluCtrl_e<=c_aluCtrl_d;
            c_aluIn2_e<=c_aluIn2_d;
            rs_e<=rs_d;
            rt_e<=rt_d;
            rd_e<=rd_d;
            shamt_e<=shamt_d;
            regOut1_e<=regOut1_d;
            regOut2_e<=regOut2_d;
            immExt_e<=immExt_d;
        end
    end                     
endmodule
