function ELinealEscalonadaS()
    A=input("ingrese una matriz escalonada superior")
    B=input("ingrese un vector")
    X=zeros(size(B),1)
    %n=size(A)
    nv=size(B)
    nv=nv(1)

    (nv)=B(nv)/A(nv,nv)
    X(size(A))=nv 
    sumatoria=0;                                                                                
    for n=size(A)-1:-1:1
        for j=n+1:size(A)    
            sumatoria=A(n,j)*X(j)+sumatoria
        end
        X(n)=(1/A(n,n))*(B(n)-sumatoria)
        sumatoria=0;
    end
    X
    disp("la respuesta")
    A*X