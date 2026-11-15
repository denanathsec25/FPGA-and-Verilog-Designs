set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports clk]
set_property -dict {PACKAGE_PIN A2 IOSTANDARD LVCMOS33} [get_ports led_in]
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports led_hlt]
set_property -dict {PACKAGE_PIN H3 IOSTANDARD LVCMOS33} [get_ports {AN[0]}]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports {AN[1]}]
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports {AN[2]}]
set_property -dict {PACKAGE_PIN E4 IOSTANDARD LVCMOS33} [get_ports {AN[3]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports {AN[4]}]
set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33} [get_ports {AN[5]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {AN[6]}]
set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS33} [get_ports {AN[7]}]
set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS33} [get_ports {seg[0]}]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {seg[1]}]
set_property -dict {PACKAGE_PIN D2 IOSTANDARD LVCMOS33} [get_ports {seg[2]}]
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports {seg[3]}]
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33} [get_ports {seg[4]}]
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {seg[5]}]
set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS33} [get_ports {seg[6]}]
set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS33} [get_ports {seg[7]}]
## =====================================================================
## Boolean Board - 8-bit CPU with decimal output on 7-segment display
## Top module: board_top
## =====================================================================

## ---------- 100 MHz clock ----------
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]

## ---------- 1 Hz CPU clock from clk_div ----------

## ---------- CPU output -> LD0..LD7 ----------

## ---------- Status LEDs ----------

## ---------- 7-segment anodes (active low) ----------
## AN[0..3] share the seg bus below; AN[0] = ones, AN[1] = tens, AN[2] = hundreds
## AN[4..7] = other display, kept OFF by the design

## ---------- 7-segment segments (active low) ----------
## seg[0]=a ... seg[6]=g, seg[7]=dp

## ---------- Configuration ----------
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]

set_property PACKAGE_PIN U1 [get_ports {sw[2]}]
set_property PACKAGE_PIN U2 [get_ports {sw[1]}]
set_property PACKAGE_PIN V2 [get_ports {sw[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports flag_carry]
set_property IOSTANDARD LVCMOS33 [get_ports flag_zero]
set_property PACKAGE_PIN E6 [get_ports flag_carry]
set_property PACKAGE_PIN C3 [get_ports flag_zero]


set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN G1 [get_ports {led[0]}]
set_property PACKAGE_PIN G2 [get_ports {led[1]}]
set_property PACKAGE_PIN F1 [get_ports {led[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports start]
set_property PACKAGE_PIN H2 [get_ports start]

set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN J1 [get_ports rst]

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
