`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:56:28 PM
// Design Name: 
// Module Name: ms_clk
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



module MSclk (
 input clk, 
 input reset,  
 output slow_clk 
 );  
  //testing
   reg [19:0] COUNT; 
   //  reg [26:0] COUNT; 
  initial begin
    COUNT = 0;
    end
    //testing
   assign slow_clk = COUNT[19] ;  
  // assign slow_clk = COUNT[26]; 
    always @ (posedge clk) 
    begin 
    if(reset) 
      COUNT = 0; 
    else  
     COUNT = COUNT + 1; 
    end
 endmodule

