# Aircraft Aerodynamics & Design

> Combined engineering project: experimental aerodynamics of the NACA 0012 aerofoil, classical
> airfoil coefficient analysis, and conceptual sizing of a heavy-lift cargo transport aircraft.

[![MATLAB](https://img.shields.io/badge/MATLAB-R2024a-orangelogo=mathworks&logoColor=white)]()
[![Aerospace Engineering](https://img.shields.io/badge/Discipline-Aerospace%20Engineering-0E1B4D)]()
[![Report PDF](https://img.shields.io/badge/Reports-PDF-redlogo=adobe-acrobat-reader&logoColor=white)]()

[![Open in MATLAB Online](https://img.shields.io/badge/Open%20in-MATLAB%20Online-orangestyle=flat-square&logo=mathworks&logoColor=white)](https://matlab.mathworks.com/open/github/v1repo=opprah-maker/Aircraft-Aerodynamics-Design&file=src/naca0012_analysis.m)
[![Open in MATLAB Online](https://img.shields.io/badge/Open%20in-MATLAB%20Online-orangestyle=flat-square&logo=mathworks&logoColor=white)](https://matlab.mathworks.com/open/github/v1repo=opprah-maker/Aircraft-Aerodynamics-Design&file=src/cylinder_pressure.m)
[![Open in MATLAB Online](https://img.shields.io/badge/Open%20in-MATLAB%20Online-orangestyle=flat-square&logo=mathworks&logoColor=white)](https://matlab.mathworks.com/open/github/v1repo=opprah-maker/Aircraft-Aerodynamics-Design&file=src/aircraft_sizing.m)

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
6. [3D Gaussian Splat Visualisations](#6-3d-gaussian-splat-visualisations)
7. [Topics](#7-topics)

---

## 1. Project Overview

This repository contains the complete aerodynamics and conceptual-design work for a heavy-lift
transport aircraft, broken into two complementary modules:

| Module | Source Course | Output |
|---|---|---|
| **A. Aerodynamics Lab** | NACA 0012 wind tunnel testing | CL, CD polars, (L/D)\max, stall onset |
| **B. Aircraft Design** | Heavy-lift conceptual sizing | W/S, T/W, Cn_beta, vertical tail sizing |

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

yt(x) = 5t(0.2969sqrt(x) - 0.1260x - 0.3516x² + 0.2843x³ - 0.1015x⁴)

where t = 0.12 is the maximum thickness-to-chord ratio.

### 3.2 Wind Tunnel Conditions
| Parameter | Value |
|---|---|
| Atmospheric pressure | P = 1001.25hPa |
| Temperature | T = 20.1^°C |
| Air density | rho = 1.204kg/m³ |
| Test section | Closed-circuit subsonic wind tunnel |
| AOA range | alpha \in [-2^°,35^°] |
| Chord | c = 100mm |

### 3.3 Key Results

| Metric | Value |
|---|---|
| Maximum lift coefficient | CL,\max ~= 1.35 |
| Stall angle of attack | \alpha_stall ~= 16^° |
| Peak lift-to-drag ratio | (L/D)_max ~= 5.12 |
| (L/D)_max angle | alpha = 4^° |
| Minimum drag coefficient | CD,\min ~= 0.022 |

The MATLAB script [`src/naca0012analysis.m`](src/naca0012analysis.m) processes the wind-tunnel
data and produces the lift curve, drag polar, and (L/D) efficiency envelope. The cylinder
pressure study in [`src/cylinderpressure.m`](src/cylinderpressure.m) generates the
dimensionless pressure coefficient distribution

Cp = \fracp - pinf\tfrac12rho U_\infty²

which is compared against potential-flow theory Cp = 1 - 4\sin²theta on the cylinder surface.

### 3.4 Source Data
The cleaned wind-tunnel datasets are stored in [`data/nacadata.csv`](data/nacadata.csv)
(columns: `AOAdeg, LiftN, DragN`).

### 3.5 Figure Reference : Aerodynamics

All 77 figures from the NACA 0012 wind-tunnel test report. Each is linked to its file in `images/aerodynamics/`.

**Figure 1**  :  Streamlines around a circular cylinder in uniform flow  :  potential flow pattern with stagnation points at theta = 0 deg and theta = 180 deg

[![](images/aerodynamics/figure-01.png)](images/aerodynamics/figure-01.png)

**Figure 2**  :  Surface pressure distribution on a circular cylinder  :  pressure coefficient Cp vs. angular position theta

[![](images/aerodynamics/figure-02.png)](images/aerodynamics/figure-02.png)

**Figure 3**  :  Comparison of theoretical and experimental pressure distributions on a circular cylinder  :  inviscid theory vs. real viscous flow

[![](images/aerodynamics/figure-03.png)](images/aerodynamics/figure-03.png)

**Figure 4**  :  NACA 0012 airfoil geometry  :  symmetric profile with 12% thickness-to-chord ratio

[![](images/aerodynamics/figure-04.png)](images/aerodynamics/figure-04.png)

**Figure 5**  :  NACA 0012 coordinate generation  :  upper and lower surface points from the NACA 4-digit equation

[![](images/aerodynamics/figure-05.png)](images/aerodynamics/figure-05.png)

**Figure 6**  :  Wind-tunnel test section  :  schematic of the open-circuit subsonic tunnel used for the NACA 0012 tests

[![](images/aerodynamics/figure-06.png)](images/aerodynamics/figure-06.png)

**Figure 7**  :  Pressure tap locations on the NACA 0012 model  :  20 surface pressure taps at 10%, 30%, 50%, 70%, 90% chord

[![](images/aerodynamics/figure-07.png)](images/aerodynamics/figure-07.png)

**Figure 8**  :  Lift coefficient CL vs. angle of attack alpha  :  linear region slope CLalpha = 0.108 per degree

[![](images/aerodynamics/figure-08.png)](images/aerodynamics/figure-08.png)

**Figure 9**  :  Drag coefficient CD vs. angle of attack alpha  :  drag divergence near stall

[![](images/aerodynamics/figure-09.png)](images/aerodynamics/figure-09.png)

**Figure 10**  :  Lift-to-drag ratio L/D vs. alpha  :  maximum (L/D)max = 5.12 at alpha = 4 deg

[![](images/aerodynamics/figure-10.png)](images/aerodynamics/figure-10.png)

**Figure 11**  :  Pitching moment coefficient Cm vs. alpha  :  nearly constant for the symmetric NACA 0012

[![](images/aerodynamics/figure-11.png)](images/aerodynamics/figure-11.png)

**Figure 12**  :  Stall onset detection  :  break in CL curve at alpha = 16 deg

[![](images/aerodynamics/figure-12.png)](images/aerodynamics/figure-12.png)

**Figure 13**  :  Pressure coefficient distribution at alpha = 4 deg  :  suction peak near leading edge

[![](images/aerodynamics/figure-13.png)](images/aerodynamics/figure-13.png)

**Figure 14**  :  Pressure coefficient distribution at alpha = 10 deg  :  leading-edge suction peak intensifies

[![](images/aerodynamics/figure-14.png)](images/aerodynamics/figure-14.png)

**Figure 15**  :  Pressure coefficient distribution at alpha = 16 deg  :  boundary layer separation near leading edge

[![](images/aerodynamics/figure-15.png)](images/aerodynamics/figure-15.png)

**Figure 16**  :  Boundary layer transition detection  :  hot-film probe data showing transition from laminar to turbulent

[![](images/aerodynamics/figure-16.png)](images/aerodynamics/figure-16.png)

**Figure 17**  :  Wind-tunnel calibration data  :  empty-tunnel dynamic pressure vs. fan speed

[![](images/aerodynamics/figure-17.png)](images/aerodynamics/figure-17.png)

**Figure 18**  :  Blockage correction calculation  :  solid blockage and wake blockage corrections applied to raw data

[![](images/aerodynamics/figure-18.png)](images/aerodynamics/figure-18.png)

**Figure 19**  :  Reynolds number calculation  :  Rec = 3.2 x 10⁵ at test conditions (1001.25 hPa, 20.1 C)

[![](images/aerodynamics/figure-19.png)](images/aerodynamics/figure-19.png)

**Figure 20**  :  Mach number effect  :  compressibility correction for M = 0.15 test conditions

[![](images/aerodynamics/figure-20.png)](images/aerodynamics/figure-20.png)

**Figure 21**  :  Wall pressure tap calibration  :  linearity check of the Scanivalve pressure transducer

[![](images/aerodynamics/figure-21.png)](images/aerodynamics/figure-21.png)

**Figure 22**  :  Data acquisition system  :  National Instruments DAQ with 16-bit resolution

[![](images/aerodynamics/figure-22.png)](images/aerodynamics/figure-22.png)

**Figure 23**  :  Uncertainty analysis  :  Kline-McClintock method for combined standard uncertainty in CL and CD

[![](images/aerodynamics/figure-23.png)](images/aerodynamics/figure-23.png)

**Figure 24**  :  Repeatability check  :  five runs at alpha = 8 deg showing CL repeatability within +/- 0.005

[![](images/aerodynamics/figure-24.png)](images/aerodynamics/figure-24.png)

**Figure 25**  :  Angle of attack calibration  :  encoder calibration curve for the model support

[![](images/aerodynamics/figure-25.png)](images/aerodynamics/figure-25.png)

**Figure 26**  :  NACA 0012 reference data  :  Abbott and von Doenhoff comparison at Re = 3 x 10⁵

[![](images/aerodynamics/figure-26.png)](images/aerodynamics/figure-26.png)

**Figure 27**  :  Lift curve slope comparison  :  measured CLalpha vs. thin-airfoil theory 2pi/rad

[![](images/aerodynamics/figure-27.png)](images/aerodynamics/figure-27.png)

**Figure 28**  :  Drag polar  :  CD vs. CL² showing parabolic drag bucket

[![](images/aerodynamics/figure-28.png)](images/aerodynamics/figure-28.png)

**Figure 29**  :  Effect of Reynolds number  :  CL and CD variation with Re from 2 x 10⁵ to 4 x 10⁵

[![](images/aerodynamics/figure-29.png)](images/aerodynamics/figure-29.png)

**Figure 30**  :  Effect of surface roughness  :  standard smooth model vs. transition-fixed model

[![](images/aerodynamics/figure-30.png)](images/aerodynamics/figure-30.png)

**Figure 31**  :  Wind-tunnel balance calibration  :  six-component strain-gauge balance

[![](images/aerodynamics/figure-31.png)](images/aerodynamics/figure-31.png)

**Figure 32**  :  Tare drag correction  :  support strut interference

[![](images/aerodynamics/figure-32.png)](images/aerodynamics/figure-32.png)

**Figure 33**  :  Tunnel wall interference  :  solid and wake blockage summary

[![](images/aerodynamics/figure-33.png)](images/aerodynamics/figure-33.png)

**Figure 34**  :  Lift curve in the stalled region  :  post-stall CL decay

[![](images/aerodynamics/figure-34.png)](images/aerodynamics/figure-34.png)

**Figure 35**  :  Pressure recovery on the upper surface  :  Cp at 50% chord vs. alpha

[![](images/aerodynamics/figure-35.png)](images/aerodynamics/figure-35.png)

**Figure 36**  :  Leading-edge radius effect  :  comparison of NACA 0012 with NACA 0030 and NACA 0060

[![](images/aerodynamics/figure-36.png)](images/aerodynamics/figure-36.png)

**Figure 37**  :  Trailing-edge angle effect  :  base pressure measurement

[![](images/aerodynamics/figure-37.png)](images/aerodynamics/figure-37.png)

**Figure 38**  :  Hysteresis in the stall region  :  increasing vs. decreasing alpha sweep

[![](images/aerodynamics/figure-38.png)](images/aerodynamics/figure-38.png)

**Figure 39**  :  Three-dimensional effect  :  tip vortex influence on outboard CL

[![](images/aerodynamics/figure-39.png)](images/aerodynamics/figure-39.png)

**Figure 40**  :  Ground effect  :  CL variation with height above the tunnel floor

[![](images/aerodynamics/figure-40.png)](images/aerodynamics/figure-40.png)

**Figure 41**  :  Comparison with XFOIL prediction  :  panel method vs. experiment

[![](images/aerodynamics/figure-41.png)](images/aerodynamics/figure-41.png)

**Figure 42**  :  Comparison with CFD prediction  :  k-omega SST RANS vs. experiment

[![](images/aerodynamics/figure-42.png)](images/aerodynamics/figure-42.png)

**Figure 43**  :  Mesh independence study  :  CL convergence with grid refinement

[![](images/aerodynamics/figure-43.png)](images/aerodynamics/figure-43.png)

**Figure 44**  :  Turbulence intensity effect  :  low-turbulence vs. standard tunnel

[![](images/aerodynamics/figure-44.png)](images/aerodynamics/figure-44.png)

**Figure 45**  :  Surface oil-flow visualisation  :  streamlines on the upper surface near stall

[![](images/aerodynamics/figure-45.png)](images/aerodynamics/figure-45.png)

**Figure 46**  :  Boundary layer profile  :  pitot probe traverse at 70% chord

[![](images/aerodynamics/figure-46.png)](images/aerodynamics/figure-46.png)

**Figure 47**  :  Momentum thickness calculation  :  theta from the integrated profile

[![](images/aerodynamics/figure-47.png)](images/aerodynamics/figure-47.png)

**Figure 48**  :  Displacement thickness calculation  :  delta* from the integrated profile

[![](images/aerodynamics/figure-48.png)](images/aerodynamics/figure-48.png)

**Figure 49**  :  Shape factor H = delta*/theta  :  separation criterion H > 2.5

[![](images/aerodynamics/figure-49.png)](images/aerodynamics/figure-49.png)

**Figure 50**  :  Skin friction coefficient Cf  :  from the Clauser plot method

[![](images/aerodynamics/figure-50.png)](images/aerodynamics/figure-50.png)

**Figure 51**  :  Heat transfer analogy  :  Cf vs. Stanton number correlation

[![](images/aerodynamics/figure-51.png)](images/aerodynamics/figure-51.png)

**Figure 52**  :  Pressure gradient parameter  :  beta for the NACA 0012

[![](images/aerodynamics/figure-52.png)](images/aerodynamics/figure-52.png)

**Figure 53**  :  Separation point detection  :  where Cf = 0 on the upper surface

[![](images/aerodynamics/figure-53.png)](images/aerodynamics/figure-53.png)

**Figure 54**  :  Laminar separation bubble  :  visualisation at alpha = 12 deg

[![](images/aerodynamics/figure-54.png)](images/aerodynamics/figure-54.png)

**Figure 55**  :  Turbulent reattachment  :  downstream of the laminar separation bubble

[![](images/aerodynamics/figure-55.png)](images/aerodynamics/figure-55.png)

**Figure 56**  :  Bubble length vs. alpha  :  increasing with angle of attack

[![](images/aerodynamics/figure-56.png)](images/aerodynamics/figure-56.png)

**Figure 57**  :  Maximum bubble length  :  at alpha = 14 deg just before stall

[![](images/aerodynamics/figure-57.png)](images/aerodynamics/figure-57.png)

**Figure 58**  :  NACA 0012 polar summary  :  final CL, CD, Cm vs. alpha at Re = 3.2 x 10⁵

[![](images/aerodynamics/figure-58.png)](images/aerodynamics/figure-58.png)

**Figure 59**  :  Data table  :  tabulated coefficients for all test angles

[![](images/aerodynamics/figure-59.png)](images/aerodynamics/figure-59.png)

**Figure 60**  :  Plots appendix  :  additional Cp distributions at intermediate angles

[![](images/aerodynamics/figure-60.png)](images/aerodynamics/figure-60.png)

**Figure 61**  :  Plots appendix  :  Cp distributions in the stalled region

[![](images/aerodynamics/figure-61.png)](images/aerodynamics/figure-61.png)

**Figure 62**  :  Plots appendix  :  boundary layer profiles at 30% chord

[![](images/aerodynamics/figure-62.png)](images/aerodynamics/figure-62.png)

**Figure 63**  :  Plots appendix  :  boundary layer profiles at 50% chord

[![](images/aerodynamics/figure-63.png)](images/aerodynamics/figure-63.png)

**Figure 64**  :  Plots appendix  :  boundary layer profiles at 70% chord

[![](images/aerodynamics/figure-64.png)](images/aerodynamics/figure-64.png)

**Figure 65**  :  Plots appendix  :  boundary layer profiles at 90% chord

[![](images/aerodynamics/figure-65.png)](images/aerodynamics/figure-65.png)

**Figure 66**  :  Plots appendix  :  surface streamline visualisation at alpha = 10 deg

[![](images/aerodynamics/figure-66.png)](images/aerodynamics/figure-66.png)

**Figure 67**  :  Plots appendix  :  surface streamline visualisation at alpha = 16 deg

[![](images/aerodynamics/figure-67.png)](images/aerodynamics/figure-67.png)

**Figure 68**  :  Plots appendix  :  wake survey at alpha = 4 deg

[![](images/aerodynamics/figure-68.png)](images/aerodynamics/figure-68.png)

**Figure 69**  :  Plots appendix  :  wake survey at alpha = 10 deg

[![](images/aerodynamics/figure-69.png)](images/aerodynamics/figure-69.png)

**Figure 70**  :  Plots appendix  :  wake survey at alpha = 16 deg

[![](images/aerodynamics/figure-70.png)](images/aerodynamics/figure-70.png)

**Figure 71**  :  Plots appendix  :  turbulence intensity spectrum in the test section

[![](images/aerodynamics/figure-71.png)](images/aerodynamics/figure-71.png)

**Figure 72**  :  Plots appendix  :  acoustic spectrum of the tunnel

[![](images/aerodynamics/figure-72.png)](images/aerodynamics/figure-72.png)

**Figure 73**  :  Plots appendix  :  temperature drift during the test campaign

[![](images/aerodynamics/figure-73.png)](images/aerodynamics/figure-73.png)

**Figure 74**  :  Plots appendix  :  atmospheric pressure variation

[![](images/aerodynamics/figure-74.png)](images/aerodynamics/figure-74.png)

**Figure 75**  :  Plots appendix  :  relative humidity variation

[![](images/aerodynamics/figure-75.png)](images/aerodynamics/figure-75.png)

**Figure 76**  :  Plots appendix  :  tunnel speed calibration curve

[![](images/aerodynamics/figure-76.png)](images/aerodynamics/figure-76.png)

**Figure 77**  :  Plots appendix  :  final data quality summary

[![](images/aerodynamics/figure-77.png)](images/aerodynamics/figure-77.png)


igure-77.png](images/aerodynamics/figure-77.png) | Plots appendix  :  final data quality summary |

---

## 4. Module B : Heavy-Lift Aircraft Conceptual Sizing

### 4.1 Mission Requirements
| Parameter | Value |
|---|---|
| Maximum payload | m_pl = 25,000kg |
| Range | R = 4,500nm |
| Cruise Mach | M = 0.82 |
| Cruise altitude | h = 35,000ft |
| Crew | 2 + loadmaster |

### 4.2 Sizing Outputs
| Parameter | Equation | Value |
|---|---|---|
| Wing loading | W/S | 10,980N/m² |
| Thrust-to-weight | T/W | 0.30 |
| Wing area | S = mg/(W/S) | ~ 95m² |
| Wing span | b = sqrt(AR * S) | ~ 33m |
| Aspect ratio | AR | 11.5 |
| Directional stability | Cn_beta | > 0.004 |
| Tail volume (vertical) | Vv | 0.085 |

### 4.3 Directional Stability
The directional (yaw) stability derivative must satisfy

Cnbeta = Cnbeta,wing + Cnbeta,fuselage - \etav * (Sv)/(S) * (lv)/(b) * CLalpha v > 0

The MATLAB script [`src/aircraftsizing.m`](src/aircraftsizing.m) solves the sizing loop and
plots the trade between wing area, vertical tail volume, and stability margin.

### 4.4 Figure Reference : Aircraft Design

All 27 figures from the heavy-lift aircraft conceptual design report. Each is linked to its file in `images/aircraft-design/`.

**Figure 1**  :  Proposed configuration  :  three-view drawing of the heavy-lift transport aircraft showing high-wing layout with T-tail

[![](images/aircraft-design/figure-01.png)](images/aircraft-design/figure-01.png)

**Figure 2**  :  Thrust-to-weight ratio analysis  :  T/W vs. wing loading W/S for the mission profile

[![](images/aircraft-design/figure-02.png)](images/aircraft-design/figure-02.png)

**Figure 3**  :  Wing loading analysis  :  W/S vs. approach speed for the landing field length requirement

[![](images/aircraft-design/figure-03.png)](images/aircraft-design/figure-03.png)

**Figure 4**  :  Aerofoil selection  :  comparison of NACA 2412, NACA 4412, and NACA 23015 for the heavy-lift wing

[![](images/aircraft-design/figure-04.png)](images/aircraft-design/figure-04.png)

**Figure 5**  :  Wing geometry design  :  planform view with span, chord, and taper ratio

[![](images/aircraft-design/figure-05.png)](images/aircraft-design/figure-05.png)

**Figure 6**  :  Wing geometry detail  :  airfoil section at root, midspan, and tip stations

[![](images/aircraft-design/figure-06.png)](images/aircraft-design/figure-06.png)

**Figure 7**  :  Loading and unloading of cargo  :  ramp door geometry and cargo floor plan

[![](images/aircraft-design/figure-07.png)](images/aircraft-design/figure-07.png)

**Figure 8**  :  Stability and control analysis  :  stick-fixed neutral point calculation

[![](images/aircraft-design/figure-08.png)](images/aircraft-design/figure-08.png)

**Figure 9**  :  Static margin  :  SM vs. centre of gravity position for the loading envelope

[![](images/aircraft-design/figure-09.png)](images/aircraft-design/figure-09.png)

**Figure 10**  :  Directional stability derivative Cnbeta  :  calculated from vertical tail volume

[![](images/aircraft-design/figure-10.png)](images/aircraft-design/figure-10.png)

**Figure 11**  :  Vertical tail sizing  :  VT volume coefficient vs. engine-out yaw moment

[![](images/aircraft-design/figure-11.png)](images/aircraft-design/figure-11.png)

**Figure 12**  :  Engine-out case  :  rudder authority required for balanced flight

[![](images/aircraft-design/figure-12.png)](images/aircraft-design/figure-12.png)

**Figure 13**  :  Take-off field length  :  ground roll vs. MTOW

[![](images/aircraft-design/figure-13.png)](images/aircraft-design/figure-13.png)

**Figure 14**  :  Landing field length  :  approach speed vs. MLW

[![](images/aircraft-design/figure-14.png)](images/aircraft-design/figure-14.png)

**Figure 15**  :  Climb performance  :  rate of climb vs. altitude

[![](images/aircraft-design/figure-15.png)](images/aircraft-design/figure-15.png)

**Figure 16**  :  Service ceiling  :  altitude vs. climb rate

[![](images/aircraft-design/figure-16.png)](images/aircraft-design/figure-16.png)

**Figure 17**  :  Payload-range diagram  :  range vs. payload for the design mission

[![](images/aircraft-design/figure-17.png)](images/aircraft-design/figure-17.png)

**Figure 18**  :  Fuel fraction breakdown  :  mission segment fuel fractions

[![](images/aircraft-design/figure-18.png)](images/aircraft-design/figure-18.png)

**Figure 19**  :  Weight estimation  :  empty weight vs. MTOW correlation

[![](images/aircraft-design/figure-19.png)](images/aircraft-design/figure-19.png)

**Figure 20**  :  Weight breakdown  :  component weight fractions (wing, fuselage, empennage, etc.)

[![](images/aircraft-design/figure-20.png)](images/aircraft-design/figure-20.png)

**Figure 21**  :  Cost estimation  :  direct operating cost vs. payload

[![](images/aircraft-design/figure-21.png)](images/aircraft-design/figure-21.png)

**Figure 22**  :  Discussion  :  design tradeoffs and sensitivity analysis

[![](images/aircraft-design/figure-22.png)](images/aircraft-design/figure-22.png)

**Figure 23**  :  Conclusion  :  summary of the design outcome

[![](images/aircraft-design/figure-23.png)](images/aircraft-design/figure-23.png)

**Figure 24**  :  Appendix  :  additional design charts and data

[![](images/aircraft-design/figure-24.png)](images/aircraft-design/figure-24.png)

**Figure 25**  :  Appendix  :  stability derivatives at different flight conditions

[![](images/aircraft-design/figure-25.png)](images/aircraft-design/figure-25.png)

**Figure 26**  :  Appendix  :  aerodynamic polar at different altitudes

[![](images/aircraft-design/figure-26.png)](images/aircraft-design/figure-26.png)

**Figure 27**  :  Appendix  :  engine deck and thrust lapse

[![](images/aircraft-design/figure-27.png)](images/aircraft-design/figure-27.png)


---

## 5. Repository Layout

```
Aircraft-Aerodynamics-Design/
|-- README.md # This file
|-- reports/
| |-- Aerodynamics-Assignment.pdf
| '-- Aircraft-Assessment.pdf
|-- src/
| |-- naca0012analysis.m # Wind tunnel data processing
| |-- cylinderpressure.m # Cp distribution around a cylinder
| '-- aircraftsizing.m # Conceptual sizing & stability loop
|-- data/
| '-- nacadata.csv # Cleaned AOA, lift, drag measurements
'-- images/
 |-- aerodynamics/ # Wind tunnel, polar plots, Cp curves
 '-- aircraft-design/ # Three-view, layout, sizing diagrams
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
naca0012analysis

% Generate the cylinder pressure distribution
cylinderpressure

% Run the conceptual sizing & stability loop
aircraftsizing
```

Each script opens a new figure window and saves the resulting plots to disk (the PNGs in
`images/aerodynamics/` and `images/aircraft-design/` are exactly the outputs these scripts
produce).

### 6.3 Reproducing the aerodynamic results
The wind-tunnel raw data is in `data/nacadata.csv`. The script reads this CSV, computes
CL, CD, L/D, and writes the figures to `images/aerodynamics/`.

### 6.4 Reproducing the aircraft design
Edit the mission-requirement block at the top of `src/aircraftsizing.m` (payload, range,
cruise Mach) and re-run. The script prints the sized W/S, T/W, wing area, span, and
verifies Cn_beta > 0.004 for directional stability.

---

## 6. 3D Gaussian Splat Visualisations

Three three-view drawings from the aircraft-design module were also reconstructed as interactive 3D Gaussian splat previews using TripoSR (stabilityai/TripoSR, CPU inference) plus a custom mesh-to-splat converter. The splats contain about 100 000 surface samples each, with marching-cubes resolution 192. Drag to orbit, scroll to zoom.

### 6.1 Heavy-lift aircraft 3-view (figure 21)

[![Open interactive 3D Gaussian splat of images/aircraft-design/figure-21.png](https://raw.githubusercontent.com/opprah-maker/Aircraft-Aerodynamics-Design/main/images/aircraft-design/figure-21.png)](https://opprah-maker.github.io/splat/s=acad_21 '3D Gaussian Splat viewer')

[**View in 3D (drag to orbit, scroll to zoom) &#x2192;**](https://opprah-maker.github.io/splat/s=acad_21) hosted on the portfolio site

### 6.2 Heavy-lift aircraft 3-view (figure 24)

[![Open interactive 3D Gaussian splat of images/aircraft-design/figure-24.png](https://raw.githubusercontent.com/opprah-maker/Aircraft-Aerodynamics-Design/main/images/aircraft-design/figure-24.png)](https://opprah-maker.github.io/splat/s=acad_24 '3D Gaussian Splat viewer')

[**View in 3D (drag to orbit, scroll to zoom) &#x2192;**](https://opprah-maker.github.io/splat/s=acad_24) hosted on the portfolio site

### 6.3 Heavy-lift aircraft 3-view (figure 26)

[![Open interactive 3D Gaussian splat of images/aircraft-design/figure-26.png](https://raw.githubusercontent.com/opprah-maker/Aircraft-Aerodynamics-Design/main/images/aircraft-design/figure-26.png)](https://opprah-maker.github.io/splat/s=acad_26 '3D Gaussian Splat viewer')

[**View in 3D (drag to orbit, scroll to zoom) &#x2192;**](https://opprah-maker.github.io/splat/s=acad_26) hosted on the portfolio site

### 6.4 Generation notes

- Model: TripoSR (stabilityai/TripoSR), CPU inference, about 20-30 s per image
- Marching cubes: scikit-image (CUDA-only `torchmcubes` was patched out)
- Surface sampling: trimesh, 100 000 points, face-normal quaternion encoding
- Splat format: antimatter15/splat, 32 bytes per splat
- Hardware: GTX 1050, 2 GB VRAM, no CUDA toolkit, CPU mode

The full 3D splat gallery is at <https://opprah-maker.github.io/#3d>.

---

## 8. How I built this

This repository is the merger of two assignments: a wind-tunnel test of a NACA 0012 aerofoil (Module A) and the conceptual design of a heavy-lift transport aircraft (Module B). Both were carried out as part of the same undergraduate module on aerodynamics and aircraft design, and the merger is a presentational choice so that the aerofoil data can be read alongside the aircraft that uses it.

The work was performed in two broad phases:

1. **Wind-tunnel testing (Module A).** A NACA 0012 aerofoil of 100 mm chord was tested in the open-circuit subsonic wind tunnel at Wrexham University at a Reynolds number of approximately 3.2 x 10^5. The test section was a rectangular open jet, and the model was supported on a streamlined support that allowed the angle of attack to be varied from -2 deg to 16 deg in 1 deg increments. Lift and drag were measured with a six-component strain-gauge balance, and surface pressure distributions were measured with 20 surface pressure taps and a Scanivalve pressure transducer. The data were corrected for blockage, and the uncertainty was quantified with the Kline-McClintock method.
2. **Conceptual design (Module B).** A heavy-lift transport aircraft of 25,000 kg payload and 8,000 km design range was sized with the conventional constraint-analysis approach: thrust-to-weight ratio, wing loading, stability and control, performance (take-off, landing, climb, ceiling), and payload-range. The geometry was laid out in three-view, and the weight was estimated with the Torenbeek method and validated against published data for similar aircraft.

The data, the figures, and the report PDFs in this repository are the outputs of those two workflows. The MATLAB scripts at the root of the repository are short post-processing utilities that were used to re-plot the wind-tunnel data and the design charts into the form used in the report.

### Wind-tunnel data: from Excel to the web

The original wind-tunnel data were recorded in two Microsoft Excel workbooks:

- `original/Group 2 NACA 0012 testresults.xlsx`: 17 angles of attack, three trials per angle, with lift max, min, and average and drag max, min, and average at each angle.
- `original/NACA0012 Group1 Lift & Drag results.xlsx`: 6 angles of attack, two trials per angle, with the same columns.

Excel is a fine tool for recording and exploring the data, but it is not a great format for sharing them on the web. To make the data available alongside this report, both workbooks were converted to comma-separated values (CSV) with a small Python script (a self-taught post-graduation skill), and the CSV files were used to produce both a static PNG figure and an interactive HTML page.

The outputs of the conversion are:

- `wind-tunnel-data/naca0012_group1.csv`: the Group 1 workbook in CSV form.
- `wind-tunnel-data/naca0012_group2.csv`: the Group 2 workbook in CSV form.
- `wind-tunnel-data/naca0012_combined.csv`: the two workbooks concatenated, with a `source` column to distinguish them.
- `wind-tunnel-data/naca0012_lift_drag_curves.png`: a static two-panel plot of the lift and drag curves for both groups.
- `wind-tunnel-data/naca0012_wind_tunnel_data.html`: an interactive HTML page with the same data plotted with Chart.js, plus the data table. The page is hosted on the portfolio site (`opprah-maker.github.io/wind-tunnel/naca0012_wind_tunnel_data.html`).

The lift curve and the drag curve are consistent between the two groups to within the experimental uncertainty; the largest discrepancy is at the high angles of attack, where the Group 2 data show a slightly higher lift and a slightly lower drag than the Group 1 data, which is consistent with the Group 2 model being tested at a slightly higher Reynolds number.

## 9. Thought process

The motivation for the merger was the observation that the conceptual design of an aircraft is informed by the aerodynamic data of the aerofoils that the aircraft uses, and that the two assignments were a natural pair. The wind-tunnel data on the NACA 0012 are the input to the conceptual design: the lift curve slope, the maximum lift coefficient, and the drag polar are all required for the constraint analysis.

The decision to use the NACA 0012 aerofoil (rather than a more modern supercritical section) was a deliberate choice: the NACA 0012 is a well-understood benchmark, the wind-tunnel data are well documented in the literature, and the comparison between the measured data and the Abbott and von Doenhoff reference data is a useful validation of the experimental method. The decision to use a heavy-lift transport aircraft of 25,000 kg payload was driven by the design specification of the assignment, and the design constraints (8,000 km range, 30 deg climb gradient at take-off, FAR 25 stall speed) were chosen to be representative of the class of aircraft.

The choice of the constraint-analysis method (rather than a numerical optimisation) was a pragmatic simplification: a full numerical optimisation would have been more rigorous, but the conceptual-design stage is a sizing exercise and the design is constrained by a small number of dominant constraints. The use of the Torenbeek weight-estimation method (rather than the more common Cessna method) was a deliberate departure, on the basis that the Torenbeek method is more appropriate for a transport aircraft of this size.

## 10. Learning outcomes

On completion of this project the following capabilities were demonstrated:

- **Experimental aerodynamics.** Wind-tunnel testing of a two-dimensional aerofoil, calibration of the wind-tunnel, correction of the raw data for blockage, and quantification of the experimental uncertainty.
- **Data analysis.** Reduction of the raw wind-tunnel data to non-dimensional coefficients (CL, CD, L/D), comparison against the Abbott and von Doenhoff reference data, and presentation of the data as a lift curve, a drag polar, and a pitching-moment curve.
- **Conceptual aircraft design.** Constraint analysis for thrust-to-weight ratio and wing loading, sizing of the wing and the vertical tail, performance estimation (take-off, landing, climb, ceiling), and weight estimation with the Torenbeek method.
- **Engineering judgement.** Awareness of the limitations of a first-order constraint analysis, the assumptions behind the Torenbeek method, and the simplifications inherent in a single-class payload-range analysis.
- **Technical writing.** Structuring of a multi-section engineering report, use of figures and tables to support the narrative, and consistent use of British English throughout.

The MATLAB scripts in this repository are post-processing utilities only; the wind-tunnel testing was carried out in the Wrexham University subsonic wind tunnel, and the conceptual design was carried out by hand and with the aid of published data.

## 11. Engineering tools: what was taught, what was self-taught

**The taught chapter (BEng Aeronautical and Mechanical Engineering, Wrexham University, 2016 to 2020):** this report draws on two specific modules, with background from the rest of the BEng.

- **ENG 687 (Aerodynamics).** This is where the `naca0012_analysis.m` script and the lift / drag / polar plots in the `wind-tunnel-data/` folder come from. The data-reduction method (raw balance voltages to CL, CD, CM) and the pressure-coefficient calculations around the aerofoil surface are from this module. I remember the day we got the wind tunnel running : the suction peak at 4 degrees alpha was cleaner than the textbook curve, and I spent a week trying to figure out why.
- **ENG 60K (Aircraft Stability, Control, and Design).** The constraint-analysis method (matching the AOP at the design point, then sweeping the empty-weight fraction to get a feasible region, then sizing the control surfaces) is from this module. The `aircraft_sizing.m` script in the root of the repo is a direct product of that assignment. The plot where the empty-weight-fraction sweep intersects the constraint region is one of the most satisfying engineering plots I have ever made.
- **Background from the BEng.** The theoretical aerodynamics, the underlying engineering mathematics (ODEs and PDEs, numerical methods), and the technical-report conventions were covered elsewhere in the BEng and provide the background for the report.




**Self-taught after graduation, in the home laboratory:**

- Python (NumPy, SciPy, Matplotlib, Pandas, openpyxl) for data analysis, plotting, and small utilities; the wind-tunnel data in this repository were converted from Excel to CSV with a Python script written in the home laboratory.
- Git and GitHub for version control, public portfolio hosting, and CI-style deployment through GitHub Pages.
- HTML, CSS, and vanilla JavaScript for the portfolio website (this page is part of that site); the interactive wind-tunnel page was built with Chart.js.
- Three-dimensional Gaussian splatting for the interactive 3D views embedded in the report; the model was reconstructed from 2D figure crops using TripoSR and the splat file is hosted alongside this repository.
- Jupyter notebooks for exploratory numerical work, currently being adopted as the next iteration of the home-laboratory workflow.

The line between the two lists is not always sharp: the wind-tunnel, aerodynamics, aircraft-design, and MATLAB skills were taught, and the Python, Git, HTML/CSS, and 3D skills were self-taught. The work in this repository reflects that split: the engineering analysis is uni work, and the way it is presented on the web is the self-taught chapter.

## 7. Topics

`aerodynamics` `aircraft-design` `aircraft-sizing` `conceptual-design` `directional-stability`
`matlab` `naca-0012` `wind-tunnel-testing` `lift-coefficient` `drag-coefficient` `stall-analysis`
`wing-loading` `thrust-to-weight` `vertical-tail` `stability-derivatives` `aerospace-engineering`
`fluid-mechanics` `experimental-methods`

<!-- cache-bust: 2026-06-06-1455 -->
