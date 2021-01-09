`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/22 16:27:19
// Design Name: 
// Module Name: fw_stall
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


module fw_stall(
    input c_branch_d,c_writeMem_d,c_writeMem_m,c_writeMem_w,c_branchComp_d,c_memToReg_e,c_memToReg_m,
    input c_writeReg_e,c_writeReg_m,c_writeReg_w,
    input [4:0] rs_d,rt_d,rs_e,rt_e,writeReg_e,writeReg_m,writeReg_w,
    output c_stall_f,c_stall_d,c_empty_d,c_empty_e,c_fwMem_m,
    output [1:0] c_fwAluIn1_e,c_fwAluIn2_e,c_fwRegOut1_d,c_fwRegOut2_d
    );
    
    
    assign lw_use_stall=!c_writeMem_d && c_memToReg_e && ((writeReg_e==rs_d && writeReg_e!=0)||(writeReg_e==rt_d && writeReg_e!=0));
    
    assign lw_branch_stall=c_branch_d && c_memToReg_m && ((writeReg_m==rs_d && writeReg_m!=0)||(writeReg_m==rt_d && writeReg_m!=0));
    
    assign c_stall_d=lw_use_stall||lw_branch_stall;
    assign c_stall_f=c_stall_d;
    assign c_empty_e=c_stall_d;
    assign c_empty_d=(!c_stall_d) && c_branchComp_d;
    
    assign c_fwRegOut1_d=c_writeReg_m && writeReg_m==rs_d && writeReg_m!=0 ? 2'b10:
                        c_writeReg_e && writeReg_e==rs_d && writeReg_e!=0 ? 2'b01:
                        2'b00;
                        
    assign c_fwRegOut2_d=c_writeReg_m && writeReg_m==rt_d && writeReg_m!=0 ? 2'b10:
                        c_writeReg_e && writeReg_e==rt_d && writeReg_e!=0 ? 2'b01:
                        2'b00;
                        
    assign c_fwAluIn1_e=c_writeReg_m && writeReg_m==rs_e && writeReg_m!=0 ? 2'b10:
                        c_writeReg_w && writeReg_w==rs_e && writeReg_w!=0 ? 2'b01:
                        2'b00; 
                        
    assign c_fwAluIn2_e=c_writeReg_m && writeReg_m==rt_e && writeReg_m!=0 ? 2'b10:
                        c_writeReg_w && writeReg_w==rt_e && writeReg_w!=0 ? 2'b01:
                        2'b00;                                        
    
    assign c_fwMem_m=c_writeMem_m && !c_writeMem_w && writeReg_m==writeReg_w;                    
    
endmodule
