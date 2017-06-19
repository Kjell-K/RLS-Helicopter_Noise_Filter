function [E_RLS, RLS_Coeff]=RLS(n, M, d, x, c)
%%% Adaptive Recursive least squares filter at each step / Real time
%Initialisations
w = 1;                  %Forgetting factor - Never forget

h = zeros(M,1);         %denotes the vector of adaptive filter coefficients

delta = 0.001;          %value to initialize P(0)
P = eye(M)/delta;       %Inversive correlation matrix %%Identity matrix of rank M / delta

X = zeros(M,1);         %Input signal vector. With M Samples to compute with

E_RLS = zeros(n,1);     %Error to compute %The Music

%RLS Algorithm from 1 to n
for i=1:n
  %Implement new observation in X
  X = circshift(X, [1,0]);          %Shifts everything one above --> Sapce for new element
  X(1) = x(i,c);            %puts new Sample as last element

%1. Computed filter Output
  y = X' * h;
%2. Compute the error
  E_RLS(i) = d(i,c) - y;
%3. Compute the Kalman gain vector
  K = (P * X)/(w + X' * P * X);
%4. Update the inverse of the correlation matrix:
  P = 1/w * (P - K * X' * P);
%5. Update the coeffcient vector of the Filter
  h = h + K * E_RLS(i);            %New coefficient for the filter
 
  RLS_Coeff(:,i) = h; %Save coeffcient vector for each step
  
  i = i + 1; %Do the step
end
