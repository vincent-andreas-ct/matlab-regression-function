function [theta, J_every_iter] = gradient_des(X, y, theta, alpha, num_iters)
  ##This function performs gradient descent on the given data: X and y
  ##to find theta that can minimize the cost function at every iteration.
  ##  X: m-rows x n-features data (features are including features 0)
  ##  y: m-rows x 1 column (m-dimensional vector)
  ##  theta: n-rows x 1 column (n-dimensional vector)
  ##  alpha: learning rate
  ##  num_iters: number of iterations to perform gradient descent
  m = length(y);
  J_every_iter = zeros(num_iters, 1);
  
  for i = 1:num_iters
    temp_diff = (alpha/m) * (X'*((X*theta) - y));
    %using vectorization to effectively do gradient descent
    theta = theta - temp_diff;
    J_every_iter(i) = calc_cost(X, y, theta);
  end
end