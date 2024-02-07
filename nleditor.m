function delta=nleditor(x0,nl_data,n,w_min)
%%creating nonlinear matrix
[r3,c3]=size(nl_data);
delta_real=zeros(n,n);
delta_imag=zeros(n,n);
v_im=@(x)0;
v=@(x)0;

for i=1:r3
    if nl_data(i,2)==0
    c1=nl_data(i,3);
    c2=1;
    X=@(x) sqrt(x(c1)^2+x(c1+n)^2);
    elseif nl_data(i,3)==0
    c1=nl_data(i,2);
    X=@(x) sqrt(x(c1)^2+x(c1+n)^2);
    c2=1;
    else
    c1=nl_data(i,2);
    c2=nl_data(i,3);
    X=@(x) sqrt((x(c1)-x(c2))^2+(x(c1+n)-x(c2+n))^2);  
    end
          if nl_data(i,1)==1
              kc=nl_data(i,4);
              v=@(x) 0.75*kc*X(x)^2;
          elseif nl_data(i,1)==2
              gap=nl_data(i,5);
              kg=nl_data(i,4);
              if X(x0)<gap
                v=@(x) 0;
                elseif X(x0) >= gap
                phi=@(x)asin(gap/X(x));
                v=@(x)(kg/pi)*(pi/2-phi(x)+(gap/X(x))*cos(phi(x)))-2*((kg*gap)/(pi*X(x)))*cos(phi(x));
                else
              end
          elseif  nl_data(i,1)==3
              k1=nl_data(i,4);
              k2=nl_data(i,5);
              gap=nl_data(i,6);
              if X(x0)>gap
                 v=@(x)(2/pi)*(k1-k2)*(asin(gap/X(x))+(gap/X(x))*sqrt(1-(gap/X(x))^2))+k2;
              elseif X(x0)<=gap
                 v=@(x)k1;
              end
          elseif  nl_data(i,1)==4
              kd=nl_data(i,4);
              muN=nl_data(i,5);
              if X(x0)>(muN/kd)
                ksi1=@(x)pi-asin(1-(2*muN)/(kd*X(x)));
                v_im=@(x)((-4*muN*(muN-kd*X(x)))/(kd*pi*(X(x))^2));
                v = @(x)((1/pi)*(2*muN/X(x)-kd)*sqrt(1-((kd*X(x)-2*muN)/(kd*X(x)))^2)+(kd*ksi1(x))/pi-kd/2);
              elseif X(x0)<=(muN/kd)
                v=@(x)kd;
              end
          elseif  nl_data(i,1)==5
              c_c=nl_data(i,4);
              v_im=@(x) 0.75*c_c*(X(x)^2)*(w_min)^3; 
          elseif  nl_data(i,1)==6
              c_s=nl_data(i,4);
              v_im=@(x) (8/(3*pi))*c_s*X(x)*(w_min)^2; 
          elseif nl_data(i,1)==7
              ks=nl_data(i,4);
              v=@(x) (3/(8*pi))*ks*X(x);
          end
          
     
if c1==c2         
delta_real(c1,c1)=delta_real(c1,c1)+v(x0);
delta_imag(c1,c1)=delta_imag(c1,c1)+v_im(x0);
else
delta_real(c1,c1)=delta_real(c1,c1)+v(x0);
delta_real(c1,c2)=delta_real(c1,c2)-v(x0);
delta_real(c2,c1)=delta_real(c2,c1)-v(x0);
delta_real(c2,c2)=delta_real(c2,c2)+v(x0);  
delta_imag(c1,c1)=delta_imag(c1,c1)+v_im(x0);
delta_imag(c1,c2)=delta_imag(c1,c2)-v_im(x0);
delta_imag(c2,c1)=delta_imag(c2,c1)-v_im(x0);
delta_imag(c2,c2)=delta_imag(c2,c2)+v_im(x0);
end
end
delta=[delta_real (-delta_imag); delta_imag delta_real];
end
