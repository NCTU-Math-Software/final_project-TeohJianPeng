N = 100;                 %矩陣的大小
Delta = 1/(N-1);         

u = rand(N*N,1);         %隨機的2維矩陣

ite1 = 0;                 %進行的次數
tol = 10^(-4);           %誤差值
a = 0;                   %lambda的初始值
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
    ite1 = ite1 + 1;       %計算運作的次數
    u = u/norm(u);       %u的長度是1
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
    ite2 = ite2 + 1;       %計算運作的次數
    u = u/norm(u);       %u的長度是1
    v = K*u;
    lambda2 = v(1)/u(1);
    if abs(lambda2-a)/abs(a) < tol
        break
    end
    a = lambda2;
    u = v;
end
lambda2 = 1/lambda2;         %最小的特征值
minlambda = abs(lambda2)

toc;