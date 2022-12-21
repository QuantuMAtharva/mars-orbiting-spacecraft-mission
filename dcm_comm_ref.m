%% Function for Communication Reference Frame Rc and Inertial Frame
function [dcm_Rc_N_t] = dcm_comm_ref(t)

r_mars=3396.19; % in km
r_LMO=r_mars+400; % Low Mars Orbit
r_GMO=20424.2; % Geosynchronous Mars Orbit
mu_mars=42828.3; % Mars Gravity Constant (km^3/s^2)

theta_dot_LMO=sqrt(mu_mars/r_LMO^3);
theta_dot_GMO=sqrt(mu_mars/r_GMO^3);

omega_GMO=0;
omega_LMO=20;
i_GMO=0;
i_LMO=30;
theta_LMO=deg2rad(60)+t*theta_dot_LMO;
theta_GMO=deg2rad(250)+t*theta_dot_GMO;

[r_N_GMO_t,~]=compute_r_v_N(r_GMO,omega_GMO,i_GMO,theta_GMO);
[r_N_LMO_t,~]=compute_r_v_N(r_LMO,omega_LMO,i_LMO,theta_LMO);

delta_r=r_N_GMO_t-r_N_LMO_t;
r1_cap=-delta_r./norm(delta_r);
r2_cap=cross(delta_r,[0;0;1])./norm(cross(delta_r,[0;0;1]));
r3_cap=cross(r1_cap,r2_cap);
dcm_Rc_N_t=[r1_cap r2_cap r3_cap]'; % DCM from N to Rc found
end