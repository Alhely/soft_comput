% semantica de los términos lingüisticos para el error

paso = 0.01; % incremento del paso en el rango de error
e = -20:paso:20;

ENG = trapmf(e, [-20 -20 -10 -5]);
ENP = trimf(e, [-10 -5 0]);
EC = trimf(e, [-5 0 5]);
EPP = trimf(e, [0 5 10]);
EPG = trapmf(e, [5 10 20 20]);

figure(1)
subplot(3,1,1), plot(e, ENG, e, ENP, e, EC, e, EPP, e, EPG, 'LineWidth',5), title('Error')

% semantica de los términos lingüisticos para el voltaje
paso = 0.01; % incremento del paso en el rango de error
v = -10:paso:10;

VNG = trapmf(v, [-12 -12 -6 -3]);
VNP = trimf(v, [-6 -3 0]);
VC = trimf(v, [-3 0 3]);
VPP = trimf(v, [0 3 6]);
VPG = trapmf(v, [3 6 12 12]);

figure(2)
subplot(3,1,1), plot(v, VNG, v, VNP, v, VC, v, VPP, v, VPG, 'LineWidth',5), title('Voltaje')

%reglas

%AxB
for i=1:length(e)
     for j=1:length(v)
         r1(i,j) = min(ENG(i),VNG(j));
         r2(i,j) = min(ENP(i),VNP(j));
         r3(i,j) = min(EC(i),VC(j));
         r4(i,j) = min(EPP(i),VPP(j));
         r5(i,j) = min(EPG(i),VPG(j));
     end
end

%ap compuesto con R

for i = 1:length(e)
    for j = 1:length(v)
        bp1(j) = min(ENG(i), VNG(j));
        bp2(j) = min(ENP(i), VNP(j));
        bp3(j) = min(EC(i), VC(j));
        bp4(j) = min(EPP(i), VPP(j));
        bp5(j) = min(EPG(i), VPG(j));

        BP(j) = max([bp1(j),bp2(j),bp3(j),bp4(j),bp5(j)]);
    end
    vp(i) = defuzz(v,BP,'centroid');
end
figure(3)
subplot(3,1,1), plot(e, vp,  'LineWidth',5), title('Curva de Control')
