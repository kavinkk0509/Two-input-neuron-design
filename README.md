# Two-Input Neuron Design and Verification

A two-input neuron project combining digital RTL design using SystemVerilog, functional verification, Yosys synthesis, and analog CMOS ReLU simulation using LTspice.

## Project Overview

This project explores two implementations of a simple neuron:

- **Digital implementation:** Computes the weighted sum of two signed inputs.
- **Analog implementation:** Uses a CMOS ReLU circuit simulated in LTspice.

### Digital Neuron

\[
y = x_1 + x_2
\]

### Analog ReLU Neuron

\[
y = \mathrm{ReLU}(x_1+x_2) = \max(0,x_1+x_2)
\]

> Note: The SystemVerilog implementation performs addition only. The ReLU function is implemented separately in the LTspice circuit.

## Tools and Technologies

- SystemVerilog
- EDA Playground and EPWave
- Yosys
- LTspice
- GitHub

## Repository Structure

```text
Two-input-neuron-design/
├── README.md
├── rtl/
│   └── neuron_sum.sv
├── testbench/
│   └── tb_neuron_sum.sv
├── ltspice/
│   ├── neuron_relu.asc
│   └── simulation_results/
│       ├── dc_sweep.png
│       ├── transient_waveform.png
│       └── circuit_schematic.png
│       
└── synthesis/
    ├── neuron_sum_synth.v
    ├── yosys_report.txt
    └── Synthesized schematic/
```


## 1. Digital RTL Design

The digital neuron is implemented in SystemVerilog with:

- Two signed 8-bit inputs.
- One signed 9-bit output.
- Sign extension for correct signed arithmetic.
- Combinational addition logic.

### Functional Verification

The design was simulated using EDA Playground and EPWave.

| Input \(x_1\) | Input \(x_2\) | Expected output | Status |
|---:|---:|---:|:---|
| 10 | 5 | 15 | PASS |
| -20 | 5 | -15 | PASS |
| 127 | 127 | 254 | PASS |

**Simulation:** [Open on EDA Playground](https://edaplayground.com/x/eLkb)

### Digital Simulation Waveform

<img width="1445" height="771" alt="image" src="https://github.com/user-attachments/assets/3361342d-1896-40ab-a5d5-4e28f10f6af1" />


## 2. Yosys Synthesis

The SystemVerilog RTL was synthesized using Yosys. The synthesis report and generated Verilog netlist are available in the `synthesis/` directory.

### Synthesis Report

See [`synthesis/yosys_report.txt`](synthesis/yosys_report.txt).

### Synthesized Netlist

See [`synthesis/neuron_sum_synth.v`](synthesis/neuron_sum_synth.v).

### Synthesized Schematic

<img width="660" height="281" alt="image" src="https://github.com/user-attachments/assets/a6ca7757-8352-4f16-a08f-44e79a51085e" />


## 3. Analog CMOS ReLU Simulation

The analog implementation uses a CMOS ReLU circuit with 10 MOSFETs. LTspice was used to examine its DC transfer characteristic and transient response.

### Circuit Schematic

<img width="935" height="793" alt="image" src="https://github.com/user-attachments/assets/8dbd959f-2e34-421c-ad8d-a59ba7ab2677" />


### DC Sweep Analysis

<img width="957" height="968" alt="image" src="https://github.com/user-attachments/assets/2b5a97b0-0927-43cb-8de6-15e92e0d2e99" />


The DC sweep is used to examine how the output responds to positive and negative input voltages.

### Transient Analysis

<img width="1032" height="967" alt="image" src="https://github.com/user-attachments/assets/1b4e1140-46a6-440f-b3c5-2edfbaf3a376" />


The transient analysis is used to observe the circuit's response as the input varies over time.

### Analog Verification Results

The project report records the following simulation results:

| Measurement | Reported value |
|---|---:|
| Positive input | 502.15 mV |
| Corresponding output | 503.83 mV |
| Positive-input error | 0.335% |
| Negative input | -509.84 mV |
| Corresponding output | 0.22 mV |

These are the reported analog simulation measurements; refer to the original LTspice results for the circuit conditions and measurement setup.

## Key Learning Outcomes

- SystemVerilog RTL coding and signed arithmetic.
- Testbench-based functional verification.
- RTL synthesis and netlist inspection using Yosys.
- CMOS circuit design and analog simulation using LTspice.
- Documentation of simulation and synthesis results.

## Author

**Kavin K K**

[GitHub](https://github.com/kavinkk0509) · [LinkedIn](https://www.linkedin.com/in/kavin-k-k-188671371/)
