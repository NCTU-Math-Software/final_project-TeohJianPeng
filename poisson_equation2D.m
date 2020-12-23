N = 100;                 %痻皚
Delta = 1/(N-1);         

u = rand(N*N,1);         %繦诀2蝴痻皚

ite1 = 0;                 %秈︽Ω计
tol = 10^(-4);           %粇畉
a = 0;                   %lambda﹍
L = zeros(N*N,N*N);
tic;
for ii = 1:N*N
    L(ii,ii)=-4;
    if rem(ii-1,N)>0
        L(ii,ii-1)=1;
    end
    if rem(ii,N) > 0
        L(ii,ii+1)=1;
    end
    if ii-N > 0
        L(ii,ii-N)=1;
    end
    if ii+N <= N*N
        L(ii,ii+N)=1;
    end
end

L = L/(Delta*Delta);

while 1
    ite1 = ite1 + 1;       %璸衡笲Ω计
    u = u/norm(u);       %u琌1
    v = L*u;
    lambda=v(1)/u(1);
    if abs(lambda-a)/abs(a) < tol
        break
    end
    a=lambda;
    u=v;
end
maxlambda = abs(lambda)
tic;
K=inv(L);
toc
a = 0;
ite2 = 0;
while 1
    ite2 = ite2 + 1;       %璸衡笲Ω计
    u = u/norm(u);       %u琌1
    v = K*u;
    lambda2 = v(1)/u(1);
    if abs(lambda2-a)/abs(a) < tol
        break
    end
    a = lambda2;
    u = v;
end
lambda2 = 1/lambda2;         %程疭┖
minlambda = abs(lambda2)

toc;