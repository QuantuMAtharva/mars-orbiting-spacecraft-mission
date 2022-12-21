%% Attitude (MRP) and Angular Velocity (Omega) error between frames B and R

% MRP --> Cartesian involves Euler Parameters in between as well, so this needs to be tackled

function [sigma_B_R,omega_B_R]=tracking_error(sigma_B_N,omega_B_N_body,dcm_R_N,omega_R_N_inertial)

dcm_B_N=MRP_to_cart(sigma_B_N);

% Tracking errors computed
sigma_B_R = cart_to_MRP(dcm_B_N*(dcm_R_N.'));
omega_B_R = (omega_B_N_body-dcm_B_N*omega_R_N_inertial);
end