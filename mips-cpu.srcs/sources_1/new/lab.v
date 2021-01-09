`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/29 10:21:28
// Design Name: 
// Module Name: lab
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


module lab(
    input [15:0] x,
    input clk,
    input rst,
    output reg [6:0] a_to_g,
    output reg [3:0] an
    );
    
    wire [1:0] s;
    reg [3:0] digit;
    reg [19:0] clkdiv;
    
    assign s = clkdiv[19:18];
    always @(*)
        case (s)
         0: digit = x[3:0];
         1: digit = x[7:4];
         2: digit = x[11:8];
         3: digit = x[15:12];
         default: digit = x[3:0];
        endcase
        
    always @(*)
    case(digit)
     0: a_to_g = 7'b1111110;
     1: a_to_g = 7'b0110000;
     2: a_to_g = 7'b1101101;
     3: a_to_g = 7'b1111001;
     4: a_to_g = 7'b0110011;
     5: a_to_g = 7'b1011011;
     6: a_to_g = 7'b1011111;
     7: a_to_g = 7'b1110000;
     8: a_to_g = 7'b1111111;
     9: a_to_g = 7'b1111011;
     'hA: a_to_g = 7'b1110111;
     'hB: a_to_g = 7'b0011111;
     'hC: a_to_g = 7'b1001110;
     'hD: a_to_g = 7'b0111101;
     'hE: a_to_g = 7'b1001111;
     'hF: a_to_g = 7'b1000111;
     default: a_to_g = 7'b1111110;
     endcase
     
     
     always @(*)
     begin
        an = 4'b0000;
        an[s] = 1;
        end
     always @(posedge clk or posedge rst)
     begin
       if(rst == 1)
         clkdiv <=0;
       else 
         clkdiv <= clkdiv+1;
     end
endmodule
