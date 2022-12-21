function omega_Rn_N_inertial_t = omega_nadir_ref(t)

mu_mars=42828.3; % Mars Gravity Constant (km^3/s^2)
r_LMO=r_mars+400; % Low Mars Orbit

theta_dot_LMO=sqrt(mu_mars/(r_LMO^3));

omega_Rn_N_inertial_t=dcm_H_N_frame(t).'*[0;0;theta_dot_LMO];
% omega in inertial frame, that's why transpose has been taken

end

