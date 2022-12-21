%% Compute Euler Parameters when Cartesian DCM in input

function beta = cart_to_eulerparam(C)

% % Straightforward computation taking beta_0 as +ve
% beta(1)=0.5*sqrt(C(1,1)+C(2,2)+C(3,3)+1); % beta_0
% beta(2)=(C(2,3)-C(3,2))/(4*beta(1)); % beta_1
% beta(3)=(C(3,1)-C(1,3))/(4*beta(1)); % beta_2
% beta(4)=(C(1,2)-C(2,1))/(4*beta(1)); % beta_3

% Sheppard's Algorithm under trial - More computationally robust
trace=C(1,1)+C(2,2)+C(3,3);
beta_sq(1)=(1+trace)/4; % beta_0^2
beta_sq(2)=(1+2*C(1,1)-trace)/4; % beta_1^2
beta_sq(3)=(1+2*C(2,2)-trace)/4; % beta_2^2
beta_sq(4)=(1+2*C(3,3)-trace)/4; % beta_3^2

[~,i]=max(beta_sq);

if i==1
    beta(1)=sqrt(beta_sq(1));
    beta(2)=(C(2,3)-C(3,2))/(4*beta(1));
    beta(3)=(C(3,1)-C(1,3))/(4*beta(1));
    beta(4)=(C(1,2)-C(2,1))/(4*beta(1));

elseif i==2
        beta(2)=sqrt(beta_sq(2));
        beta(1)=(C(2,3)-C(3,2))/(4*beta(2));
        if beta(1)<0
            beta(2)=-beta(2);
            beta(1)=-beta(1);
        end
        beta(3)=(C(1,2)+C(2,1))/(4*beta(2));
		beta(4)=(C(3,1)+C(1,3))/(4*beta(2));

elseif i==3
		beta(3)=sqrt(beta_sq(3));
		beta(1) = (C(3,1)-C(1,3))/4/beta(3);
		if (beta(1)<0)
			beta(3)=-beta(3);
			beta(1)=-beta(1);
		end
		beta(2)=(C(1,2)+C(2,1))/(4*beta(3));
		beta(4)=(C(2,3)+C(3,2))/(4*beta(3));

elseif i==4
		beta(4)=sqrt(beta_sq(4));
		beta(1)=(C(1,2)-C(2,1))/(4*beta(4));
		if (beta(1)<0)
			beta(4)=-beta(4);
			beta(1)=-beta(1);
		end
		beta(2)=(C(3,1)+C(1,3))/(4*beta(4));
		beta(3)=(C(2,3)+C(3,2))/(4*beta(4));
end

beta=beta'; % Make it a column vector

end