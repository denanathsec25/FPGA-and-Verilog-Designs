# FPGA and Verilog Designs

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Vivado](https://img.shields.io/badge/Tool-Xilinx%20Vivado-green)
![FPGA](https://img.shields.io/badge/Domain-FPGA-orange)
![VLSI](https://img.shields.io/badge/Domain-VLSI-red)
![License](https://img.shields.io/badge/License-Educational-yellow)

A collection of Verilog HDL implementations of fundamental digital circuits developed for Digital Electronics, VLSI, and FPGA design practice. This repository contains both combinational and sequential circuit designs along with simulation and verification files created using Xilinx Vivado.

## Repository Highlights

- 20+ Digital Design Implementations
- Combinational and Sequential Circuits
- Behavioral, Dataflow, Structural, and Gate-Level Modeling
- FPGA Mini Projects
- Simulation Testbenches
- Vivado Synthesis and Verification
- LUT Utilization Analysis for 64:1 Multiplexer
- Xilinx Vivado Project Files

## Repository Structure

```text
FPGA-and-Verilog-Designs
│
├── Combinational
│   ├── AND Gate
│   ├── Adder and Subtractor
│   ├── BCD Adder
│   ├── Carry Look-Ahead Adder
|   ├── Decoder
│   ├── Encoder
│   ├── Even Parity Generator
│   ├── Full Adder
│   │   ├── Dataflow
│   │   ├── Behavioral
│   │   └── Gate Level
│   ├── Incrementer
│   ├── Multiplier
│   ├── Ripple Carry Adder
│   ├── Multiplexer
│   │   ├── Dataflow
│   │   ├── Behavioral
│   │   └── Gate Level
│   └── 64:1 Multiplexer
│       ├── Dataflow
│       ├── Behavioral
│       └── Structural
│
├── Line Follower
│
├── Sequential
│   ├── D Flip-Flop Behavioural
│   ├── JK Flip-Flop
│   │   ├── Behavioral
│   │   └── Structural
│   ├── T Flip-Flop
│   │   ├── Behavioral
│   │   └── Structural
│   ├── Master-Slave Flip-Flop
│   ├── Registers
|   |   ├──PISO
|   |   └──SISO Structural
│   └── Counters
│         ├──3 Bit Up Counter
│         └──3 Bit Down Counter
├── README.md
├── LICENSE
└── .gitignore
```

## Topics Covered

### Combinational Circuits

* AND Gate
* Encoder
* Even Parity Generator
* Incrementer
* Multiplier
* Full Adder
  * Dataflow Modeling
  * Behavioral Modeling
  * Gate-Level Modeling
* Adder and Subtractor
* Ripple Carry Adder
* BCD Adder
* Carry Look-Ahead Adder
* Multiplexer
  * Dataflow Modeling
  * Behavioral Modeling
  * Gate-Level Modeling
* 64:1 Multiplexer
  * Dataflow Modeling
  * Behavioral Modeling
  * Structural Modeling

### Sequential Circuits

* D Flip-Flop
* JK Flip-Flop
  * Behavioral Modeling
  * Structural Modeling
* T Flip-Flop
  * Behavioral Modeling
  * Structural Modeling
* Master-Slave Flip-Flop
* Shift Registers
* Counters
   * 3 Bit Up Counter
   * 3 Bit Down Counter

## Modeling Techniques Used

* Behavioral Modeling
* Dataflow Modeling
* Structural Modeling
* Gate-Level Modeling

## Tools Used

* Verilog HDL
* Xilinx Vivado Design Suite
* XSim Simulator
* FPGA Development Boards

## FPGA Resource Analysis

### 64:1 Multiplexer Resource Utilization Comparison

| Modeling Style | Slice LUTs | F7 Muxes | F8 Muxes | Bonded IOB |
|---------------|------------|----------|----------|------------|
| Behavioral | 17 | 8 | 4 | 70 |
| Dataflow | 17 | 8 | 4 | 71 |
| Structural | 17 | 8 | 4 | 71 |

The synthesis results show that all three modeling styles were optimized into equivalent FPGA hardware by Vivado, resulting in identical resource utilization.

## Features

* Verilog source code
* Testbench implementation
* Simulation and verification
* Behavioral, Structural, and Dataflow modeling
* FPGA implementation projects

## Learning Objectives

This repository is intended for:

* Digital Electronics laboratory work
* FPGA design practice
* Verilog HDL learning
* VLSI design fundamentals
* Academic projects and experiments

## Skills Gained

- Verilog HDL
- RTL Design
- Combinational Logic Design
- Sequential Logic Design
- FPGA Design Flow
- Simulation and Verification
- Testbench Development
- Resource Utilization Analysis
- Digital System Design

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/denanathsec25/FPGA-and-Verilog-Designs.git
```

2. Open the required project in Vivado.
3. Run behavioral simulation.
4. Verify outputs using the provided testbench.
5. Generate bitstream and implement on FPGA hardware if required.

## Future Additions

- Finite State Machines (FSM)
- UART Protocol
- SPI Protocol
- I2C Protocol
- PWM Generator
- Traffic Light Controller
- ALU Design
- Memory Design
- RISC-V Processor Modules

## License

This repository is open for educational purposes. Anyone is welcome to use, study, and modify the code for learning, academic, and non-commercial educational activities.

© Denanath Shanmugasundaram

## Author

**Denanath S**

Electronics and Communication Engineering (ECE)

Bannari Amman Institute of Technology

📧 Email: [denanathshanmugasundaram@gmail.com](mailto:denanathshanmugasundaram@gmail.com)

🔗 GitHub: https://github.com/denanathsec25

## Support

If you find this repository useful for learning Verilog, FPGA Design, or Digital Electronics:

⭐ Star the repository

🍴 Fork it for your own experiments

📢 Share it with fellow students and FPGA enthusiasts

Contributions, suggestions, and feedback are always welcome.
