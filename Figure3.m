% General Physics Project: Sliding and Rolling on a Circular Track
% Experiment 2: Transition from Pure Rolling to Sliding (Eq. 13)

clear; clc; close all;

%% 1. Parameter Setup
theta = linspace(0, pi, 1000); % Angle from 0 to pi
mu_s_actual = 0.2; % Example: Actual static friction coefficient of the track

%% 2. Calculate Required Static Friction Coefficient
% For pure rolling, required friction f = (2/7)*mg*sin(theta)
% Normal force N = mg*cos(theta) + m*(v^2)/R
% Substitute v^2 = (10/7)*g*R*(1 - cos(theta)) into N
% Required mu_s = f / N = 2*sin(theta) / (10 - 3*cos(theta))

mu_s_required = (2 .* sin(theta)) ./ (10 - 3 .* cos(theta));

%% 3. Plot Setup
figure('Name', 'Rolling to Sliding Transition', 'Position', [200, 200, 700, 500]);
hold on;
grid on;

%% 4. Plot Required vs Actual Friction
% Plot required mu_s curve
plot(theta, mu_s_required, 'b-', 'LineWidth', 2, 'DisplayName', 'Required \mu_s for Pure Rolling');

% Plot actual surface mu_s as a horizontal line
yline(mu_s_actual, 'r--', 'LineWidth', 2, 'DisplayName', sprintf('Actual Surface \\mu_s = %.2f', mu_s_actual));

% Find the transition point (where required > actual friction)
transition_idx = find(mu_s_required > mu_s_actual, 1);

if ~isempty(transition_idx)
    trans_theta = theta(transition_idx);

    % Mark the transition point
    plot(trans_theta, mu_s_actual, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Transition Point (Starts Sliding)');

    % Print result to console
    fprintf('Transition from pure rolling to sliding occurs at Theta: %.2f rad (%.1f deg)\n', trans_theta, rad2deg(trans_theta));

    % Highlight the region where sliding occurs
    patch_x = [trans_theta, pi, pi, trans_theta];
    patch_y = [0, 0, max(mu_s_required)*1.1, max(mu_s_required)*1.1];
    patch(patch_x, patch_y, 'red', 'FaceAlpha', 0.1, 'EdgeColor', 'none', 'DisplayName', 'Sliding Region');
else
    disp('The ball rolls purely without sliding for the entire track.');
end

%% 5. Formatting the Plot for the Report
title('Transition Condition: Pure Rolling to Sliding', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Angle \Theta (rad)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Static Friction Coefficient \mu_s', 'FontSize', 12, 'FontWeight', 'bold');

legend('show', 'Location', 'northwest', 'FontSize', 12);

% Format X-axis ticks
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi'});
xlim([0, pi]);
ylim([0, max(mu_s_required)*1.2]);

set(gca, 'FontSize', 12, 'LineWidth', 1.2);
hold off;