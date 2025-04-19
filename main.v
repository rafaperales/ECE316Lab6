`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:44:18 PM
// Design Name: 
// Module Name: main
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


module main( 
input clk,
input [1:0] mode, 
input [7:0] sw, 
input reset, 
input start_stop, 
output [3:0] an, 
output [6:0] sseg, 
output dp
    );    
     // fsm
    wire enable ; 
    wire addsub;
    wire load_preset;
    fsm f0 (.clk(clk), .mode(mode),. reset(reset), .start_stop(start_stop), .addsub(addsub),.enable(enable),.load_preset(load_preset));
    
    
    // inc/dec    
     wire [15:0] data;
     
     Inc_Dec Q0 (.clk(clk), .reset(reset),.enable(enable),.load_preset(load_preset), .addsub(addsub),.mode(mode), .sw(sw),.data(data));
     FourDigitDisplay Q1 ( .clk(clk), .reset(reset), .sw(data), .an(an), .sseg(sseg),.dp(dp));
    //display
endmodule




