#set_property PACKAGE_PIN B25 [get_ports uart_rx]
#set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]
#set_property PACKAGE_PIN B26 [get_ports uart_tx]
#set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]
#In default, the RP2040 is emurated as an USB-to-UART bridge. 
#The UART serial communication parameters are: 9600-8-N-1. GPIO28 is used as UART0 TX. GPIO29 is used as UART0 RX.

set_property IOSTANDARD LVCMOS33 [get_ports {led_1}]
set_property PACKAGE_PIN J26 [get_ports {led_1}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_2}]
set_property PACKAGE_PIN H26 [get_ports {led_2}]

set_property PACKAGE_PIN B12 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]
set_property PACKAGE_PIN B11 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]

set_property PACKAGE_PIN B20 [get_ports sw2]
set_property IOSTANDARD LVCMOS33 [get_ports sw2]

set_property PACKAGE_PIN F22 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN AF9 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
connect_debug_port dbg_hub/clk [get_nets <sys_clk>]

## SW2 on daughterboard
#set_property LOC B20 [get_ports sw]
#set_property IOSTANDARD LVCMOS33 [get_ports {sw}]

## daughterboard J1:5
#set_property LOC B12 [get_ports rx]
#set_property IOSTANDARD LVCMOS33 [get_ports {rx}]

## daughterboard J1:6
#set_property LOC B11 [get_ports tx]
#set_property IOSTANDARD LVCMOS33 [get_ports {tx}]

