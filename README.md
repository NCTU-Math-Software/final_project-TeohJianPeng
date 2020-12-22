# final_project-TeohJianPeng
final_project-TeohJianPeng created by GitHub Classroom
%我要做poject2

N = 100;                 %矩陣的大小
Delta = 1/(N-1);         %

u=rand(N,N);             %隨機的2維矩陣

ite = 1;                 %進行的次數
tol = 10^(-4);           %誤差值
a=0;                     %lambda的初始值
while 1
    ite = ite + 1;       %計算運作的次數
    u = u/norm(u);       %u的長度是1
    v=L(u);
    lambda=v(1,1)/u(1,1);
    if abs(lambda-a)/abs(a) < tol
        break
    end
    a=lambda;
    u=v;
end

function V=L(U)
    N = 100;           
    Delta = 1/(N-1);
    V=zeros(N,N);       %開一個空的2維空間
    
   %L(u)=[a(ii-1,jj)-4b(ii,jj)+c(ii+1,jj)+d(ii,jj-1)+e(ii,jj+1)]
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
