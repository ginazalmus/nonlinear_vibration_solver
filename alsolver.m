function [solution,w_plot,n]=alsolver(nl_data,w_min,w_max,ds,error,numite,N_opt,M,K,C,H,f_data)

[r1,c1]=size(M);
n=r1; %number of dof
x0=zeros(2*n,1);
f_data=f_data;
nl_data=nl_data;
w0=w_min;
%%Creating linear equation set
LE=@(w)[(K-w^2*M) -(H+w*C); (H+w*C) (K-w^2*M)]; 
%%Creating force matrix
Forcing=forceeditor(f_data,n);
F=Forcing;
%%Creatingnonlinearmatrix
delta=@(x) nleditor(x,nl_data,n,w0);
q=@(x,w)(LE(w)+delta(x))*x-F;
a=1;


while(w_min<w_max)
for i=a
    w0=w_min;
    %NewtonRaphsonStarts
    for k=1:numite
        %%Creatingnonlinearmatrix
        w0=w_min;
        %Taking derivative of F w.r.t frequency
        w_delta=w0+error;
        q0=q(x0,w0);
        q_w_delta=q(x0,w_delta);
        dF=(q_w_delta-q0)/error;    
        %calculating numerical jacobian
        x_delta=x0;
        for j=1:2*n
        x_delta(j)=x_delta(j)+error;
        q_delta0=q(x_delta,w0);
        J0(:,j)=(q_delta0-q0)/error;
        x_delta=x0;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%calculating predictors for p and x
        dF0=dF;
        z1=J0\dF0;
        delta_w=ds/sqrt(transpose(z1)*z1+1);
        delta_w=sign(det(J0))*abs(delta_w);
        delta_x=-z1*delta_w;
        %changing initial guess for next step
        w_min=w_min+delta_w;
        x0=delta_x+x0;
        %%%%%%%%%%%%%%
        w0=w_min;
        q0=q(x0,w0);
        x_delta=x0;
                %calculating numerical jacobian
                for j=1:2*n
                x_delta(j)=x_delta(j)+error;
                q_delta0=q(x_delta,w0);
                J0(:,j)=(q_delta0-q0)/error;
                x_delta=x0;
                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        F0=q0;%calculating equations
        xnew=x0-J0\F0;%newtonraphsonformulation
        error1 = norm(F0);
        x0=xnew;
        sol=zeros(numite,2*n);
        sol(k,:)= transpose(x0);
        fprintf('%d              |',k)
        fprintf('  Error=%0.6f  ', error1);
        fprintf('  | root=[%0.10f]', sol(k,:));
        fprintf('  | w=[%0.10f]', w_min);
        fprintf('\n')
        if (error1<error)
            w_plot(i,1)=w_min;
            solution(i,:)=transpose(x0); %storing roots for each p value
            number_of_iteration(i,1)=k; %storing number of iteration for each p value
            break;
        end 
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (error1<error)
    a=a+1;
else
    a=a;
end
 
eps=N_opt/k;
if eps<0.5
   eps=0.5;
elseif eps>2
   eps=2;
else 
   eps=eps;
end
ds=ds*eps^(1/5);

if ds<0.000005
ds=0.000005;
elseif ds>0.0005
ds=0.0005;
else
end

end
 if (error1>100)
       break;
 end
    
end

end    
    

        
