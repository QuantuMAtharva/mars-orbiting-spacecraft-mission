function dcm_Rs_N = dcm_sun_ref(t)

angle_1_euler=deg2rad(90);
angle_2_euler=deg2rad(180);
R_n1=[1 0 0;0 cos(angle_1_euler) sin(angle_1_euler);0 -sin(angle_1_euler) cos(angle_1_euler)];
R_n2=[cos(angle_2_euler) 0 -sin(angle_2_euler);0 1 0;sin(angle_2_euler) 0 cos(angle_2_euler)];

dcm_Rs_N=R_n2*R_n1; % Task 3 done: Got DCM Rs_N

end