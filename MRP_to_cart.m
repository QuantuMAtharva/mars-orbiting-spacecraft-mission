function C = MRP_to_cart(mrp)

mrp1=mrp(1);
mrp2=mrp(2);
mrp3=mrp(3);
mrp_sq=mrp.'*mrp;

denom=(1+mrp_sq).^2;
prod_term=(1-mrp_sq);

C(1,1)=4*(mrp1^2-mrp2^2-mrp3^2)+prod_term^2;
C(1,2)=8*mrp1*mrp2+4*mrp3*prod_term;
C(1,3)=8*mrp1*mrp3-4*mrp2*prod_term;
C(2,1)=8*mrp2*mrp1-4*mrp3*prod_term;
C(2,2)=4*(-mrp1^2+mrp2^2-mrp3^2)+prod_term^2;
C(2,3)=8*mrp2*mrp3+4*mrp1*prod_term;
C(3,1)=8*mrp3*mrp1+4*mrp2*prod_term;
C(3,2)=8*mrp2*mrp3-4*mrp1*prod_term;
C(3,3)=4*(-mrp1^2-mrp2^2+mrp3^2)+prod_term^2;

C=C./denom;

end