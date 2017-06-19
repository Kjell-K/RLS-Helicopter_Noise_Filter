clear all;
%Declarations:
rolling_noise = audioread('rolling_noise.wav'); %Noise + Music
Heli_noise = audioread('Heli_noise.wav'); %Noise
fs=44100; %sample frequency
t=45; %%% time in seconds
%N=t*fs; %%% number of samples

%%%%%%%% DATA: x splited into left and right
x_r=Heli_noise(:,1);
x_l=Heli_noise(:,2);
%%%%%%%% REFERENCE: d splited into left and right
d_r=rolling_noise(:,1);
d_l=rolling_noise(:,2);

%Wienerfilter function
%[E_r, E_l, Filt_Coeff_r,Filt_Coeff_l] = WienerFilt(d_r, d_l, x_r, x_l);

[e] = RLSFilt(d_r, d_l, x_r, x_l);

%rolling_filt=[E_r E_l];

%clear ('rolling_noise', 'Heli_noise', 'x_r','x_l','y_r','y_l','d_r','d_l');

%soundsc(rolling_filt(1:N,:),fs)
