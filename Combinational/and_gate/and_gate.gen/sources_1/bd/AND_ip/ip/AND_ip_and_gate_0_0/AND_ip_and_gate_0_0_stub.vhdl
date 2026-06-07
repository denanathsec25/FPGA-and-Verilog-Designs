-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sat May 16 14:59:23 2026
-- Host        : Denanath running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/VLSI/Verilog/and_gate/and_gate.gen/sources_1/bd/AND_ip/ip/AND_ip_and_gate_0_0/AND_ip_and_gate_0_0_stub.vhdl
-- Design      : AND_ip_and_gate_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_ip_and_gate_0_0 is
  Port ( 
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    y : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of AND_ip_and_gate_0_0 : entity is "AND_ip_and_gate_0_0,and_gate,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of AND_ip_and_gate_0_0 : entity is "AND_ip_and_gate_0_0,and_gate,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=and_gate,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of AND_ip_and_gate_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of AND_ip_and_gate_0_0 : entity is "module_ref";
end AND_ip_and_gate_0_0;

architecture stub of AND_ip_and_gate_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "a,b,y";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "and_gate,Vivado 2025.2";
begin
end;
