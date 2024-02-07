function F=forceeditor(f_data,n)
[r2,c2]=size(f_data);
F=zeros(2*n,1);
for i=1:r2
    node_num=f_data(i,2);
    if f_data(i,3)==1
       F(node_num,i)=f_data(i,1);
    elseif f_data(i,3)==2
       F(node_num+n,i)=f_data(i,1);
    elseif f_data(i,3)==3
       F(node_num,i)=f_data(i,1);
       F(node_num+n,i)=f_data(i,1);
    end
end
F=sum(F,2);
end
