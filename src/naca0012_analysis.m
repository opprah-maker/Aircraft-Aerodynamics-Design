% MATLAB Script: NACA 0012 Wind Tunnel Experimental Data Analysis

% Angle of Attack (degrees)
alpha = [-2; 0; 4; 8; 12; 16; 20];

% Lift and Drag Forces (Newtons)
lift_force = [-2.29; 0.56; 7.67; 10.34; 11.49; 12.64; 10.6];
drag_force = [1.24; 1.3; 1.5; 2.76; 4.08; 5.4; 8.78];

% Calculated Coefficients
C_L = [-0.731; 0.179; 2.453; 3.31; 3.68; 4.048; 3.396];
C_D = [0.396; 0.415; 0.479; 0.882; 1.303; 1.726; 2.805];
L_D = [-1.847; 0.432; 5.122; 3.754; 2.824; 2.346; 1.211];

% --- Plot 1: Lift and Drag Coefficients vs Alpha ---
figure('Name', 'NACA 0012 Coefficients');
yyaxis left
plot(alpha, C_L, '-o', 'LineWidth', 2, 'Color', [0, 0.4470, 0.7410]);
ylabel('Lift Coefficient (C_L)');
grid on;

yyaxis right
plot(alpha, C_D, '-s', 'LineWidth', 2, 'Color', [0.8500, 0.3250, 0.0980]);
ylabel('Drag Coefficient (C_D)');

xlabel('Angle of Attack (\alpha, degrees)');
title('NACA 0012 Aerofoil: Aerodynamic Coefficients vs \alpha');
saveas(gcf, 'lift_drag_coefficients.png');

% --- Plot 2: Lift-to-Drag Ratio vs Alpha ---
figure('Name', 'NACA 0012 L/D Ratio');
plot(alpha, L_D, '-^', 'LineWidth', 2, 'Color', [0.4660, 0.6740, 0.1880]);
xlabel('Angle of Attack (\alpha, degrees)');
ylabel('Lift-to-Drag Ratio (L/D)');
title('NACA 0012 Aerofoil: Lift-to-Drag Ratio vs \alpha');
grid on;
hold on;
xline(4, '--r', 'Peak L/D (\alpha = 4^\circ)');
legend('L/D Ratio', 'Location', 'northeast');
saveas(gcf, 'lift_to_drag_ratio.png');

disp('Simulation complete. Plots saved as lift_drag_coefficients.png and lift_to_drag_ratio.png');
