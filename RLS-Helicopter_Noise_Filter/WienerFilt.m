function [E_r, E_l, Filt_Coeff_r,Filt_Coeff_l]=WienerFilt(d_r, d_l, x_r, x_l)

N_id=1e4; %%% limit the number of data samples
L_coef=10; %%% number of coefficients of the FIR filter

d_r_id = d_r(1:N_id);
d_l_id = d_l(1:N_id);

x_r_id = x_r(1:N_id);
X_R = toeplitz(x_r_id, zeros(L_coef, 1));

x_l_id = x_l(1:N_id);
X_L = toeplitz(x_l_id, zeros(L_coef, 1)); %Corsscorrelation values. Here the auto coorrelation takes place

Filt_Coeff_r = inv(X_R'*X_R)*X_R'*d_r_id;

Filt_Coeff_l = inv(X_L'*X_L)*X_L'*d_l_id;

y_r=filter(Filt_Coeff_r,1,x_r);
y_l=filter(Filt_Coeff_l,1,x_l);

E_r=d_r-y_r;
E_l=d_l-y_l;


end