% General Physics Project: Sliding and Rolling on a Circular Track
% Numerical Integration for Shortest Descent Time (Eq. 18)

clear; clc; close all;

%% 1. Parameter Setup
g = 9.8;             % Gravitational acceleration (m/s^2)
delta_h = 1.0;       % Fixed height drop (m)
mu_values = [0, 0.1, 0.3, 0.5]; % Friction coefficients
% Array of final angles Theta (rad). Avoiding very small angles near 0 
% because R = delta_h / (1 - cos(Theta)) approaches infinity.
Theta_array = linspace(pi/4, pi, 100); 

%% 2. Plot Setup
figure('Name', 'Descent Time vs Final Angle', 'Position', [150, 150, 700, 500]);
hold on;
grid on;

%% 3. Numerical Integration Loop
for i = 1:length(mu_values)
    mu = mu_values(i);
    T_array = zeros(size(Theta_array)); % Array to store descent times

    for j = 1:length(Theta_array)
        Theta = Theta_array(j);

        % Calculate required Radius R for the fixed height drop
        R = delta_h / (1 - cos(Theta));

        % Define the velocity squared function (Eq. 5)
        % Using anonymous function for numerical integration
        v2_func = @(th) (2 * g * R / (4 * mu^2 + 1)) .* ...
            (mu .* sin(th) - (1 + 2 * mu^2) .* cos(th) + (1 + 2 * mu^2) .* exp(-2 .* mu .* th));

        % Define the integrand: R / v(th)
        % max(v2, 1e-10) is used to prevent division by zero at th = 0
        integrand = @(th) R ./ sqrt(max(v2_func(th), 1e-10));

        % Perform numerical integration from 0 to Theta
        T_array(j) = integral(integrand, 0, Theta, 'ArrayValued', true);
    end

    % Plot the Time vs Theta curve
    plot(Theta_array, T_array, 'LineWidth', 2, 'DisplayName', sprintf('\\mu = %.1f', mu));

    % Find and mark the minimum descent time (Optimal Angle Theta*)
    [min_T, min_idx] = min(T_array);
    opt_Theta = Theta_array(min_idx);

    % Mark the minimum point with a circle
    plot(opt_Theta, min_T, 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'auto', 'HandleVisibility', 'off');

    % Print the result to the console
    fprintf('Friction mu = %.1f -> Optimal Theta: %.2f rad (%.1f deg), Min Time: %.3f s\n', ...
        mu, opt_Theta, rad2deg(opt_Theta), min_T);
end

%% 4. Formatting the Plot for the Report
title('Descent Time (T) vs. Final Angle (\Theta) for Fixed Height Drop', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Final Angle \Theta (rad)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Descent Time T (s)', 'FontSize', 12, 'FontWeight', 'bold');

legend('show', 'Location', 'northeast', 'FontSize', 12);


% Format X-axis ticks to show pi units
xticks([pi/4, pi/2, 3*pi/4, pi]);
xticklabels({'\pi/4', '\pi/2', '3\pi/4', '\pi'});
xlim([pi/4, pi]);

set(gca, 'FontSize', 12, 'LineWidth', 1.2);
hold off;