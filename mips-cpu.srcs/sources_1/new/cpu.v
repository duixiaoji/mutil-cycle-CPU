`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 19:05:41
// Design Name: 
// Module Name: cpu
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


module cpu(
    input clk_in,rst,
    output [6:0] a_to_g_0,
    output [6:0] a_to_g_1,
    output [7:0] an
    );
    
    wire clk;
    wire c_stall_f,c_jump_f, c_branchComp_d,c_stall_d,c_empty_d,c_writeReg_d,c_writeMem_d;
    wire c_memToReg_d,c_aluIn1_d,c_aluIn2_d,c_rdORrt_d,c_branch_d;
    wire c_writeReg_w,c_empty_e,c_writeReg_e,c_rdORrt_e,c_writeMem_e,c_memToReg_e,c_aluIn2_e;
    wire c_writeReg_m,c_writeMem_m,c_memToReg_m,c_fwMem_m,c_writeReg_w,c_writeMem_w,c_memToReg_w,c_zeroORsign_d;
    wire [1:0] c_aluOp_d,c_fwRegOut1_d,c_fwRegOut2_d,c_fwAluIn1_e,c_fwAluIn2_e;
    wire [4:0] rs_d,rt_d,rd_d,shamt_d,shamt_e,rs_e,rt_e,rd_e,writeReg_e,writeReg_m,writeReg_w;
    wire [5:0] op_d,func_d,c_aluCtrl_d,c_aluCtrl_e;
    wire [15:0] imm_d;
    wire [31:0] pcJump_f, pcBranch_d,pc4_f, pc_f,ins_f,ins_d,pc4_d,wbData_w,regOut1_d,regOut2_d;
    wire [31:0] aluOut_m,regOut1_1_d,regOut2_1_d,immExt_d,regOut1_e,regOut2_e,immExt_e;
    wire [31:0] aluIn1_e,aluIn2_e,aluOut_e,aluIn2_m,writeData_m,readData_m,aluOut_w,readData_w,aluIn2_1_e;
    
    //show
    lab_top lab_top(
    clk_in,rst,
    ins_f,
    a_to_g_0,
    a_to_g_1,
    an
    );
    
    
    //div clk
    div_clk div_clk(clk_in,clk);
    
    //forwarding stall
    fw_stall fw_stall(c_branch_d,c_writeMem_d,c_writeMem_m,c_writeMem_w,c_branchComp_d,c_memToReg_e,c_memToReg_m,
                    c_writeReg_e,c_writeReg_m,c_writeReg_w,
                    rs_d,rt_d,rs_e,rt_e,writeReg_e,writeReg_m,writeReg_w,
                    c_stall_f,c_stall_d,c_empty_d,c_empty_e,c_fwMem_m,
                    c_fwAluIn1_e,c_fwAluIn2_e,c_fwRegOut1_d,c_fwRegOut2_d);
    
    //if
    pc pc(clk, rst, !c_stall_f, c_jump_f, c_branchComp_d,pcJump_f, pcBranch_d,pc4_f, pc_f);
    ins_mem ins_mem(pc_f,ins_f);
    pc_jump pc_jump(pc4_f,ins_f,c_jump_f,pcJump_f);
    
    //id
    if_id if_id(clk, rst, !c_stall_d,c_empty_d,ins_f, pc4_f,ins_d, pc4_d);
    ins_cut ins_cut(ins_d,op_d,func_d,rs_d,rt_d,rd_d,shamt_d,imm_d);
    cu cu(op_d,c_aluOp_d,c_writeReg_d,c_writeMem_d,c_memToReg_d,c_aluIn1_d,c_aluIn2_d,c_rdORrt_d,c_branch_d,c_zeroORsign_d);
    alu_ctrl alu_ctrl(c_aluOp_d,func_d,op_d,c_aluCtrl_d);
    reg_32 reg_32(clk,rst,c_writeReg_w,rs_d,rt_d,writeReg_w,wbData_w,regOut1_d,regOut2_d);
    mux3 #(32) fw_regOut1(regOut1_d,aluOut_e,aluOut_m,c_fwRegOut1_d,regOut1_1_d);
    mux3 #(32) fw_regOut2(regOut2_d,aluOut_e,aluOut_m,c_fwRegOut2_d,regOut2_1_d);
    compare compare(regOut1_1_d,regOut2_1_d,c_branch_d,c_branchComp_d);
    sign_extend sign_extend(imm_d,c_zeroORsign_d,immExt_d);
    pc_branch pc_branch(pc4_d,immExt_d,pcBranch_d);
    
    //ex
    id_ex id_ex(clk,rst,c_empty_e,c_writeReg_d,c_rdORrt_d,c_writeMem_d,c_memToReg_d,c_aluIn2_d,
                c_aluCtrl_d,
                rs_d,rt_d,rd_d,shamt_d,
                regOut1_d,regOut2_d,immExt_d,
                c_writeReg_e,c_rdORrt_e,c_writeMem_e,c_memToReg_e,c_aluIn2_e,
                c_aluCtrl_e,
                rs_e,rt_e,rd_e,shamt_e,
                regOut1_e,regOut2_e,immExt_e);
    mux2 #(5) writeReg_mux(rt_e,rd_e,c_rdORrt_e,writeReg_e);
    mux3 #(32) fw_aluIn1(regOut1_e,wbData_w,aluOut_m,c_fwAluIn1_e,aluIn1_e);
    mux3 #(32) fw_aluIn2(regOut2_e,wbData_w,aluOut_m,c_fwAluIn2_e,aluIn2_e); 
    mux2 #(32) aluIn2_mux(aluIn2_e,immExt_e,c_aluIn2_e,aluIn2_1_e);
    alu alu(c_aluCtrl_e,aluIn1_e,aluIn2_1_e,shamt_e,aluOut_e); 
    
    //mem
    ex_mem ex_mem(clk,rst,c_writeReg_e,c_writeMem_e,c_memToReg_e,
                aluOut_e,aluIn2_e,
                writeReg_e,
                c_writeReg_m,c_writeMem_m,c_memToReg_m,
                aluOut_m,aluIn2_m,
                writeReg_m);
    mux2 #(32) fw_mem(aluIn2_m,wbData_w,c_fwMem_m,writeData_m);
    data_mem data_mem(clk,c_writeMem_m,writeData_m,aluOut_m,readData_m);
    
    //wb
    mem_wb mem_wb(clk,rst,c_writeReg_m,c_writeMem_m,c_memToReg_m,
                aluOut_m,readData_m,
                writeReg_m,
                c_writeReg_w,c_writeMem_w,c_memToReg_w,
                aluOut_w,readData_w,
                writeReg_w);
    mux2 #(32) wbData_mux(aluOut_w,readData_w,c_memToReg_w,wbData_w);
    

          
endmodule
