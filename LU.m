function LU

a=input('ingrese matriz a: ');
b=input('ingrese vector b como fila: ');
b2=b;
F=size(a);
n=F(1);
l=eye(n,n);
v=zeros(n,1);
v2=zeros(n,1);
for t=1:n-1
    for z=t+1:n
        l(z,t)=(a(z,t)/a(1,t));
    end
end


for k=1:1:n-1
    for i=k+1:1:n
        for j=k+1:1:n
            a(i,j)=a(i,j)-(a(i,k)/a(k,k))*a(k,j);
        end
        b2(i)=b2(i)-(a(i,k)/a(k,k))*b2(k);
        a(i,k)=0;
    end
end

v(n)=b2(n)/a(n,n);

for z=n-1:-1:1
    v(z)=b2(z);
    for g=n:-1:1+z
        v(z)=v(z)-(a(z,g)*v(g));
    end
    v(z)=v(z)/a(z,z);
end

v2(1)=b(1)/l(1,1);

for z=2:n
    v2(z)=b(z);
    for g=1:z-1
        v2(z)=v2(z)-(l(z,g)*v2(g));
    end
    v2(z)=v2(z)/l(z,z);
end

display(a);
display(l);
display(b2');
display(b');
display(v');
display(v2');
display(a*l);


end