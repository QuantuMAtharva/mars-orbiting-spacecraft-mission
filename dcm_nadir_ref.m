%% Function for Nadir-Pointing Reference Frame Rn and Inertial Frame
function dcm_Rn_N_t = dcm_nadir_ref(t)

dcm_Rn_H=[cos(pi) 0 -sin(pi);0 1 0;sin(pi) 0 cos(pi)]; % Nadir ref to Hill

dcm_H_N=dcm_H_N_frame(t);

dcm_Rn_N_t=dcm_Rn_H*dcm_H_N; % DCM at t=330s

end