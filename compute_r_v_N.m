function [r_N,r_dot_N] = compute_r_v_N(r,omega,i,theta)
% r_dot_N = v_N
mu_mars=42828.3;
theta_dot=sqrt(mu_mars/r^3);

% 3-1-3 Euler Angle Rotation
R_theta=[cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
R_i=[1 0 0; 0 cos(i) sin(i); 0 -sin(i) cos(i)];
R_omega=[cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];

dcm_HN_t=R_theta*R_i*R_omega;

r_N=((dcm_HN_t).')*([r; 0; 0]);
r_dot_N=((dcm_HN_t).')*([0;r*theta_dot;0]);

end

