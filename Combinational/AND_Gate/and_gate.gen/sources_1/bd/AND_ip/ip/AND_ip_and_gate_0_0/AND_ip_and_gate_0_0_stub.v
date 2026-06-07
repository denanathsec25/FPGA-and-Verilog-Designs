// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sat May 16 14:59:23 2026
// Host        : Denanath running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/VLSI/Verilog/and_gate/and_gate.gen/sources_1/bd/AND_ip/ip/AND_ip_and_gate_0_0/AND_ip_and_gate_0_0_stub.v
// Design      : AND_ip_and_gate_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "AND_ip_and_gate_0_0,and_gate,{}" *) (* CORE_GENERATION_INFO = "AND_ip_and_gate_0_0,and_gate,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=and_gate,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "and_gate,Vivado 2025.2" *) 
module AND_ip_and_gate_0_0(a, b, y)
/* synthesis syn_black_box black_box_pad_pin="a,b,y" */;
  input a;
  input b;
  output y;
endmodule
