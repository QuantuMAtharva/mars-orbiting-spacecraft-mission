clc;
close all;

%% Attitude Error Evaluation

% Defining essential constants
r_mars=3396.19; % in km
h_LMO=400; % in km
r_LMO=r_mars+h_LMO; % Low Mars Orbit
r_GMO=20424.2; % Geosynchronous Mars Orbit
mu_mars=42828.3; % Mars Gravity Constant (km^3/s^2)

sigma_B_N_t0=[0.3;-0.4;0.5]; % MRP
omega_B_N_t0_bodyframe=[1;.75;-2.2]; % deg/s