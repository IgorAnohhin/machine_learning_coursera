%% Initialization
clear ; close all; clc

%% ======================= Part 1: Plotting =======================
fprintf('Plotting RegistrationiWithoutDCLocation Data ...\n')
data = load('Lookup.txt');
X = data(:, 1); 
y = data(:, 2);
m = length(y); % number of training examples

% Plot Data
% Note: You have to complete the code in plotData.m
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 2: Gradient descent ===================
fprintf('Running Gradient Descent ...\n')

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations =1;
alpha = 0.0032;

% compute and display initial cost
computeCost(X, y, theta)

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

fprintf('Program paused. Press enter to continue.\n');
pause;

% Predict values for request count of 125,000
predict1 = [1, 120000] *theta;
fprintf('For requests count = 120,000, we predict a milliseconds for last request. %f\n',...
    predict1); % *10000

fprintf('Program paused. Press enter to continue.\n');
pause;

% ==========================================================

