%% Function for Hill and Inertial Frame Conversions

function dcm_HN_t = dcm_H_N_frame(t)
% Enter omega, i and theta_t0 in degrees
% theta_dot: Orbit Rate
% r: Orbit Radius
omega=deg2rad(20);
i=deg2rad(30);
theta_t0=deg2rad(60);

r_mars=3397.2;
h_LMO=400;
r_LMO=h_LMO+r_mars;
mu_mars=42828.3;
theta_dot=sqrt(mu_mars/r_LMO^3);
theta_t=theta_t0+theta_dot*t;

% 3-1-3 Euler Angle Rotation
R_theta=[cos(theta_t) sin(theta_t) 0; -sin(theta_t) cos(theta_t) 0; 0 0 1];
R_i=[1 0 0; 0 cos(i) sin(i); 0 -sin(i) cos(i)];
R_omega=[cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];

dcm_HN_t=R_theta*R_i*R_omega;

% r_N=((dcm_HN_t).')*([r_LMO; 0; 0]);
% r_dot_N=((dcm_HN_t).')*([0;r_LMO*theta_dot;0]);
end