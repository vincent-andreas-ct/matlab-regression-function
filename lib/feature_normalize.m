function [X_norm, mu, sigma] = feature_normalize(X)
  ##feature_normalize is use to normalize your data. The purpose is to
  ##set all the features in your data on the same scale. This will make
  ##gradient descent to converge faster to find the global minimum.
  ##  X: m-rows x n-features data (features are including features 0)
  
  X_norm = X; %copy matrix X
  mu = zeros(1, size(X, 2)); %create empty matrix to conatains mean
  sigma = zeros(1, size(X, 2)); %create empty matrix to contains standard deviation
  
  for i = 1:size(X)(2)
      mu(1,i) = mean(X(:, i));
      sigma(1,i) = std(X(:, i));
      X_norm(:,i) = (X(:,i)-mu(1,i))/sigma(1,i);
  end
end