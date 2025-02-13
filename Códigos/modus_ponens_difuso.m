x = 0:0.01:8;
mA = sigmf(x,[0.5 3]);
y = 0:0.01:10; 
mB = sigmf(y,[0.5 8]);


%% calculando A x B 
for i = 1:801
    for j = 1:1001
        mR(i,j) = min(mA(i),mB(j));
    end
end

[X,Y] = meshgrid(0:0.01:10, 0:0.01:8);


mesh(X,Y,mR)

%% calculando A' compuesta con R

mAp = sigmf(y,[-10 1]);

for j = 1:1001
    for i = 1:801
        mBpp(i) = min( mAp(i), mR(i,j) );
    end
    mBp(j) = max(mBpp);
end

plot(y,mBp)
ylim([0,1])