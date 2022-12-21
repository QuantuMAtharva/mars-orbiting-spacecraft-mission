clc;
close all;
% Defining some constants
r_mars=3396.19; % in km
r_LMO=r_mars+400; % Low Mars Orbit
r_GMO=20424.2; % Geosynchronous Mars Orbit
mu_mars=42828.3; % Mars Gravity Constant (km^3/s^2)

% Initial orbit frame orientation angles in degrees
omega_t0_LMO=20;
i_t0_LMO=30;
theta_t0_LMO=60;

omega_t0_GMO=0;
i_t0_GMO=0;
theta_t0_GMO=250;

% Use below outputs for getting r_N and r_dot_N in LMO and GMO
%% Task 1 and 2: Orbit Simulation and Orbit Frame Orientation
% orbitsim(r_LMO, 20, 30, 60, 450);
% orbitsim(r_GMO, 0, 0, 250, 1150);
% [dcm_HN_300s,r_N_300s,r_N_dot_300s]=orbitsim(r_LMO, 20, 30, 60, 300); % Task 1 and 2 done: Get r_N, r_dot_N and dcm_HN_t

%% Task 3: Sun-Pointing Reference Frame
% omega_Rs_N_inertial=[0;0;0] % Both frames are stationary wrt each other
% angle_1_euler=deg2rad(90);
% angle_2_euler=deg2rad(180);
% R_n1=[1 0 0;0 cos(angle_1_euler) sin(angle_1_euler);0 -sin(angle_1_euler) cos(angle_1_euler)];
% R_n2=[cos(angle_2_euler) 0 -sin(angle_2_euler);0 1 0;sin(angle_2_euler) 0 cos(angle_2_euler)];

% dcm_Rs_N=R_n2*R_n1 % Task 3 done: Got DCM Rs_N

%% Task 4: Nadir-Pointing Reference Frame
% dcm_Rn_H=[cos(pi) 0 -sin(pi);0 1 0;sin(pi) 0 cos(pi)]; % Nadir ref to Hill
% [dcm_HN_330s,r_N_330s,r_N_dot_330s]=orbitsim(r_LMO, 20, 30, 60, 330);
% dcm_Rn_N_330s=dcm_Rn_H*dcm_HN_330s % DCM at t=330s
% 
% theta_dot_LMO=sqrt(mu_mars/(r_LMO^3));
% omega_Rn_N_inertial_330s=dcm_HN_330s.'*[0;0;theta_dot_LMO]
% omega in inertial frame, that's why transpose has been taken
% Task 4 done

%% Task 5: GMO-Pointing Reference Frame
% dcm_Rc_N_330s=comm_ref(330)
% omega_Rc_N_330s=omega_Rc_N(330)
% Task 5 done. Omega needs edits

%% Function for Hill and Inertial Frame Conversions
% function [dcm_HN_t, r_N, r_dot_N] = orbitsim(r, omega, i, theta_t0, t)
% % Enter omega, i and theta_t0 in degrees
% % theta_dot: Orbit Rate
% % r: Orbit Radius
% omega=deg2rad(omega);
% i=deg2rad(i);
% theta_t0=deg2rad(theta_t0);
% 
% mu_mars=42828.3;
% theta_dot=sqrt(mu_mars/r^3);
% theta_t=theta_t0+theta_dot*t;
% 
% % 3-1-3 Euler Angle Rotation
% R_theta=[cos(theta_t) sin(theta_t) 0; -sin(theta_t) cos(theta_t) 0; 0 0 1];
% R_i=[1 0 0; 0 cos(i) sin(i); 0 -sin(i) cos(i)];
% R_omega=[cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];
% 
% dcm_HN_t=R_theta*R_i*R_omega;
% r_N=((dcm_HN_t).')*([r; 0; 0]);
% r_dot_N=((dcm_HN_t).')*([0;r*theta_dot;0]);
% end

%% Function for Communication Reference Frame Rc and Inertial Frame
% function [dcm_Rc_N_t] = comm_ref(t)
% [~,r_N_GMO_t,~]=orbitsim(20424.2, 0, 0, 250,t);
% [~,r_N_LMO_t,~]=orbitsim(3796.19,20, 30, 60,t);
% delta_r=r_N_GMO_t-r_N_LMO_t;
% r1_cap=-delta_r./norm(delta_r);
% r2_cap=cross(delta_r,[0;0;1])./norm(cross(delta_r,[0;0;1]));
% r3_cap=cross(r1_cap,r2_cap);
% dcm_Rc_N_t=[r1_cap r2_cap r3_cap]'; % DCM from N to Rc found
% end

%% Function for Omega of Communication Reference Frame Rc in Inertial Frame
% function [omega_Rc_N_t] = omega_Rc_N(t)
% del_t=0.001;
% Rc_N_i=comm_ref(t);
% Rc_N_j=comm_ref(t+del_t);
% del_Rc_N=Rc_N_j-Rc_N_i;
% omega_Rc_N_t=Rc_N_i.'*(del_Rc_N./del_t);
% end