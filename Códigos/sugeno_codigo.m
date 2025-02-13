% semantica de los términos lingüisticos para el error

paso = 0.01; % incremento del paso en el rango de error
e = -20:paso:20;

NG = sigmf(e, [-0.5 -10]);
NP = gbellmf(e, [2.5 1 -7.5]);
C = gbellmf(e, [5 1 0]);
PP = gbellmf(e, [2.5 1 7.5]);
PG = sigmf(e, [0.5 10]);

figure(1)
subplot(3,1,1), plot(e, NG, e, NP, e, C, e, PP, e, PG, 'LineWidth',5), title('Error')

% semantica de los términos lingüisticos para el voltaje
%paso = 0.01; % incremento del paso en el rango de error
v = -10:paso:10;

f1 = -12;
f2 = 2*e+8;
f3 = 0.4*e ;
f4 = 2*e-8;
f5 = 12;

figure(2)
subplot(3,1,1), plot(e, f1, e, f2, e, f3, e, f4, e, f5, 'LineWidth',5), title('Voltaje')

%reglas

a = 0.5;
b = 1;

for i=1:length(e)
    w1(i) = NG(i);
    w2(i) = NP(i);
    w3(i) = C(i);
    w4(i) = PP(i);
    w5(i) = PG(i);

    z(i) = (w1(i)*f1 + w2(i)*f2(i)+w3(i)*f3(i)+w4(i)*f4(i)+w5(i)*f5)/(w1(i)+w2(i)+ w3(i)+w4(i)+ w5(i));
end

figure(3)
subplot(3,1,1), plot(e, z,  'LineWidth',5), title('Curva de Control')

