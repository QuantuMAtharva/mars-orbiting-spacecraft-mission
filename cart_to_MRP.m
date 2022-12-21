%% Converting Euler parameters to MRP has one formula
%% The other part is to convert cartesian to Euler parameters

function mrp_output = cart_to_MRP(C)

% Cartesian to Euler Parameters
beta=cart_to_eulerparam(C);

% Euler parameters
beta_0=beta(1);
beta_1=beta(2);
beta_2=beta(3);
beta_3=beta(4);

% Conversion from Euler to MRP
denom_euler=1+beta_0;
mrp_output=[beta_1/denom_euler;beta_2/denom_euler;beta_3/denom_euler];

end