`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/22 17:02:03
// Design Name: 
// Module Name: sim
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


module sim;
  reg clk, rst;
  
  cpu cpu(clk, rst);
  
  initial
  begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    forever #10 clk = !clk;
  end
  
  
endmodule
