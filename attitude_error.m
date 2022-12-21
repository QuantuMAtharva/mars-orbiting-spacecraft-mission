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

t=0; % Stuff to be evaluated at t_0

%% For Sun-Pointing Frame
dcm_Rs_N=dcm_sun_ref(t);
omega_Rs_N=omega_sun_ref(t);
[sigma_B_Rs,omega_B_Rs]=tracking_error(sigma_B_N_t0,omega_B_N_t0_bodyframe,dcm_Rs_N,omega_Rs_N);


%% For Nadir-Pointing Frame
dcm_Rn_N=dcm_nadir_ref(t);
omega_Rn_N=omega_nadir_ref(t);
[sigma_B_Rn,omega_B_Rn]=tracking_error(sigma_B_N_t0,omega_B_N_t0_bodyframe,dcm_Rn_N,omega_Rn_N);

%% For GMO-Pointing Frame or the Communication Reference Frame
dcm_Rc_N=dcm_comm_ref(t);
omega_Rc_N=omega_comm_ref(t);
[sigma_B_Rc,omega_B_Rc]=tracking_error(sigma_B_N_t0,omega_B_N_t0_bodyframe,dcm_Rc_N,omega_Rc_N);