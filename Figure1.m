% General Physics Project: Sliding and Rolling on a Circular Track
% Eq. 5: Visualization of velocity squared (v^2) vs. angle (\theta) for various friction coefficients (\mu)

clear; clc; close all;

%% 1. Parameter Setup
g = 9.8;        % Gravitational acceleration (m/s^2)
R = 1.0;        % Track radius (m) - Set to 1.0m to observe the general trend
theta = linspace(0, pi, 1000); % Angle \theta: 1000 points from 0 to \pi
mu_values = [0, 0.1, 0.3, 0.5]; % Array of kinetic friction coefficients to compare

%% 2. Plot Setup and Calculation Loop
figure('Name', 'Velocity Squared vs. Angle', 'Position', [100, 100, 700, 500]);
hold on;
grid on;

% Calculate and plot v^2 for each friction coefficient (\mu)
for i = 1:length(mu_values)
    mu = mu_values(i);

    % Implementation of Eq. 5
    term1 = mu * sin(theta);
    term2 = (1 + 2 * mu^2) * cos(theta);
    term3 = (1 + 2 * mu^2) * exp(-2 * mu * theta);

    v_squared = (2 * g * R / (4 * mu^2 + 1)) * (term1 - term2 + term3);

    % Plotting (using thicker lines for better readability)
    plot(theta, v_squared, 'LineWidth', 2, 'DisplayName', sprintf('\\mu = %.1f', mu));
end

%% 3. Formatting the Plot for the Report
title('Velocity Squared (v^2) vs. Angle for Various Friction Coefficients', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('\theta (rad)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('v^2 (m^2/s^2)', 'FontSize', 12, 'FontWeight', 'bold');

% Legend setup
legend('show', 'Location', 'northwest', 'FontSize', 12);

% Change X-axis ticks to \pi units for better readability
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi'});
xlim([0, pi]);

% Set Y-axis lower limit to 0 (velocity squared cannot be negative)
ylim([0, max(ylim)]);

set(gca, 'FontSize', 12, 'LineWidth', 1.2);
hold off;