set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports clk]
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports {led[7]}]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports led_hlt]
## ---------- 100 MHz clock (Boolean Board) ----------
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]

## ---------- 1 Hz CPU clock from clk_div ----------
create_generated_clock -name cpu_clk -source [get_ports clk] -divide_by 100000000 [get_pins DIV/clk_out_reg/Q]
set_clock_groups -asynchronous -group [get_clocks clk] -group [get_clocks cpu_clk]

## ---------- CPU output -> LD0..LD7 ----------

## ---------- Halt indicator -> LD8 ----------

set_property PACKAGE_PIN E6 [get_ports led_in]
set_property IOSTANDARD LVCMOS33 [get_ports led_in]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
