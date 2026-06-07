//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Sat May 16 14:58:53 2026
//Host        : Denanath running 64-bit major release  (build 9200)
//Command     : generate_target AND_ip_wrapper.bd
//Design      : AND_ip_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AND_ip_wrapper
   (clk,
    y);
  input clk;
  output y;

  wire clk;
  wire y;

  AND_ip AND_ip_i
       (.clk(clk),
        .y(y));
endmodule
