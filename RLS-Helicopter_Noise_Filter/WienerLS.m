function [E_LS, LS_Coeff]=WienerLS(M, d, x, c)
%%% Least Square Methode

X = toeplitz(x(:,c), zeros(1, M));  %The autocorrelation matrix

h = inv(X'*X)*X'*d(:,c);            %Filter coeffcient vector overall

y = X*h;                            %Filter output %Estimated noise

E_LS=d(:,c)-y;                      %Error = (Noise + Music) - Noise = Music

LS_Coeff = h;                       %Save the Leas Square coeffcients
 
end


    