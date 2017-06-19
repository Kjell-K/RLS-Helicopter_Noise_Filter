function [e]=RLSFilt(d_r, d_l, x_r, x_l)

%n = 7944192;
n=2000000;
M = 15; %The windowing!
w = 0.9; %Forgetting factor

%build the hm
h = zeros(M,1);
%build the Pm
delta = 0.001;
P = eye(M)/delta;
%build the Xm
X = zeros(M,1);

%Let's write h = P = X = zeros(M,1);

e = zeros(n,1);

%disp('Check n.1')

for i=1:n   %NEW!!!

  if i == 1
      P_old = P;
      h_old = h;
  end

  %Implement new observation in X
  X = circshift(X, [-1,0]);   %NEW!!! X = ...
  X(M) = x_r(i);  %puts new element last

  d_roof = X' * h_old;  %filter output
  
  e(i) = d_r(i) - d_roof;  %error

  K = (P_old * X)/(w + X' * P_old * X);  %Kalman gain vector

  P = 1/w * (P_old - K * X' * P_old);  %Inverse of the correlation matrix

  h = h_old + K * e(i); %NEW!!! %New coefficient for the filter

  %H(i) = h %NEW!!!


  P_old = P;
  h_old = h;

  i = i + 1;

end  %NEW!!!


end