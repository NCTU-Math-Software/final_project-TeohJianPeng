N = 100;
Delta = 1/(N-1);

u=rand(N,N);



ite = 1;
tol = 10^(-4);
a=0;
while 1
    ite = ite + 1;
    u = u/norm(u);
    v=L(u);
    lambda=v(1,1)/u(1,1);
    if abs(lambda-a) < tol
        break
    end
    a=lambda;
    u=v;
end
function V=L(U)
    N = 100;
    Delta = 1/(N-1);
    V=zeros(N,N);
    for ii=1:N
        for jj=1:N
            if ii==1
                a=0;
            else
                a=U(ii-1,jj);
            end
            if jj==1
                d=0;
            else
                d=U(ii,jj-1);
            end
            if ii==N
                c=0;
            else
                c=U(ii+1,jj);
            end
            if jj==N
                e=0;
            else
                e=U(ii,jj+1);
            end
            b=-4*U(ii,jj);
            V(ii,jj)=(a+b+c+d+e)/(Delta*Delta);
        end
    end
end