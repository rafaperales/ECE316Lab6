`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2025 03:13:30 AM
// Design Name: 
// Module Name: Inc_Dec
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


module Inc_Dec(  
input clk, 
input reset,
input enable, 
input load_preset,  
input addsub, 
input [1:0] mode, 
input [7:0] sw,  
output reg [15:0] data
    );
    wire ms; 
    reg [3:0] local0;
    reg [3:0] local1;
    reg [3:0] local2;
    reg [3:0] local3; 
   
    MSclk c1(.clk(clk),.reset(reset),.slow_clk(ms)); 
    always @(posedge ms) 
    begin
        if(load_preset || reset) 
            begin 
            case(mode) 
                2'b00: 
                begin 
                data <= 4'h0000;  
                local0 <= data[3:0];
                local1 <= data[7:4];
                local2 <= data[11:8];
                local3 <= data[15:12];
                end
                2'b01:
                    begin 
                    if(sw[3:0] < 10)
                        data[11:8] <= sw[3:0];  
                      else  
                        data[11:8] <= 0;
                    if(sw[7:4] < 10)
                             data[15:12] <= sw[7:4];  
                      else 
                            data[15:12] <= 0;
                      data[7:0] <= 0; 
                      local0 <= data[3:0];
                      local1 <= data[7:4];
                      local2 <= data[11:8];
                      local3 <= data[15:12];
                    end
                2'b10:
                begin 
                        data <= 16'b1001100110011001;   
                        local0 <= data[3:0];
                        local1 <= data[7:4];
                        local2 <= data[11:8];
                        local3 <= data[15:12];
                 end
                2'b11: 
                  begin 
                       if(sw[3:0] < 10)
                            data[11:8] <= sw[3:0];  
                      else  
                            data[11:8] <= 0;
                    if(sw[7:4] < 10)
                            data[15:12] <= sw[7:4];  
                      else 
                            data[15:12] <= 0; 
                        data[7:0] <= 0; 
                        local0 <= data[3:0];
                        local1 <= data[7:4];
                        local2 <= data[11:8];
                        local3 <= data[15:12];
                    end
            endcase
            end  
           else if (enable) 
               begin  
                  
                  case(addsub) 
                  
                  1'b0:  
                  begin  
                         if ( local0 > 0) 
                       begin 
                           local0 <= local0 -1; 
                       end
                       else if ( local0 == 0 & local1 > 0) 
                       begin  
                            local0 <= 9;
                            local1 <= local1 -1; 
                       end 
                      
                       else if ( local1 == 0 & local2 > 0) 
                       begin 
                             local1 <= 9;
                            local2 <= local2 - 1; 
                       end 
                       else if ( local2 == 0 & local3 > 0) 
                       begin 
                            local2 <= 9;
                            local3 <= local3 - 1; 
                       end
                  end 
                  1'b1:
                  begin 
                         if ( local0 < 9) 
                       begin 
                           local0 <= local0 +1; 
                       end
                       if ( local0 == 9 & local1 < 9) 
                       begin  
                            local0 <= 0;
                            local1 <= local1 +1; 
                       end 
                      
                       if ( local1 == 9 & local2 < 9) 
                       begin 
                             local1 <= 0;
                            local2 <= local2 +1; 
                       end 
                       if ( local2 == 9 & local3 < 9) 
                       begin 
                            local2 <= 0;
                            local3 <= local3 +1; 
                       end 
                     end
                  endcase
                  
                  
                    
                    data[3:0] <= local0;
                    data[7:4] <= local1;
                    data[11:8] <= local2;
                    data[15:12] <= local3;      
          end
                      
         end   
      
endmodule

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

