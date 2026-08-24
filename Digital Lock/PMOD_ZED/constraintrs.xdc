## IOSTANDARD
set_property IOSTANDARD LVCMOS33 [get_ports {clk rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_bin[*]}]

## INTERNAL PULL-UPS (MANDATORY)
set_property PULLUP true [get_ports {col[0]}]
set_property PULLUP true [get_ports {col[1]}]
set_property PULLUP true [get_ports {col[2]}]
set_property PULLUP true [get_ports {col[3]}]

## PACKAGE PINS
set_property PACKAGE_PIN Y9  [get_ports clk]
set_property PACKAGE_PIN N15 [get_ports rst]

set_property PACKAGE_PIN V8  [get_ports {row[0]}]
set_property PACKAGE_PIN V9  [get_ports {row[1]}]
set_property PACKAGE_PIN W10 [get_ports {row[2]}]
set_property PACKAGE_PIN V12 [get_ports {row[3]}]

set_property PACKAGE_PIN W8  [get_ports {col[0]}]
set_property PACKAGE_PIN V10 [get_ports {col[1]}]
set_property PACKAGE_PIN W11 [get_ports {col[2]}]
set_property PACKAGE_PIN W12 [get_ports {col[3]}]

set_property PACKAGE_PIN T22 [get_ports {key_bin[0]}]
set_property PACKAGE_PIN T21 [get_ports {key_bin[1]}]
set_property PACKAGE_PIN U22 [get_ports {key_bin[2]}]
set_property PACKAGE_PIN U21 [get_ports {key_bin[3]}]