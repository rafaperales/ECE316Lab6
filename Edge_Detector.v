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

module RisingEdgeDetector (
  input   clk,
  input   signal,
  output  reg Outedge
); 
    wire debounced;
  Debouncer (.clk(clk),.signal(signal),.debounced(debounced));
  reg signalPrev;

  always @(posedge clk) begin
    signalPrev <= debounced;
    Outedge <= (debounced && !signalPrev);
  end

endmodule 


module Debouncer(
    input clk,
    input signal,
    output reg debounced
);
    wire slow_clk;
    reg [1:0] state;

    clkdiv cl(.clk(clk), .clk_out(slow_clk));

    always @(posedge slow_clk) begin
        case (state)
            2'b00: begin
                if (signal)
                    state <= 2'b01;
            end
            2'b01: begin
                if (signal)
                    state <= 2'b10;
                else
                    state <= 2'b00;
            end
            2'b10: begin
                if (!signal)
                    state <= 2'b00;
            end
        endcase

        debounced <= (state != 2'b00);
    end
endmodule

module clkdiv(

    input clk,
    output clk_out

    );
    
    reg [15:0] COUNT;
    
    initial begin
    COUNT = 0;
    end
    
        assign clk_out = COUNT[15];
        
        always @(posedge clk)
        begin
            COUNT = COUNT + 1;
         end
         
endmodule
