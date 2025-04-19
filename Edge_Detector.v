`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2025 02:12:02 AM
// Design Name: 
// Module Name: Edge_Detector
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

module Edge_Detector(
    input clk,
    input signal,
    output reg outedge
);
    reg signal_d;
    always @(posedge clk) begin
        signal_d <= signal;
        outedge <= signal & ~signal_d;
    end
endmodule
//module Edge_Detector(
//    input clk,
//    input signal,
//    input reset,
//    output reg outedge
//    );
    
//    wire slow_clk;
    
//    reg [1:0] state;
//    reg [1:0] next_state;
    
//    clkdiv cl(clk, reset, slow_clk);

//    //Combinational Logic:
    
//    always @(*)begin
        
//        case (state)
        
//            2'b00 : begin
//                outedge = 1'b0;
//                if (~signal)
//                    next_state = 2'b00;
//                else
//                    next_state = 2'b01;
//                end
                
//            2'b01 : begin
//                outedge = 1'b1;
//                if (~signal)
//                    next_state = 2'b00;
//                else 
//                         next_state = 2'b10;
//            end
            
//            2'b10 : begin 
//                outedge = 1'b0;
//                if(~signal)
//                    next_state = 2'b00;
//                else
//                    next_state = 2'b10;
//                end
            
//            default : begin
//                next_state = 2'b00;
//                outedge = 1'b0;
//                end
                
//       endcase
       
       
       
//   end
   
//   //Sequential Logic
   
//   always @(posedge slow_clk) begin
//    if (reset)
//        state <= 2'b00;
//    else
//         state <= next_state;
   
//   end 


//endmodule

//module clkdiv(

//    input clk,
//    input reset,
//    output clk_out

//    );
    
//    reg [2:0] COUNT;
    
//    initial begin
//    COUNT = 0;
//    end
    
//        assign clk_out = COUNT[2];
        
//        always @(posedge clk)
//        begin
//        if (reset)
//            COUNT = 0;
//         else 
//            COUNT = COUNT + 1;
//         end
         
//endmodule
