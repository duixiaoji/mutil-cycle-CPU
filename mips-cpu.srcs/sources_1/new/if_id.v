`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 15:54:13
// Design Name: 
// Module Name: if_id
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


module if_id(
    input clk, rst, c_stall_d,c_empty_d,
    input [31:0]  ins_f, pc4_f,
    output reg [31:0]  ins_d, pc4_d
    );
  
    initial
    begin
      ins_d <= 0;
      pc4_d <= 0;
    end
  
    always @(posedge clk)
      if (rst)
      begin
        ins_d <= 0;
        pc4_d <= 0;
      end
      else if (c_empty_d)
      begin
        ins_d <= 0;
        pc4_d <= 0;
      end
      else if (c_stall_d)
      begin
        ins_d <= ins_f;
        pc4_d <= pc4_f;
      end
      else
      begin
        ins_d <= ins_d;
        pc4_d <= pc4_d;
      end
    
endmodule
