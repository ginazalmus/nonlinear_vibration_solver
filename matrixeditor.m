function U=matrixeditor(M)
        [n,m]=size(M);
        if m==1 || n==1
           M=diag(M);
        elseif m==n
            if M(m,1)==0 || M(1,m)==0
            A=diag(M);    
            M=M'+M;
            M(1:n+1:end)=diag(M);
            M=M-diag(A);
            else
            end
        else
        M=M;
        end
U=M;       
end