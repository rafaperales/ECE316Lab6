`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2025 04:30:01 AM
// Design Name: 
// Module Name: FourDigitDisplay
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


module FourDigitDisplay( 
input clk, 
input reset, 
input [15:0] sw, 
output [3:0] an, 
output [6:0] sseg, 
output dp);

wire [6:0] in0, in1, in2,in3; 
wire slow_clk; 


//module instantiatino of hexto7seg decoder 

hexto7segment c1 (.x(sw[3:0]), .r(in0)); 
hexto7segment c2 (.x(sw[7:4]), .r(in1));
hexto7segment c3 (.x(sw[11:8]), .r(in2));
hexto7segment c4 (.x(sw[15:12]), .r(in3)); 

clk_div_disp c5 (.clk(clk), .reset(reset),.slow_clk(slow_clk)); 

time_mux_state_machine c6 (
    .clk(slow_clk), 
    .reset(reset), 
    .in0 (in0), 
    .in1 (in1), 
    .in2 (in2), 
    .in3 (in3), 
    .an (an), 
    .sseg (sseg),
    .dp(dp)
);

    
endmodule 


module hexto7segment( 
    input [3:0] x,
    output reg [6:0] r
    );  
    always @(*) 
    case (x) 
        4'b0000 : r = 7'b0000001; //0
        4'b0001 : r = 7'b1001111; //1
        4'b0010 : r = 7'b0010010; //2
        4'b0011 : r = 7'b0000110; //3 
        4'b0100 : r = 7'b1001100; //4 
        4'b0101 : r = 7'b0100100; //5 
        4'b0110 : r = 7'b0100000; //6 
        4'b0111 : r = 7'b0001111; //7
        4'b1000 : r = 7'b0000000; //8
        4'b1001 : r = 7'b0000100; // 9 
        4'b1010 : r = 7'b0000001; //0
        4'b1011 : r = 7'b0000001; //0
        4'b1100 : r = 7'b0000001; //0
        4'b1101 : r = 7'b0000001; //0 
        4'b1110 : r = 7'b0000001; //0 
        4'b1111 : r = 7'b0000001; //0
        endcase
 endmodule 
 

 module clk_div_disp (
 input clk, 
 input reset, 
 output slow_clk 
 );   
 //testing
    reg [15:0] COUNT; 
   //   reg [26:0] COUNT; 
 
    //testing
   assign slow_clk = COUNT[15];  
   // assign slow_clk = COUNT[26]; 
    always @ (posedge clk) 
    begin 
    if(reset) 
      COUNT = 0; 
    else  
     COUNT = COUNT + 1; 
    end
 endmodule 

module time_mux_state_machine ( 
 input clk, 
 input reset, 
 input [6:0] in0, 
 input [6:0] in1,
 input [6:0] in2,
 input [6:0] in3, 
 output reg [3:0] an, 
 output reg [6:0] sseg,
 output reg dp
 ); 
 reg [1:0] state; 
 reg [1:0] next_state;   
 
 always @ (*) begin 
    //FOUR STATES TOTAL,  one for each segment
    case(state)  
        2'b00 : next_state = 2'b01;  
        2'b01 : next_state = 2'b10; 
        2'b10 : next_state = 2'b11; 
        2'b11 : next_state = 2'b00;  
       
    endcase
end
 
 always @ (*) begin 
    //Chooses which switches two use based on state
    case(state)  
    2'b00 : sseg = in0;  
    2'b01 : sseg = in1; 
    2'b10 : sseg = in2; 
    2'b11 : sseg = in3; 
    endcase
end   


 always @ (*) begin 
    // turns off segments based on state
    case(state)  
    2'b00 :
       begin
            an = 4'b1110;   
            dp = 1;
        end

    2'b01 :
       begin
            an = 4'b1101;  
            dp = 1;
        end
    2'b10 :
    begin
            an = 4'b1011;  
            dp = 0;
    end
    2'b11 : 
    begin
            an = 4'b0111;  
            dp = 1;
    end
    endcase
end  

always @(posedge clk or posedge reset) begin
    if(reset)
        state <= 2'b00; 
     else 
        state <= next_state; 
    
 end

endmodule 
