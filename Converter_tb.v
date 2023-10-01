`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2023 11:13:04
// Design Name: 
// Module Name: Converter_tb
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


module Converter_tb();
reg [31:0] input_num;
wire[31:0] float_out;
Converter DUT(.number(input_num),.float(float_out));
initial begin
    input_num = ~(2**28)+1;
    #10
    input_num = ~(2**30+57)+1;
    #10
    input_num = ~(2**10+54)+1;
    #10
    input_num = 0;
    #10
    input_num = 2**28;
    #10
    input_num = 2**30+57;
    #10
    input_num = 2**10+54;
    #10
    $finish;
end
endmodule
