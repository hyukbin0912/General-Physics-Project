# General Physics I Project: Sliding and Rolling Along Circular Tracks

This repository contains the MATLAB simulation and numerical analysis codes for the physics group project, based on the paper published in the *American Journal of Physics*: 
**"Sliding and Rolling Along Circular Tracks in a Vertical Plane" (Rod Cross, 2023)**.

## Project Overview
This project models, simulates, and analyzes the kinematics and dynamics of objects moving along circular tracks under the influence of friction. It fills in the intermediate mathematical derivations omitted in the original paper and verifies the findings using numerical methods in MATLAB.

## Implemented Features & MATLAB Scripts
1. **`velocity_analysis.m`**: Simulates the closed-form solution of velocity squared ($v^2$) across different angles ($\theta$) and friction coefficients ($\mu$) based on the governing linear ODE.
2. **`shortest_descent_time.m`**: Performs numerical integration (`integral`) to compute the descent time $T$ along a circular arc and locates the optimal final angle $\Theta^*$ for a fixed height drop under friction.
3. **`rolling_to_sliding.m`**: Tracks the transition boundary from pure rolling to sliding motion for a solid sphere, identifying the exact transition point where the required friction exceeds the surface's static friction limit.
4. **`energy_dissipation.m`**: Quantifies and plots cumulative mechanical energy loss ($\Delta E$) as a function of the angular position to cross-verify the work-energy theorem with the analytical ODE solution.

## How to Run
1. Open MATLAB (R2021a or later recommended).
2. Clone this repository or download the `.m` files.
3. Run any script directly to generate the corresponding verification plots for the project report.

## Course Information
- **Course**: General Physics I (BS103A / BS105A)
- **Institution**: Daegu Gyeongbuk Institute of Science and Technology (DGIST)
- **Instructor**: Deniz Olgu Devecioğlu
