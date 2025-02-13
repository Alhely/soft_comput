%% PRODUCTO CARTESIANO

x = 0:100;
y = 0:1000;
mA = gbellmf(x,[20,3,50]);
mB = sigmf(y,[0.01 500]);

for i=1:101
     for j=1:1001
         mR(i,j) = min(mA(i),mB(j));
     end
end

[X,Y] = meshgrid(0:1000,0:100);
mesh(X,Y,mR)
set(gca, "FontSize", 18)
