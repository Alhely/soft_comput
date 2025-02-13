%%% COMPOSICION 

x = 0:0.01:1;
mA = sigmf(x,[15 0.5]);
y = 0:0.01:5; 
mB = sigmf(y,[-3 2.5]);
mAp = gaussmf(x,[0.04 0.5]);

%plot(x,mA)
%plot(y,mB)
%plot(x,mAp)
x = 0:0.01:1;
mA = sigmf(x,[15 0.5]);
y = 0:0.01:5; 
mB = sigmf(y,[-3 2.5]);
mAp = gaussmf(x,[0.04 0.5]);

%plot(x,mA)
%plot(y,mB)
%plot(x,mAp)

%%% R = A x B
for i = 1:101
    for j = 1:501
        mR(i,j) = min(mA(i),mB(j));
    end
end

[X,Y] = meshgrid(0:0.01:5, 0:0.01:1)

mesh(X,Y,mR)




%%% Bp = Ap comp R i = rows, j = cols


for j = 1:501
    for i = 1:101
        mBpp(i) = min( mAp(i), mR(i,j) )
    end
    mBp(j) = max(mBpp)
end

plot(y,mBp)