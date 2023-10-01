`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2023 22:54:45
// Design Name: 
// Module Name: Converter
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


module Converter(input[31:0] number,
                output[31:0] float);
                reg sign;
                reg[7:0] exponent=0;
                reg[22:0] mantissa=23'b0;
                reg[30:0] temp;
                integer i,j;
                always@(*) begin
                    sign = number[31];
                    temp = number[30:0]^{31{sign}};
                    temp = temp+sign;
                    for(i=0;i<32;i=i+1) begin
                        if(temp[i]) begin
                            exponent = i;
                        end
                    end
                    if(number!=0) 
                    for(j=0;j<exponent && j<23;j=j+1) begin
                        mantissa[22-j] = temp[exponent-j-1];
                    end
                    exponent = 127+exponent;
                    if(number==0) begin
                        sign=0;
                        exponent=0;
                        mantissa=0;
                    end
                    $display("%d is represented as sign=%d, expo=%d, mantis=%d",number,sign,exponent-127,mantissa);
                end
                assign float={sign,exponent,mantissa};
endmodule
