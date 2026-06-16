% General Physics Project: Sliding and Rolling on a Circular Track
% Energy Dissipation Analysis (Eq. 15)

clear; clc; close all;

%% 1. Parameter Setup
m = 0.5;        % Mass of the object (kg)
g = 9.8;        % Gravitational acceleration (m/s^2)
R = 1.0;        % Track radius (m)
theta = linspace(0, pi, 1000); % Angle \theta: 0 to \pi
mu_values = [0, 0.1, 0.3, 0.5]; % Friction coefficients

%% 2. Plot Setup
figure('Name', 'Energy Dissipation vs. Angle', 'Position', [250, 250, 700, 500]);
hold on;
grid on;

%% 3. Calculate and Plot Energy Loss
for i = 1:length(mu_values)
    mu = mu_values(i);

    % Calculate v^2(\theta) using Eq. 5
    term1 = mu * sin(theta);
    term2 = (1 + 2 * mu^2) * cos(theta);
    term3 = (1 + 2 * mu^2) * exp(-2 * mu * theta);
    v_squared = (2 * g * R / (4 * mu^2 + 1)) * (term1 - term2 + term3);

    % Calculate Total Energy Loss \Delta E(\theta) using Eq. 15
    % \Delta E(\theta) = mgR(1 - cos\theta) - 0.5 * m * v^2(\theta)
    delta_E = m * g * R * (1 - cos(theta)) - 0.5 * m * v_squared;

    plot(theta, delta_E, 'LineWidth', 2, 'DisplayName', sprintf('\\mu = %.1f', mu));
end

%% 4. Formatting the Plot for the Report
title('Energy Dissipation (\DeltaE) vs. Angle due to Friction', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Angle \theta (rad)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Energy Loss \DeltaE (J)', 'FontSize', 12, 'FontWeight', 'bold');

legend('show', 'Location', 'northwest', 'FontSize', 12);

% Format X-axis ticks
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi'});
xlim([0, pi]);

% Set Y-axis lower limit to 0
ylim([0, max(ylim)*1.1]); 

set(gca, 'FontSize', 12, 'LineWidth', 1.2);
hold off;