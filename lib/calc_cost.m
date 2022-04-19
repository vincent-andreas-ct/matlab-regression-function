function J = calc_cost(X, y, theta)
  ##This function calculate the cost function from the given data: X and y
  ##  X: m-rows x n-features data (features are including features 0)
  ##  y: m-rows x 1 column (m-dimensional vector)
  ##  theta: n-rows x 1 column (n-dimensional vector)
  m = length(y);
  J = 0;
  
  %calculate cost function using vectorization
  J = sum((X*theta - y).^2)/(2*m); 
end