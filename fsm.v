`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:57:58 PM
// Design Name: 
// Module Name: fsm
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


module fsm( 
input clk, 
input [1:0] mode, 
input reset, 
input start_stop,  
output reg addsub,  // 0 sub , 1 add 
output reg enable, 
output reg load_preset
    ); 
    
    //start  
     reg [1:0] state;   
     wire EdgeStartStop ;
     wire EdgeReset ;
     RisingEdgeDetector r0 (.clk(clk), .signal(start_stop),.Outedge(EdgeStartStop)); 
     RisingEdgeDetector r1 (.clk(clk), .signal(reset),.Outedge(EdgeReset)); 

     
      
  

 //states wait , load, run , paused  
 initial begin 
 state = 2'b00; 
 end


 always @(posedge clk) begin 
  if(EdgeReset) 
       begin
            enable = 0; // if reset or beginning stop clock  
            load_preset <= 1;  
            state <= 2'b00;
            if (mode == 2'b10 | mode == 2'b11) 
                addsub <= 0; 
            else 
                addsub <= 1; 
         end   
    else begin 
        case(state)  
        // wait for str/stop button 
        2'b00: 
            begin 
                if( EdgeStartStop) 
                    begin//go to next state/start and turn on load
                         state <= 2'b01; 
                         load_preset <= 1; 
                     end   
                 else 
                    begin
                        enable <= 0; // dont count up 
                        load_preset <= 1; 
                    end
            end
        
        // display before running
        2'b01:
            begin
                if (mode[1] == 1)  
                        addsub <= 0; 
                    else 
                        addsub <=1; 
                state <= 2'b10; 
                load_preset <= 0; 
                enable <= 1;
            end 
        // inc/dec state
        2'b10:
        begin
            if(EdgeStartStop)
                begin 
                    state <= 2'b11; 
                    enable <= 0;
                end    
             else 
             enable <= 1;         
          end          
        //pause
        2'b11:  
        begin 
        if(EdgeStartStop) 
            begin 
                enable <= 1 ; 
                state <= 2'b10;
            end 
         else
             state <= 2'b11;
            
        end 
        
      endcase
    end 

end
endmodule

module RisingEdgeDetector (
  input   clk,
  input   signal,
  output  reg Outedge
);

  reg signalPrev;

  always @(posedge clk) begin
    signalPrev <= signal;
    Outedge <= (signal && !signalPrev);
  end

endmodule

