N = 100;                 %�x�}���j�p
Delta = 1/(N-1);         %���X100���I/99�q

u = rand(N*N,1);         %�H����2���x�}

ite1 = 0;                %�i�檺����
tol = 10^(-9);           %�~�t��
a = 0;                   %lambda����l��
L = sparse(N*N,N*N);      %�}�@��10000*10000�����s�x�}

%L = spdiags([-1*ones(N, 1), 2*ones(5, 1)], [-1,100], N*N, N*N);

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
    ite1 = ite1 + 1;       %�p��B�@������
    u = u/norm(u);         %u�����׬O1
    v = L*u;
    lambda = v(1)/u(1);
    if abs(lambda-a)/abs(a) < tol
        break
    end
    a = lambda;
    u = v;
end
maxlambda = abs(lambda)
% 
% K = inv(L);
% K = L/v;

a = 0;
ite2 = 0;
while 1
    ite2 = ite2 + 1;       %�p��B�@������
    u = u/norm(u);         %��u�����׬O1
    v = L\u;
    lambda2 = v(1)/u(1);
    if abs(lambda2-a)/abs(a) < tol
        break
    end
    a = lambda2;
    u = v;
end
lambda2 = 1/lambda2;         %�̤p���S����
minlambda = abs(lambda2)     %����ȫ᪺����