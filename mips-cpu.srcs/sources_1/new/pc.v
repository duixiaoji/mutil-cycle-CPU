`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 15:22:16
// Design Name: 
// Module Name: pc
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


module pc(
  input clk, rst, c_stall_f, c_jump_f, c_branchComp_d,
  input [31:0]  pcJump_f, pcBranch_d,
  output  reg [31:0]  pc4_f, pc_f
  );
  
  initial
  begin
    pc_f <= 32'h00000000;
    pc4_f <= 32'h00000004;
  end
  
  always @(posedge clk)
  begin
    if (rst)
    begin
      pc_f = 32'h00000000;
      pc4_f = pc_f + 4;
    end
    else if (!c_stall_f)
    begin
      pc_f = pc_f;
      pc4_f = pc_f + 4;
    end
    else if (c_branchComp_d)
    begin
      pc_f = pcBranch_d;
      pc4_f = pc_f + 4;
    end
    else if (c_jump_f)
    begin
      pc_f = pcJump_f;
      pc4_f = pc_f + 4;
    end
    else
    begin
      pc_f = pc_f + 4;
      pc4_f = pc_f + 4;
    end
  end
  
endmodule
