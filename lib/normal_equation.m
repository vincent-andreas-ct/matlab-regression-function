function [theta] = normal_equation(X, y)
  ##normal_equation computes a closed-form solution for linear
  ##regression problem. It perfoms some matrix calculation to find
  ##theta analytically from the given data: X and y
  ##  X: m-rows x n-features data (features are including features 0)
  ##  y: m-rows x 1 column (m-dimensional vector)
  
  theta = zeros(size(X, 2), 1); %create an empty matrix
  theta = pinv(X'*X) * X'*y;
end