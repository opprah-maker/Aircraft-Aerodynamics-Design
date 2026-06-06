% MATLAB Script: Conceptual Sizing and Stability Sizing of Heavy-Lift Transport Aircraft
% Target: Transport 800 EELT mirror segments

% --- Design Inputs ---
W_S = 10980;      % Wing Loading (N/m^2)
T_W = 0.30;       % Thrust-to-Weight Ratio
mass_max = 250000; % Maximum Take-Off Mass (kg) (Estimated)
g = 9.81;         % Gravitational acceleration (m/s^2)

% --- Calculations ---
W_total = mass_max * g; % Total Take-Off Weight (N)
S_wing = W_total / W_S; % Required Wing Area (m^2)
Thrust_req = W_total * T_W; % Total Required Thrust (N)

% --- Aerodynamic Parameters (NACA 652-415) ---
AR = 8.5;         % Aspect Ratio
sweep_deg = 25;   % Sweep Angle (degrees)
b = sqrt(S_wing * AR); % Wing Span (m)
c_mac = S_wing / b;    % Mean Aerodynamic Chord (m)

% --- Directional Stability Sizing (Cn_beta > 0.004) ---
% Cn_beta = C_n_beta_wing_fus + V_v * C_n_beta_v
% Target: V_v (Vertical tail volume coefficient) sizing
V_v_target = 0.06; % Typical heavy cargo aircraft vertical tail volume coefficient
S_v = (V_v_target * S_wing * b) / 30; % Sized Vertical Tail Area (m^2) (assuming tail arm of 30m)

% --- Output Results ---
fprintf('=== Heavy-Lift Aircraft Sizing Results ===\n');
fprintf('Maximum Take-Off Weight: %10.2f kN\n', W_total / 1000);
fprintf('Required Wing Area:      %10.2f m^2\n', S_wing);
fprintf('Total Required Thrust:   %10.2f kN\n', Thrust_req / 1000);
fprintf('Calculated Wing Span:    %10.2f m\n', b);
fprintf('Mean Aerodynamic Chord:  %10.2f m\n', c_mac);
fprintf('Sized Vertical Tail Area:%10.2f m^2\n', S_v);
fprintf('==========================================\n');
