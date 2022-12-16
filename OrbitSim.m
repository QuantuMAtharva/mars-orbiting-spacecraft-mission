% Defining some constants
r_mars=3396.19; % in km
r_LMO=r_mars+400; % Low Mars Orbit
r_GMO=20424.2; % Geosynchronous Mars Orbit
% mu_mars=42828.3; % Mars Gravity Constant (km^3/s^2)

% Initial orbit frame orientation angles in degrees
omega_t0_LMO=20;
i_t0_LMO=30;
theta_t0_LMO=60;

omega_t0_GMO=0;
i_t0_GMO=0;
theta_t0_GMO=250;

% Use below outputs for getting r_N and r_dot_N in LMO and GMO
% orbitsim(r_LMO, 20, 30, 60, 450);
% orbitsim(r_GMO, 0, 0, 250, 1150);

orbitsim(r_LMO, 20, 30, 60, 300);

function [dcm_HN_t, r_N, r_dot_N] = orbitsim(r, omega, i, theta_t0, t)
% Enter omega, i and theta_t0 in degrees
% theta_dot: Orbit Rate
% r: Orbit Radius
omega=deg2rad(omega);
i=deg2rad(i);
theta_t0=deg2rad(theta_t0);

mu_mars=42828.3;
theta_dot=sqrt(mu_mars/r^3);
theta_t=theta_t0+theta_dot*t;

% 3-1-3 Euler Angle Rotation
R_theta=[cos(theta_t) sin(theta_t) 0; -sin(theta_t) cos(theta_t) 0; 0 0 1];
R_i=[1 0 0; 0 cos(i) sin(i); 0 -sin(i) cos(i)];
R_omega=[cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];

dcm_HN_t=R_theta*R_i*R_omega
r_N=((dcm_HN_t).')*([r; 0; 0])
r_dot_N=((dcm_HN_t).')*([0;r*theta_dot;0])

end