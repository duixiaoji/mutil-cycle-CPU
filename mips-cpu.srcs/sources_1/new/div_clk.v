`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 22:57:32
// Design Name: 
// Module Name: div_clk
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


module div_clk (
    input clk,
    output reg clkout
    );
    
    reg [27:0] count;
    
    initial
    begin
        clkout<=0;
        count<=0;
    end
    
    always@(posedge clk)
    begin
        if(count==28'd1)
        begin
            count<=0;
            clkout<=~clkout;
        end
        else count<=count+1;
    end
        
 
                     
endmodule     
