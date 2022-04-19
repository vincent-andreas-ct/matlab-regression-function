##This file contains code that helps you get started on how
##using the functions for solving linear regression problem.
##    The functions used in this code are:
##    gradient_des.m
##    calc_cost.m
##    normal_equation.m (additional, using normal equation to 
##                       analitycally solve linear regression)
##    feature_normalize.m (additional, if you're data are on a large scale
##                         and not distributed evenly, you can used this function
##                         to normalized them)
##
##The data used in this exercise is: example_data_01.txt
##y-axis is representing 'Profit in $10,000s'
##x-axis is representing 'Population of City in 10,000s'
addpath('./lib');


%========================Part 1: Load the data==================================
%load the data
fprintf('Loading data...\n');
data = load('example_data_01.txt');
X = data(:,1);
y = data(:,2);
m = length(y); %get number of rows of data
fprintf('DONE\n');

%========================Part 2: Plot the data==================================
fprintf('Plotting data,\n');
figure(1);
plot(X, y, 'rx', 'MarkerSize', 4);
xlabel('Population of City in 10,000s');
ylabel('Profit in 10,000s');
grid on;
legend('Population vs. Profit');
fprintf('Downloading image...\n');
print -dpng './data_plot.png' %extract plot into png file format
fprintf('DONE\n');
#close; %if you want to see the plot, delete this line of code

%========================Part 3: Cost function==================================
X = [ones(m,1),X]; %adding feature 0
theta = zeros(2, 1); % initial theta for gradient descent

%this params need to be set manually
iterations = 1500;
alpha = 0.01;

% compute and display initial cost function
fprintf('\nCalculate initial cost function...\n')
initial_J = calc_cost(X, y, theta);
fprintf('With theta: \n');
disp(theta');
fprintf('Cost calculated: %f\n', initial_J);
fprintf('DONE\n');
fprintf('\nProgram paused. Press ENTER to continue\n');
pause;

%========================Part 4: Gradient descent===============================
fprintf('\nPerforming Gradient Descent...\n');

%performing gradient descent
[theta, j_iter] = gradient_des(X, y, theta, alpha, iterations);
iter = [1:iterations];


%plot iter vs j_iter
figure(2)
plot(iter, j_iter, 'ro', 'MarkerSize', 1);
axis([min(iter) max(iter) min(j_iter) max(j_iter)]);
grid on;
xlabel('Iteration');
ylabel('Cost Function');
legend('Calculated Cost');
print -dpng './cost_plot_gradient_descent.png'
#close; %if you want to see the plot, delete this line of code

fprintf('Theta found by gradient descent:\n');
disp(theta');
fprintf('DONE\n');
fprintf('\nProgram paused. Press ENTER to continue\n');
pause;

%========================Part 5: Plotting the model=============================
fprintf('Plotting data and regression fit,\n');
y_pred = X*theta;
figure(3);
hold on, grid on;
plot(X(:, 2), y, 'rx', 'MarkerSize', 4);
plot(X(:, 2), y_pred, 'LineWidth', 1.5, 'k');
xlabel('Population of City in 10,000s');
ylabel('Profit in 10,000s');
legend('Real data', 'Gradient Descent');

fprintf('Downloading image...\n');
print -dpng './regression_plot.png'
fprintf('DONE\n');
#close; %if you want to see the plot, delete this line of code

% compute and display final cost function
fprintf('\nCalculate final cost function...\n')
J = calc_cost(X, y, theta);
fprintf('With theta: \n');
disp(theta');
fprintf('DONE\n');
fprintf('\nProgram paused. Press ENTER to continue\n');
pause;

%========================Part 6: Using normal equation==========================
fprintf('\nPerforming Normal Equation...\n');
theta_norm = normal_equation(X,y);
fprintf('Theta found by gradient descent:\n');
disp(theta');
fprintf('Theta found by normal_equation:\n');
disp(theta_norm');

J_norm = calc_cost(X, y, theta_norm);
fprintf('Cost initial: %f\n', initial_J);
fprintf('Cost final (gradient descent): %f\n', J);
fprintf('Cost final (normal_equation): %f\n', J_norm);

fprintf('\nGradient descent model vs normal equation model:\n');
fprintf('\nGenerating plot\n');
y_pred_norm = X*theta_norm;

figure(4);
hold on, grid on;
plot(X(:, 2), y, 'rx', 'MarkerSize', 4);
plot(X(:, 2), y_pred, 'LineWidth', 1.5, 'k');
plot(X(:, 2), y_pred_norm, 'LineWidth', 1.5, 'b');
xlabel('Population of City in 10,000s');
ylabel('Profit in 10,000s');
legend({'Real data','Gradient descent','Normal equation'},...
      'Location', 'northwest');

fprintf('Downloading image...\n');
print -dpng './grad_des_vs_normal.png'
fprintf('DONE\n');
#close; %if you want to see the plot, delete this line of code