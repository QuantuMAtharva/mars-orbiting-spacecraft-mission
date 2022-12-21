%% Function for Omega of Communication Reference Frame Rc in Inertial Frame
function [omega_Rc_N_t] = omega_comm_ref(t)
del_t=0.001;
Rc_N_i=dcm_comm_ref(t);
Rc_N_j=dcm_comm_ref(t+del_t);
del_Rc_N=Rc_N_j-Rc_N_i;

omega_Rc_N_t=Rc_N_i.'*(del_Rc_N./del_t);
end