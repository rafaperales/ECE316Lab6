## This file is the constraints file. It maps the input/output variables in your design modules to the actual hardware.
## Each pin corresponds to a device on the board. For example, pin V17 corresponds to SW0, the rightmost switch.
## We use CMOS (LVCMOS33) logic on the board, meaning a "0" is 0V, and a "1" is 3.3V.
## You don't need to understand every line of this file, but be able to describe what each of the 6 uncommented lines does.

## This file is a general .xdc for the Basys3 rev C board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal -Uncomment if needed (will be used in future labs)
set_property PACKAGE_PIN W5 [get_ports {clk}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
  
## Switches
## Connects pin V17 (SW0 on the board) to input a in our gate module
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]	
## Sets the switch to use 3.3V logic				
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]    

## Connects pin V16 (SW1 on the board) to input b in our gate module
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]			
## Sets the switch to use 3.3V logic
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]    
	
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
#set_property PACKAGE_PIN V2 [get_ports {Cin}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {Cin}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property PACKAGE_PIN T1 [get_ports {mode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {mode[0]}]
set_property PACKAGE_PIN R2 [get_ports {mode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {mode[1]}]
 

## LEDs
## Connects the output c in our gate module to pin U16 (LED0 on-board)		
#set_property PACKAGE_PIN U16 [get_ports {Q[0]}]	
## Sets the LED to use 3.3V logic		
#	set_property IOSTANDARD LVCMOS33 [get_ports {Q[0]}]    
	
#set_property PACKAGE_PIN E19 [get_ports {Q[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {Q[1]}]
#set_property PACKAGE_PIN U19 [get_ports {Q[2]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {Q[2]}]
#set_property PACKAGE_PIN V19 [get_ports {Q[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {Q[3]}]
#set_property PACKAGE_PIN W18 [get_ports {Q[4]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {Q[4]}]
#set_property PACKAGE_PIN U15 [get_ports {led[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
#set_property PACKAGE_PIN U14 [get_ports {led[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
#set_property PACKAGE_PIN V14 [get_ports {led[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
#set_property PACKAGE_PIN V13 [get_ports {d7}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {d7}]
#set_property PACKAGE_PIN V3 [get_ports {d6}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {d6}]
#set_property PACKAGE_PIN W3 [get_ports {d5}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {d5}]
#set_property PACKAGE_PIN U3 [get_ports {d4}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {d4}]
#set_property PACKAGE_PIN P3 [get_ports {d3}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {d3}]
#set_property PACKAGE_PIN N3 [get_ports {d2}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {d2}]
#set_property PACKAGE_PIN P1 [get_ports {d1}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {d1}]
#set_property PACKAGE_PIN L1 [get_ports {d0}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {d0}]
	
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {sseg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[6]}]
set_property PACKAGE_PIN W6 [get_ports {sseg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[5]}]
set_property PACKAGE_PIN U8 [get_ports {sseg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[4]}]
set_property PACKAGE_PIN V8 [get_ports {sseg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[3]}]
set_property PACKAGE_PIN U5 [get_ports {sseg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[2]}]
set_property PACKAGE_PIN V5 [get_ports {sseg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[1]}]
set_property PACKAGE_PIN U7 [get_ports {sseg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[0]}]

set_property PACKAGE_PIN V7 [get_ports {dp}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {dp}]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports {reset}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
set_property PACKAGE_PIN T18 [get_ports {start_stop}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {start_stop}]
#set_property PACKAGE_PIN W19 [get_ports btnL]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnL]
#set_property PACKAGE_PIN T17 [get_ports btnR]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnR]
#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
 


