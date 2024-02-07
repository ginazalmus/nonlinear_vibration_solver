%%%%NaturalFrequencySolver
function wn=nfcalculator(K,M,H)
%         [n,m]=size(K);
%         if m==1 || n==1
%            K=diag(K);
%         elseif m==n
%             A=diag(K);    
%             K=K'+K;
%             K(1:n+1:end)=diag(K);
%             K=K-diag(A);
%         else
%         K=K;
%         end
%         
%         [n,m]=size(M);
%         if m==1 || n==1
%            M=diag(M);
%         elseif m==n
%             A=diag(M);    
%             M=M'+M;
%             M(1:n+1:end)=diag(M);
%             M=M-diag(A);
%         else
%         M=M;
%         end
        

if H~=0
    K=K+H*(1i);
    lambda=eig(K,M);
    wn=sqrt(lambda);
    wn=sort(real(wn));
else
    lambda=eig(K,M);
    wn=sqrt(lambda);
    wn=sort(wn);  
end
end

    


