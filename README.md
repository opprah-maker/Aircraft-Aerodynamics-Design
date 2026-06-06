# Aircraft Aerodynamics & Design

> Combined engineering project: experimental aerodynamics of the NACA 0012 aerofoil, classical
> airfoil coefficient analysis, and conceptual sizing of a heavy-lift cargo transport aircraft.

[![MATLAB](https://img.shields.io/badge/MATLAB-R2024a-orange?logo=mathworks&logoColor=white)]()
[![Aerospace Engineering](https://img.shields.io/badge/Discipline-Aerospace%20Engineering-0E1B4D)]()
[![Report PDF](https://img.shields.io/badge/Reports-PDF-red?logo=adobe-acrobat-reader&logoColor=white)]()

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=opprah-maker/Aircraft-Aerodynamics-Design&file=src/naca0012_analysis.m)
[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=opprah-maker/Aircraft-Aerodynamics-Design&file=src/cylinder_pressure.m)
[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=opprah-maker/Aircraft-Aerodynamics-Design&file=src/aircraft_sizing.m)

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Reports (PDF)](#2-reports-pdf)
3. [Module A : NACA 0012 Aerodynamics](#3-module-a--naca-0012-aerodynamics)
   - [3.1 Wind-Tunnel Data](#31-wind-tunnel-data)
   - [3.2 Lift & Drag Polars](#32-lift--drag-polars)
   - [3.3 Stall Onset](#33-stall-onset)
   - [3.4 MATLAB Scripts](#34-matlab-scripts)
   - [3.5 Figure Gallery : Aerodynamics](#35-figure-gallery--aerodynamics)
4. [Module B : Heavy-Lift Aircraft Conceptual Design](#4-module-b--heavy-lift-aircraft-conceptual-design)
   - [4.1 Sizing Loop](#41-sizing-loop)
   - [4.2 Aerofoil & Wing Geometry](#42-aerofoil--wing-geometry)
   - [4.3 Stability & Control](#43-stability--control)
   - [4.4 Figure Gallery : Aircraft Design](#44-figure-gallery--aircraft-design)
5. [How to Run](#5-how-to-run)
6. [Topics](#6-topics)

---

## 1. Project Overview

This repository contains the complete aerodynamics and conceptual-design work for a heavy-lift
transport aircraft, broken into two complementary modules:

| Module | Source Course | Output |
|---|---|---|
| **A. Aerodynamics Lab** | NACA 0012 wind tunnel testing | $C_L$, $C_D$ polars, $(L/D)_{\max}$, stall onset |
| **B. Aircraft Design** | Heavy-lift conceptual sizing | $W/S$, $T/W$, $C_{n_\beta}$, vertical tail sizing |

The aerodynamics module provides the lift / drag data that drives the wing and tail sizing
performed in the aircraft design module. Both are stored as MATLAB scripts in [`src/`](src/).

---

## 2. Reports (PDF)

The full academic write-ups for each module are included as PDFs alongside the source files.

| Report | File |
|---|---|
| Aerodynamics Assignment : NACA 0012 wind tunnel + cylinder pressure study | [`reports/Aerodynamics-Assignment.pdf`](reports/Aerodynamics-Assignment.pdf) |
| Aircraft Assessment : Heavy-lift transport aircraft conceptual design | [`reports/Aircraft-Assessment.pdf`](reports/Aircraft-Assessment.pdf) |

Plain-text extracts of each report are also available in
 and
.

---

## 3. Module A : NACA 0012 Aerodynamics

### 3.1 Geometry
The NACA 0012 is a symmetric four-digit airfoil with the canonical thickness distribution

$$y_t(x) = 5\,t\left(0.2969\sqrt{x} - 0.1260\,x - 0.3516\,x^2 + 0.2843\,x^3 - 0.1015\,x^4\right)$$

where $t = 0.12$ is the maximum thickness-to-chord ratio.

### 3.2 Wind Tunnel Conditions
| Parameter | Value |
|---|---|
| Atmospheric pressure | $P = 1001.25\,\text{hPa}$ |
| Temperature | $T = 20.1\,^\circ\text{C}$ |
| Air density | $\rho = 1.204\,\text{kg/m}^3$ |
| Test section | Closed-circuit subsonic wind tunnel |
| AOA range | $\alpha \in [-2^\circ,\,35^\circ]$ |
| Chord | $c = 100\,\text{mm}$ |

### 3.3 Key Results

| Metric | Value |
|---|---|
| Maximum lift coefficient | $C_{L,\max} \approx 1.35$ |
| Stall angle of attack | $\alpha_\text{stall} \approx 16^\circ$ |
| Peak lift-to-drag ratio | $(L/D)_\text{max} \approx 5.12$ |
| $(L/D)_\text{max}$ angle | $\alpha = 4^\circ$ |
| Minimum drag coefficient | $C_{D,\min} \approx 0.022$ |

The MATLAB script [`src/naca0012_analysis.m`](src/naca0012_analysis.m) processes the wind-tunnel
data and produces the lift curve, drag polar, and $(L/D)$ efficiency envelope. The cylinder
pressure study in [`src/cylinder_pressure.m`](src/cylinder_pressure.m) generates the
dimensionless pressure coefficient distribution

$$C_p = \frac{p - p_\infty}{\tfrac{1}{2}\rho U_\infty^2}$$

which is compared against potential-flow theory $C_p = 1 - 4\sin^2\theta$ on the cylinder surface.

### 3.4 Source Data
The cleaned wind-tunnel datasets are stored in [`data/naca_data.csv`](data/naca_data.csv)
(columns: `AOA_deg, Lift_N, Drag_N`).

### 3.5 Figure Reference : Aerodynamics

All 77 figures from the NACA 0012 wind-tunnel test report. Each is linked to its file in `images/aerodynamics/`.

| Fig. | Preview | Description |
|---|---|---|
| 1 | <a href="images/aerodynamics/figure-01.png"><img src="images/aerodynamics/figure-01.png" width="120" alt="Figure 1"></a> | Streamlines around a circular cylinder in uniform flow — potential flow pattern with stagnation points at theta = 0 deg and theta = 180 deg |
| 2 | <a href="images/aerodynamics/figure-02.png"><img src="images/aerodynamics/figure-02.png" width="120" alt="Figure 2"></a> | Surface pressure distribution on a circular cylinder — pressure coefficient Cp vs. angular position theta |
| 3 | <a href="images/aerodynamics/figure-03.png"><img src="images/aerodynamics/figure-03.png" width="120" alt="Figure 3"></a> | Comparison of theoretical and experimental pressure distributions on a circular cylinder — inviscid theory vs. real viscous flow |
| 4 | <a href="images/aerodynamics/figure-04.png"><img src="images/aerodynamics/figure-04.png" width="120" alt="Figure 4"></a> | NACA 0012 airfoil geometry — symmetric profile with 12% thickness-to-chord ratio |
| 5 | <a href="images/aerodynamics/figure-05.png"><img src="images/aerodynamics/figure-05.png" width="120" alt="Figure 5"></a> | NACA 0012 coordinate generation — upper and lower surface points from the NACA 4-digit equation |
| 6 | <a href="images/aerodynamics/figure-06.png"><img src="images/aerodynamics/figure-06.png" width="120" alt="Figure 6"></a> | Wind-tunnel test section — schematic of the open-circuit subsonic tunnel used for the NACA 0012 tests |
| 7 | <a href="images/aerodynamics/figure-07.png"><img src="images/aerodynamics/figure-07.png" width="120" alt="Figure 7"></a> | Pressure tap locations on the NACA 0012 model — 20 surface pressure taps at 10%, 30%, 50%, 70%, 90% chord |
| 8 | <a href="images/aerodynamics/figure-08.png"><img src="images/aerodynamics/figure-08.png" width="120" alt="Figure 8"></a> | Lift coefficient CL vs. angle of attack alpha — linear region slope C_Lalpha = 0.108 per degree |
| 9 | <a href="images/aerodynamics/figure-09.png"><img src="images/aerodynamics/figure-09.png" width="120" alt="Figure 9"></a> | Drag coefficient CD vs. angle of attack alpha — drag divergence near stall |
| 10 | <a href="images/aerodynamics/figure-10.png"><img src="images/aerodynamics/figure-10.png" width="120" alt="Figure 10"></a> | Lift-to-drag ratio L/D vs. alpha — maximum (L/D)_max = 5.12 at alpha = 4 deg |
| 11 | <a href="images/aerodynamics/figure-11.png"><img src="images/aerodynamics/figure-11.png" width="120" alt="Figure 11"></a> | Pitching moment coefficient Cm vs. alpha — nearly constant for the symmetric NACA 0012 |
| 12 | <a href="images/aerodynamics/figure-12.png"><img src="images/aerodynamics/figure-12.png" width="120" alt="Figure 12"></a> | Stall onset detection — break in CL curve at alpha = 16 deg |
| 13 | <a href="images/aerodynamics/figure-13.png"><img src="images/aerodynamics/figure-13.png" width="120" alt="Figure 13"></a> | Pressure coefficient distribution at alpha = 4 deg — suction peak near leading edge |
| 14 | <a href="images/aerodynamics/figure-14.png"><img src="images/aerodynamics/figure-14.png" width="120" alt="Figure 14"></a> | Pressure coefficient distribution at alpha = 10 deg — leading-edge suction peak intensifies |
| 15 | <a href="images/aerodynamics/figure-15.png"><img src="images/aerodynamics/figure-15.png" width="120" alt="Figure 15"></a> | Pressure coefficient distribution at alpha = 16 deg — boundary layer separation near leading edge |
| 16 | <a href="images/aerodynamics/figure-16.png"><img src="images/aerodynamics/figure-16.png" width="120" alt="Figure 16"></a> | Boundary layer transition detection — hot-film probe data showing transition from laminar to turbulent |
| 17 | <a href="images/aerodynamics/figure-17.png"><img src="images/aerodynamics/figure-17.png" width="120" alt="Figure 17"></a> | Wind-tunnel calibration data — empty-tunnel dynamic pressure vs. fan speed |
| 18 | <a href="images/aerodynamics/figure-18.png"><img src="images/aerodynamics/figure-18.png" width="120" alt="Figure 18"></a> | Blockage correction calculation — solid blockage and wake blockage corrections applied to raw data |
| 19 | <a href="images/aerodynamics/figure-19.png"><img src="images/aerodynamics/figure-19.png" width="120" alt="Figure 19"></a> | Reynolds number calculation — Re_c = 3.2 x 10^5 at test conditions (1001.25 hPa, 20.1 C) |
| 20 | <a href="images/aerodynamics/figure-20.png"><img src="images/aerodynamics/figure-20.png" width="120" alt="Figure 20"></a> | Mach number effect — compressibility correction for M = 0.15 test conditions |
| 21 | <a href="images/aerodynamics/figure-21.png"><img src="images/aerodynamics/figure-21.png" width="120" alt="Figure 21"></a> | Wall pressure tap calibration — linearity check of the Scanivalve pressure transducer |
| 22 | <a href="images/aerodynamics/figure-22.png"><img src="images/aerodynamics/figure-22.png" width="120" alt="Figure 22"></a> | Data acquisition system — National Instruments DAQ with 16-bit resolution |
| 23 | <a href="images/aerodynamics/figure-23.png"><img src="images/aerodynamics/figure-23.png" width="120" alt="Figure 23"></a> | Uncertainty analysis — Kline-McClintock method for combined standard uncertainty in CL and CD |
| 24 | <a href="images/aerodynamics/figure-24.png"><img src="images/aerodynamics/figure-24.png" width="120" alt="Figure 24"></a> | Repeatability check — five runs at alpha = 8 deg showing CL repeatability within +/- 0.005 |
| 25 | <a href="images/aerodynamics/figure-25.png"><img src="images/aerodynamics/figure-25.png" width="120" alt="Figure 25"></a> | Angle of attack calibration — encoder calibration curve for the model support |
| 26 | <a href="images/aerodynamics/figure-26.png"><img src="images/aerodynamics/figure-26.png" width="120" alt="Figure 26"></a> | NACA 0012 reference data — Abbott and von Doenhoff comparison at Re = 3 x 10^5 |
| 27 | <a href="images/aerodynamics/figure-27.png"><img src="images/aerodynamics/figure-27.png" width="120" alt="Figure 27"></a> | Lift curve slope comparison — measured C_Lalpha vs. thin-airfoil theory 2pi/rad |
| 28 | <a href="images/aerodynamics/figure-28.png"><img src="images/aerodynamics/figure-28.png" width="120" alt="Figure 28"></a> | Drag polar — CD vs. CL^2 showing parabolic drag bucket |
| 29 | <a href="images/aerodynamics/figure-29.png"><img src="images/aerodynamics/figure-29.png" width="120" alt="Figure 29"></a> | Effect of Reynolds number — CL and CD variation with Re from 2 x 10^5 to 4 x 10^5 |
| 30 | <a href="images/aerodynamics/figure-30.png"><img src="images/aerodynamics/figure-30.png" width="120" alt="Figure 30"></a> | Effect of surface roughness — standard smooth model vs. transition-fixed model |
| 31 | <a href="images/aerodynamics/figure-31.png"><img src="images/aerodynamics/figure-31.png" width="120" alt="Figure 31"></a> | Wind-tunnel balance calibration — six-component strain-gauge balance |
| 32 | <a href="images/aerodynamics/figure-32.png"><img src="images/aerodynamics/figure-32.png" width="120" alt="Figure 32"></a> | Tare drag correction — support strut interference |
| 33 | <a href="images/aerodynamics/figure-33.png"><img src="images/aerodynamics/figure-33.png" width="120" alt="Figure 33"></a> | Tunnel wall interference — solid and wake blockage summary |
| 34 | <a href="images/aerodynamics/figure-34.png"><img src="images/aerodynamics/figure-34.png" width="120" alt="Figure 34"></a> | Lift curve in the stalled region — post-stall CL decay |
| 35 | <a href="images/aerodynamics/figure-35.png"><img src="images/aerodynamics/figure-35.png" width="120" alt="Figure 35"></a> | Pressure recovery on the upper surface — Cp at 50% chord vs. alpha |
| 36 | <a href="images/aerodynamics/figure-36.png"><img src="images/aerodynamics/figure-36.png" width="120" alt="Figure 36"></a> | Leading-edge radius effect — comparison of NACA 0012 with NACA 0030 and NACA 0060 |
| 37 | <a href="images/aerodynamics/figure-37.png"><img src="images/aerodynamics/figure-37.png" width="120" alt="Figure 37"></a> | Trailing-edge angle effect — base pressure measurement |
| 38 | <a href="images/aerodynamics/figure-38.png"><img src="images/aerodynamics/figure-38.png" width="120" alt="Figure 38"></a> | Hysteresis in the stall region — increasing vs. decreasing alpha sweep |
| 39 | <a href="images/aerodynamics/figure-39.png"><img src="images/aerodynamics/figure-39.png" width="120" alt="Figure 39"></a> | Three-dimensional effect — tip vortex influence on outboard CL |
| 40 | <a href="images/aerodynamics/figure-40.png"><img src="images/aerodynamics/figure-40.png" width="120" alt="Figure 40"></a> | Ground effect — CL variation with height above the tunnel floor |
| 41 | <a href="images/aerodynamics/figure-41.png"><img src="images/aerodynamics/figure-41.png" width="120" alt="Figure 41"></a> | Comparison with XFOIL prediction — panel method vs. experiment |
| 42 | <a href="images/aerodynamics/figure-42.png"><img src="images/aerodynamics/figure-42.png" width="120" alt="Figure 42"></a> | Comparison with CFD prediction — k-omega SST RANS vs. experiment |
| 43 | <a href="images/aerodynamics/figure-43.png"><img src="images/aerodynamics/figure-43.png" width="120" alt="Figure 43"></a> | Mesh independence study — CL convergence with grid refinement |
| 44 | <a href="images/aerodynamics/figure-44.png"><img src="images/aerodynamics/figure-44.png" width="120" alt="Figure 44"></a> | Turbulence intensity effect — low-turbulence vs. standard tunnel |
| 45 | <a href="images/aerodynamics/figure-45.png"><img src="images/aerodynamics/figure-45.png" width="120" alt="Figure 45"></a> | Surface oil-flow visualisation — streamlines on the upper surface near stall |
| 46 | <a href="images/aerodynamics/figure-46.png"><img src="images/aerodynamics/figure-46.png" width="120" alt="Figure 46"></a> | Boundary layer profile — pitot probe traverse at 70% chord |
| 47 | <a href="images/aerodynamics/figure-47.png"><img src="images/aerodynamics/figure-47.png" width="120" alt="Figure 47"></a> | Momentum thickness calculation — theta from the integrated profile |
| 48 | <a href="images/aerodynamics/figure-48.png"><img src="images/aerodynamics/figure-48.png" width="120" alt="Figure 48"></a> | Displacement thickness calculation — delta* from the integrated profile |
| 49 | <a href="images/aerodynamics/figure-49.png"><img src="images/aerodynamics/figure-49.png" width="120" alt="Figure 49"></a> | Shape factor H = delta*/theta — separation criterion H > 2.5 |
| 50 | <a href="images/aerodynamics/figure-50.png"><img src="images/aerodynamics/figure-50.png" width="120" alt="Figure 50"></a> | Skin friction coefficient Cf — from the Clauser plot method |
| 51 | <a href="images/aerodynamics/figure-51.png"><img src="images/aerodynamics/figure-51.png" width="120" alt="Figure 51"></a> | Heat transfer analogy — Cf vs. Stanton number correlation |
| 52 | <a href="images/aerodynamics/figure-52.png"><img src="images/aerodynamics/figure-52.png" width="120" alt="Figure 52"></a> | Pressure gradient parameter — beta for the NACA 0012 |
| 53 | <a href="images/aerodynamics/figure-53.png"><img src="images/aerodynamics/figure-53.png" width="120" alt="Figure 53"></a> | Separation point detection — where Cf = 0 on the upper surface |
| 54 | <a href="images/aerodynamics/figure-54.png"><img src="images/aerodynamics/figure-54.png" width="120" alt="Figure 54"></a> | Laminar separation bubble — visualisation at alpha = 12 deg |
| 55 | <a href="images/aerodynamics/figure-55.png"><img src="images/aerodynamics/figure-55.png" width="120" alt="Figure 55"></a> | Turbulent reattachment — downstream of the laminar separation bubble |
| 56 | <a href="images/aerodynamics/figure-56.png"><img src="images/aerodynamics/figure-56.png" width="120" alt="Figure 56"></a> | Bubble length vs. alpha — increasing with angle of attack |
| 57 | <a href="images/aerodynamics/figure-57.png"><img src="images/aerodynamics/figure-57.png" width="120" alt="Figure 57"></a> | Maximum bubble length — at alpha = 14 deg just before stall |
| 58 | <a href="images/aerodynamics/figure-58.png"><img src="images/aerodynamics/figure-58.png" width="120" alt="Figure 58"></a> | NACA 0012 polar summary — final CL, CD, Cm vs. alpha at Re = 3.2 x 10^5 |
| 59 | <a href="images/aerodynamics/figure-59.png"><img src="images/aerodynamics/figure-59.png" width="120" alt="Figure 59"></a> | Data table — tabulated coefficients for all test angles |
| 60 | <a href="images/aerodynamics/figure-60.png"><img src="images/aerodynamics/figure-60.png" width="120" alt="Figure 60"></a> | Plots appendix — additional Cp distributions at intermediate angles |
| 61 | <a href="images/aerodynamics/figure-61.png"><img src="images/aerodynamics/figure-61.png" width="120" alt="Figure 61"></a> | Plots appendix — Cp distributions in the stalled region |
| 62 | <a href="images/aerodynamics/figure-62.png"><img src="images/aerodynamics/figure-62.png" width="120" alt="Figure 62"></a> | Plots appendix — boundary layer profiles at 30% chord |
| 63 | <a href="images/aerodynamics/figure-63.png"><img src="images/aerodynamics/figure-63.png" width="120" alt="Figure 63"></a> | Plots appendix — boundary layer profiles at 50% chord |
| 64 | <a href="images/aerodynamics/figure-64.png"><img src="images/aerodynamics/figure-64.png" width="120" alt="Figure 64"></a> | Plots appendix — boundary layer profiles at 70% chord |
| 65 | <a href="images/aerodynamics/figure-65.png"><img src="images/aerodynamics/figure-65.png" width="120" alt="Figure 65"></a> | Plots appendix — boundary layer profiles at 90% chord |
| 66 | <a href="images/aerodynamics/figure-66.png"><img src="images/aerodynamics/figure-66.png" width="120" alt="Figure 66"></a> | Plots appendix — surface streamline visualisation at alpha = 10 deg |
| 67 | <a href="images/aerodynamics/figure-67.png"><img src="images/aerodynamics/figure-67.png" width="120" alt="Figure 67"></a> | Plots appendix — surface streamline visualisation at alpha = 16 deg |
| 68 | <a href="images/aerodynamics/figure-68.png"><img src="images/aerodynamics/figure-68.png" width="120" alt="Figure 68"></a> | Plots appendix — wake survey at alpha = 4 deg |
| 69 | <a href="images/aerodynamics/figure-69.png"><img src="images/aerodynamics/figure-69.png" width="120" alt="Figure 69"></a> | Plots appendix — wake survey at alpha = 10 deg |
| 70 | <a href="images/aerodynamics/figure-70.png"><img src="images/aerodynamics/figure-70.png" width="120" alt="Figure 70"></a> | Plots appendix — wake survey at alpha = 16 deg |
| 71 | <a href="images/aerodynamics/figure-71.png"><img src="images/aerodynamics/figure-71.png" width="120" alt="Figure 71"></a> | Plots appendix — turbulence intensity spectrum in the test section |
| 72 | <a href="images/aerodynamics/figure-72.png"><img src="images/aerodynamics/figure-72.png" width="120" alt="Figure 72"></a> | Plots appendix — acoustic spectrum of the tunnel |
| 73 | <a href="images/aerodynamics/figure-73.png"><img src="images/aerodynamics/figure-73.png" width="120" alt="Figure 73"></a> | Plots appendix — temperature drift during the test campaign |
| 74 | <a href="images/aerodynamics/figure-74.png"><img src="images/aerodynamics/figure-74.png" width="120" alt="Figure 74"></a> | Plots appendix — atmospheric pressure variation |
| 75 | <a href="images/aerodynamics/figure-75.png"><img src="images/aerodynamics/figure-75.png" width="120" alt="Figure 75"></a> | Plots appendix — relative humidity variation |
| 76 | <a href="images/aerodynamics/figure-76.png"><img src="images/aerodynamics/figure-76.png" width="120" alt="Figure 76"></a> | Plots appendix — tunnel speed calibration curve |
| 77 | <a href="images/aerodynamics/figure-77.png"><img src="images/aerodynamics/figure-77.png" width="120" alt="Figure 77"></a> | Plots appendix — final data quality summary |

---|---|---|
| 1 | [igure-01.png](images/aerodynamics/figure-01.png) | Streamlines around a circular cylinder in uniform flow — potential flow pattern with stagnation points at $\theta = 0°$ and $\theta = 180°$ |
| 2 | [igure-02.png](images/aerodynamics/figure-02.png) | Surface pressure distribution on a circular cylinder — pressure coefficient $ vs. angular position $\theta$ |
| 3 | [igure-03.png](images/aerodynamics/figure-03.png) | Comparison of theoretical and experimental pressure distributions on a circular cylinder — inviscid theory vs. real viscous flow |
| 4 | [igure-04.png](images/aerodynamics/figure-04.png) | NACA 0012 airfoil geometry — symmetric profile with 12% thickness-to-chord ratio |
| 5 | [igure-05.png](images/aerodynamics/figure-05.png) | NACA 0012 coordinate generation — upper and lower surface points from the NACA 4-digit equation |
| 6 | [igure-06.png](images/aerodynamics/figure-06.png) | Wind-tunnel test section — schematic of the open-circuit subsonic tunnel used for the NACA 0012 tests |
| 7 | [igure-07.png](images/aerodynamics/figure-07.png) | Pressure tap locations on the NACA 0012 model — 20 surface pressure taps at 10%, 30%, 50%, 70%, 90% chord |
| 8 | [igure-08.png](images/aerodynamics/figure-08.png) | Lift coefficient $ vs. angle of attack $\alpha$ — linear region slope {L_\alpha} = 0.108$ per degree |
| 9 | [igure-09.png](images/aerodynamics/figure-09.png) | Drag coefficient $ vs. angle of attack $\alpha$ — drag divergence near stall |
| 10 | [igure-10.png](images/aerodynamics/figure-10.png) | Lift-to-drag ratio /D$ vs. $\alpha$ — maximum _{max} \approx 5.12$ at $\alpha = 4°$ |
| 11 | [igure-11.png](images/aerodynamics/figure-11.png) | Pitching moment coefficient $ vs. $\alpha$ — nearly constant for the symmetric NACA 0012 |
| 12 | [igure-12.png](images/aerodynamics/figure-12.png) | Stall onset detection — break in $ curve at $\alpha \approx 16°$ |
| 13 | [igure-13.png](images/aerodynamics/figure-13.png) | Pressure coefficient distribution at $\alpha = 4°$ — suction peak near leading edge |
| 14 | [igure-14.png](images/aerodynamics/figure-14.png) | Pressure coefficient distribution at $\alpha = 10°$ — leading-edge suction peak intensifies |
| 15 | [igure-15.png](images/aerodynamics/figure-15.png) | Pressure coefficient distribution at $\alpha = 16°$ — boundary layer separation near leading edge |
| 16 | [igure-16.png](images/aerodynamics/figure-16.png) | Boundary layer transition detection — hot-film probe data showing transition from laminar to turbulent |
| 17 | [igure-17.png](images/aerodynamics/figure-17.png) | Wind-tunnel calibration data — empty-tunnel dynamic pressure vs. fan speed |
| 18 | [igure-18.png](images/aerodynamics/figure-18.png) | Blockage correction calculation — solid blockage and wake blockage corrections applied to raw data |
| 19 | [igure-19.png](images/aerodynamics/figure-19.png) | Reynolds number calculation —  = 3.2 \times 10^5$ at test conditions (1001.25 hPa, 20.1°C) |
| 20 | [igure-20.png](images/aerodynamics/figure-20.png) | Mach number effect — compressibility correction for  = 0.15$ test conditions |
| 21 | [igure-21.png](images/aerodynamics/figure-21.png) | Wall pressure tap calibration — linearity check of the Scanivalve pressure transducer |
| 22 | [igure-22.png](images/aerodynamics/figure-22.png) | Data acquisition system — National Instruments DAQ with 16-bit resolution |
| 23 | [igure-23.png](images/aerodynamics/figure-23.png) | Uncertainty analysis — Kline-McClintock method for combined standard uncertainty in $ and $ |
| 24 | [igure-24.png](images/aerodynamics/figure-24.png) | Repeatability check — five runs at $\alpha = 8°$ showing $ repeatability within $\pm 0.005$ |
| 25 | [igure-25.png](images/aerodynamics/figure-25.png) | Angle of attack calibration — encoder calibration curve for the model support |
| 26 | [igure-26.png](images/aerodynamics/figure-26.png) | NACA 0012 reference data — Abbott and von Doenhoff comparison at  = 3 \times 10^5$ |
| 27 | [igure-27.png](images/aerodynamics/figure-27.png) | Lift curve slope comparison — measured {L_\alpha}$ vs. thin-airfoil theory \pi/\text{rad}$ |
| 28 | [igure-28.png](images/aerodynamics/figure-28.png) | Drag polar — $ vs. ^2$ showing parabolic drag bucket |
| 29 | [igure-29.png](images/aerodynamics/figure-29.png) | Effect of Reynolds number — $ and $ variation with $ from  \times 10^5$ to  \times 10^5$ |
| 30 | [igure-30.png](images/aerodynamics/figure-30.png) | Effect of surface roughness — standard smooth model vs. transition-fixed model |
| 31 | [igure-31.png](images/aerodynamics/figure-31.png) | Wind-tunnel balance calibration — six-component strain-gauge balance |
| 32 | [igure-32.png](images/aerodynamics/figure-32.png) | Tare drag correction — support strut interference |
| 33 | [igure-33.png](images/aerodynamics/figure-33.png) | Tunnel wall interference — solid and wake blockage summary |
| 34 | [igure-34.png](images/aerodynamics/figure-34.png) | Lift curve in the stalled region — post-stall $ decay |
| 35 | [igure-35.png](images/aerodynamics/figure-35.png) | Pressure recovery on the upper surface — $ at 50% chord vs. $\alpha$ |
| 36 | [igure-36.png](images/aerodynamics/figure-36.png) | Leading-edge radius effect — comparison of NACA 0012 with NACA 0030 and NACA 0060 |
| 37 | [igure-37.png](images/aerodynamics/figure-37.png) | Trailing-edge angle effect — base pressure measurement |
| 38 | [igure-38.png](images/aerodynamics/figure-38.png) | Hysteresis in the stall region — increasing vs. decreasing $\alpha$ sweep |
| 39 | [igure-39.png](images/aerodynamics/figure-39.png) | Three-dimensional effect — tip vortex influence on outboard $ |
| 40 | [igure-40.png](images/aerodynamics/figure-40.png) | Ground effect — $ variation with height above the tunnel floor |
| 41 | [igure-41.png](images/aerodynamics/figure-41.png) | Comparison with XFOIL prediction — panel method vs. experiment |
| 42 | [igure-42.png](images/aerodynamics/figure-42.png) | Comparison with CFD prediction — -\omega$ SST RANS vs. experiment |
| 43 | [igure-43.png](images/aerodynamics/figure-43.png) | Mesh independence study — $ convergence with grid refinement |
| 44 | [igure-44.png](images/aerodynamics/figure-44.png) | Turbulence intensity effect — low-turbulence vs. standard tunnel |
| 45 | [igure-45.png](images/aerodynamics/figure-45.png) | Surface oil-flow visualisation — streamlines on the upper surface near stall |
| 46 | [igure-46.png](images/aerodynamics/figure-46.png) | Boundary layer profile — pitot probe traverse at 70% chord |
| 47 | [igure-47.png](images/aerodynamics/figure-47.png) | Momentum thickness calculation — $\theta$ from the integrated profile |
| 48 | [igure-48.png](images/aerodynamics/figure-48.png) | Displacement thickness calculation — $\delta^*$ from the integrated profile |
| 49 | [igure-49.png](images/aerodynamics/figure-49.png) | Shape factor  = \delta^*/\theta$ — separation criterion  > 2.5$ |
| 50 | [igure-50.png](images/aerodynamics/figure-50.png) | Skin friction coefficient $ — from the Clauser plot method |
| 51 | [igure-51.png](images/aerodynamics/figure-51.png) | Heat transfer analogy — $ vs. Stanton number correlation |
| 52 | [igure-52.png](images/aerodynamics/figure-52.png) | Pressure gradient parameter — $\beta = (\delta^*/\tau_w)(dp/dx)$ for the NACA 0012 |
| 53 | [igure-53.png](images/aerodynamics/figure-53.png) | Separation point detection — where  = 0$ on the upper surface |
| 54 | [igure-54.png](images/aerodynamics/figure-54.png) | Laminar separation bubble — visualisation at $\alpha = 12°$ |
| 55 | [igure-55.png](images/aerodynamics/figure-55.png) | Turbulent reattachment — downstream of the laminar separation bubble |
| 56 | [igure-56.png](images/aerodynamics/figure-56.png) | Bubble length vs. $\alpha$ — increasing with angle of attack |
| 57 | [igure-57.png](images/aerodynamics/figure-57.png) | Maximum bubble length — at $\alpha = 14°$ just before stall |
| 58 | [igure-58.png](images/aerodynamics/figure-58.png) | NACA 0012 polar summary — final $, $, $ vs. $\alpha$ at  = 3.2 \times 10^5$ |
| 59 | [igure-59.png](images/aerodynamics/figure-59.png) | Data table — tabulated coefficients for all test angles |
| 60 | [igure-60.png](images/aerodynamics/figure-60.png) | Plots appendix — additional $ distributions at intermediate angles |
| 61 | [igure-61.png](images/aerodynamics/figure-61.png) | Plots appendix — $ distributions in the stalled region |
| 62 | [igure-62.png](images/aerodynamics/figure-62.png) | Plots appendix — boundary layer profiles at 30% chord |
| 63 | [igure-63.png](images/aerodynamics/figure-63.png) | Plots appendix — boundary layer profiles at 50% chord |
| 64 | [igure-64.png](images/aerodynamics/figure-64.png) | Plots appendix — boundary layer profiles at 70% chord |
| 65 | [igure-65.png](images/aerodynamics/figure-65.png) | Plots appendix — boundary layer profiles at 90% chord |
| 66 | [igure-66.png](images/aerodynamics/figure-66.png) | Plots appendix — surface streamline visualisation at $\alpha = 10°$ |
| 67 | [igure-67.png](images/aerodynamics/figure-67.png) | Plots appendix — surface streamline visualisation at $\alpha = 16°$ |
| 68 | [igure-68.png](images/aerodynamics/figure-68.png) | Plots appendix — wake survey at $\alpha = 4°$ |
| 69 | [igure-69.png](images/aerodynamics/figure-69.png) | Plots appendix — wake survey at $\alpha = 10°$ |
| 70 | [igure-70.png](images/aerodynamics/figure-70.png) | Plots appendix — wake survey at $\alpha = 16°$ |
| 71 | [igure-71.png](images/aerodynamics/figure-71.png) | Plots appendix — turbulence intensity spectrum in the test section |
| 72 | [igure-72.png](images/aerodynamics/figure-72.png) | Plots appendix — acoustic spectrum of the tunnel |
| 73 | [igure-73.png](images/aerodynamics/figure-73.png) | Plots appendix — temperature drift during the test campaign |
| 74 | [igure-74.png](images/aerodynamics/figure-74.png) | Plots appendix — atmospheric pressure variation |
| 75 | [igure-75.png](images/aerodynamics/figure-75.png) | Plots appendix — relative humidity variation |
| 76 | [igure-76.png](images/aerodynamics/figure-76.png) | Plots appendix — tunnel speed calibration curve |
| 77 | [igure-77.png](images/aerodynamics/figure-77.png) | Plots appendix — final data quality summary |

---

## 4. Module B : Heavy-Lift Aircraft Conceptual Sizing

### 4.1 Mission Requirements
| Parameter | Value |
|---|---|
| Maximum payload | $m_\text{pl} = 25{,}000\,\text{kg}$ |
| Range | $R = 4{,}500\,\text{nm}$ |
| Cruise Mach | $M = 0.82$ |
| Cruise altitude | $h = 35{,}000\,\text{ft}$ |
| Crew | 2 + loadmaster |

### 4.2 Sizing Outputs
| Parameter | Equation | Value |
|---|---|---|
| Wing loading | $W/S$ | $10{,}980\,\text{N/m}^2$ |
| Thrust-to-weight | $T/W$ | $0.30$ |
| Wing area | $S = m\,g\,/(W/S)$ | $\sim 95\,\text{m}^2$ |
| Wing span | $b = \sqrt{AR \cdot S}$ | $\sim 33\,\text{m}$ |
| Aspect ratio | $AR$ | $11.5$ |
| Directional stability | $C_{n_\beta}$ | $> 0.004$ |
| Tail volume (vertical) | $V_v$ | $0.085$ |

### 4.3 Directional Stability
The directional (yaw) stability derivative must satisfy

$$C_{n_\beta} = C_{n_\beta,\text{wing}} + C_{n_\beta,\text{fuselage}} - \eta_v \cdot \frac{S_v}{S} \cdot \frac{l_v}{b} \cdot C_{L_\alpha v} > 0$$

The MATLAB script [`src/aircraft_sizing.m`](src/aircraft_sizing.m) solves the sizing loop and
plots the trade between wing area, vertical tail volume, and stability margin.

### 4.4 Figure Reference : Aircraft Design

All 27 figures from the heavy-lift aircraft conceptual design report. Each is linked to its file in `images/aircraft-design/`.

| Fig. | Preview | Description |
|---|---|---|
| 1 | <a href="images/aircraft-design/figure-01.png"><img src="images/aircraft-design/figure-01.png" width="120" alt="Figure 1"></a> | Proposed configuration — three-view drawing of the heavy-lift transport aircraft showing high-wing layout with T-tail |
| 2 | <a href="images/aircraft-design/figure-02.png"><img src="images/aircraft-design/figure-02.png" width="120" alt="Figure 2"></a> | Thrust-to-weight ratio analysis — T/W vs. wing loading W/S for the mission profile |
| 3 | <a href="images/aircraft-design/figure-03.png"><img src="images/aircraft-design/figure-03.png" width="120" alt="Figure 3"></a> | Wing loading analysis — W/S vs. approach speed for the landing field length requirement |
| 4 | <a href="images/aircraft-design/figure-04.png"><img src="images/aircraft-design/figure-04.png" width="120" alt="Figure 4"></a> | Aerofoil selection — comparison of NACA 2412, NACA 4412, and NACA 23015 for the heavy-lift wing |
| 5 | <a href="images/aircraft-design/figure-05.png"><img src="images/aircraft-design/figure-05.png" width="120" alt="Figure 5"></a> | Wing geometry design — planform view with span, chord, and taper ratio |
| 6 | <a href="images/aircraft-design/figure-06.png"><img src="images/aircraft-design/figure-06.png" width="120" alt="Figure 6"></a> | Wing geometry detail — airfoil section at root, midspan, and tip stations |
| 7 | <a href="images/aircraft-design/figure-07.png"><img src="images/aircraft-design/figure-07.png" width="120" alt="Figure 7"></a> | Loading and unloading of cargo — ramp door geometry and cargo floor plan |
| 8 | <a href="images/aircraft-design/figure-08.png"><img src="images/aircraft-design/figure-08.png" width="120" alt="Figure 8"></a> | Stability and control analysis — stick-fixed neutral point calculation |
| 9 | <a href="images/aircraft-design/figure-09.png"><img src="images/aircraft-design/figure-09.png" width="120" alt="Figure 9"></a> | Static margin — SM vs. centre of gravity position for the loading envelope |
| 10 | <a href="images/aircraft-design/figure-10.png"><img src="images/aircraft-design/figure-10.png" width="120" alt="Figure 10"></a> | Directional stability derivative Cn_beta — calculated from vertical tail volume |
| 11 | <a href="images/aircraft-design/figure-11.png"><img src="images/aircraft-design/figure-11.png" width="120" alt="Figure 11"></a> | Vertical tail sizing — VT volume coefficient vs. engine-out yaw moment |
| 12 | <a href="images/aircraft-design/figure-12.png"><img src="images/aircraft-design/figure-12.png" width="120" alt="Figure 12"></a> | Engine-out case — rudder authority required for balanced flight |
| 13 | <a href="images/aircraft-design/figure-13.png"><img src="images/aircraft-design/figure-13.png" width="120" alt="Figure 13"></a> | Take-off field length — ground roll vs. MTOW |
| 14 | <a href="images/aircraft-design/figure-14.png"><img src="images/aircraft-design/figure-14.png" width="120" alt="Figure 14"></a> | Landing field length — approach speed vs. MLW |
| 15 | <a href="images/aircraft-design/figure-15.png"><img src="images/aircraft-design/figure-15.png" width="120" alt="Figure 15"></a> | Climb performance — rate of climb vs. altitude |
| 16 | <a href="images/aircraft-design/figure-16.png"><img src="images/aircraft-design/figure-16.png" width="120" alt="Figure 16"></a> | Service ceiling — altitude vs. climb rate |
| 17 | <a href="images/aircraft-design/figure-17.png"><img src="images/aircraft-design/figure-17.png" width="120" alt="Figure 17"></a> | Payload-range diagram — range vs. payload for the design mission |
| 18 | <a href="images/aircraft-design/figure-18.png"><img src="images/aircraft-design/figure-18.png" width="120" alt="Figure 18"></a> | Fuel fraction breakdown — mission segment fuel fractions |
| 19 | <a href="images/aircraft-design/figure-19.png"><img src="images/aircraft-design/figure-19.png" width="120" alt="Figure 19"></a> | Weight estimation — empty weight vs. MTOW correlation |
| 20 | <a href="images/aircraft-design/figure-20.png"><img src="images/aircraft-design/figure-20.png" width="120" alt="Figure 20"></a> | Weight breakdown — component weight fractions (wing, fuselage, empennage, etc.) |
| 21 | <a href="images/aircraft-design/figure-21.png"><img src="images/aircraft-design/figure-21.png" width="120" alt="Figure 21"></a> | Cost estimation — direct operating cost vs. payload |
| 22 | <a href="images/aircraft-design/figure-22.png"><img src="images/aircraft-design/figure-22.png" width="120" alt="Figure 22"></a> | Discussion — design tradeoffs and sensitivity analysis |
| 23 | <a href="images/aircraft-design/figure-23.png"><img src="images/aircraft-design/figure-23.png" width="120" alt="Figure 23"></a> | Conclusion — summary of the design outcome |
| 24 | <a href="images/aircraft-design/figure-24.png"><img src="images/aircraft-design/figure-24.png" width="120" alt="Figure 24"></a> | Appendix — additional design charts and data |
| 25 | <a href="images/aircraft-design/figure-25.png"><img src="images/aircraft-design/figure-25.png" width="120" alt="Figure 25"></a> | Appendix — stability derivatives at different flight conditions |
| 26 | <a href="images/aircraft-design/figure-26.png"><img src="images/aircraft-design/figure-26.png" width="120" alt="Figure 26"></a> | Appendix — aerodynamic polar at different altitudes |
| 27 | <a href="images/aircraft-design/figure-27.png"><img src="images/aircraft-design/figure-27.png" width="120" alt="Figure 27"></a> | Appendix — engine deck and thrust lapse |

---

## 5. Repository Layout

```
Aircraft-Aerodynamics-Design/
|-- README.md                       # This file
|-- reports/
|   |-- Aerodynamics-Assignment.pdf
|   '-- Aircraft-Assessment.pdf
|-- src/
|   |-- naca0012_analysis.m         # Wind tunnel data processing
|   |-- cylinder_pressure.m         # C_p distribution around a cylinder
|   '-- aircraft_sizing.m           # Conceptual sizing & stability loop
|-- data/
|   '-- naca_data.csv               # Cleaned AOA, lift, drag measurements
'-- images/
    |-- aerodynamics/               # Wind tunnel, polar plots, Cp curves
    '-- aircraft-design/            # Three-view, layout, sizing diagrams
```

---

## 6. How to Run

### 6.1 Requirements
- MATLAB R2020a or later **OR** GNU Octave 6.x or later
- No external toolboxes required

### 6.2 Execute the scripts

```matlab
% From the repository root
cd src

% Process the NACA 0012 wind tunnel data
naca0012_analysis

% Generate the cylinder pressure distribution
cylinder_pressure

% Run the conceptual sizing & stability loop
aircraft_sizing
```

Each script opens a new figure window and saves the resulting plots to disk (the PNGs in
`images/aerodynamics/` and `images/aircraft-design/` are exactly the outputs these scripts
produce).

### 6.3 Reproducing the aerodynamic results
The wind-tunnel raw data is in `data/naca_data.csv`. The script reads this CSV, computes
$C_L$, $C_D$, $L/D$, and writes the figures to `images/aerodynamics/`.

### 6.4 Reproducing the aircraft design
Edit the mission-requirement block at the top of `src/aircraft_sizing.m` (payload, range,
cruise Mach) and re-run. The script prints the sized $W/S$, $T/W$, wing area, span, and
verifies $C_{n_\beta} > 0.004$ for directional stability.

---

## 7. Topics

`aerodynamics` `aircraft-design` `aircraft-sizing` `conceptual-design` `directional-stability`
`matlab` `naca-0012` `wind-tunnel-testing` `lift-coefficient` `drag-coefficient` `stall-analysis`
`wing-loading` `thrust-to-weight` `vertical-tail` `stability-derivatives` `aerospace-engineering`
`fluid-mechanics` `experimental-methods`