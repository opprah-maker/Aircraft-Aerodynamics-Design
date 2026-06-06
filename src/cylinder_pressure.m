% MATLAB Script: Cylinder Pressure Distribution (Theoretical vs Experimental)

% Angular position (degrees)
theta_deg = [0; 30; 60; 90; 120; 150];
theta_rad = deg2rad(theta_deg);

% Surface static pressure measurements (Pa)
P_surface = [62323; 61408; 62846; 61208; 58946; 61431];

% Experimental parameters (assumed values based on wind tunnel setup)
P_inf = 61208;      % Freestream static pressure (Pa) at 90 degrees
q_inf = 1115;       % Dynamic pressure (Pa)

% Calculate Experimental Cp
Cp_exp = (P_surface - P_inf) / q_inf;

% Calculate Theoretical Cp (Inviscid Flow)
theta_fine = 0:0.01:pi;
Cp_theory = 1 - 4 * sin(theta_fine).^2;

% Plot comparison
figure;
plot(theta_fine * (180/pi), Cp_theory, 'r-', 'LineWidth', 2);
hold on;
plot(theta_deg, Cp_exp, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b', 'LineWidth', 2);
xlabel('Angular Position (\theta, degrees)');
ylabel('Pressure Coefficient (C_p)');
title('Pressure Distribution around a Circular Cylinder: Theoretical vs Experimental');
legend('Theoretical (Inviscid)', 'Experimental (Wind Tunnel)', 'Location', 'south');
grid on;
saveas(gcf, 'cylinder_pressure_distribution.png');

disp('Cylinder pressure analysis complete. Plot saved as cylinder_pressure_distribution.png');
