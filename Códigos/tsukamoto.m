% semantica de los términos lingüisticos para el error

paso = 0.01; % incremento del paso en el rango de error
e = -20:paso:20;
a = 0.1;
EN = sigmf(e,[-a,0]);
EP = sigmf(e,[a 0]);

subplot(3,1,1), plot(e, EN, e, EP, 'LineWidth',5), title('Error')

set(gca, 'FontSize', 18), axis =([-20 20 0 1.0])
%%%%
v = -12:paso:12;
VN = trimf(v, [-12 12 12]);
VP = trimf(v, [-12 -12 12]);

subplot(3,1,1), plot(v, VN, v, VP, 'LineWidth',5), title('Voltaje')

set(gca, 'FontSize', 18), axis =([-12 12 0 1.0])

%%% Inferencia de Tsukamoto, Curva de control

imax = length(e)
for i = 1:imax
    W = [EN(i) EP(i)];
    z1 = -24*(EN(i)-0.5);
    z2 = -24*(EP(i)-0.5);
    v(i) = (W(1)*z1 + W(2)*z2) / (W(1) + W(2));
end 


subplot(3,1,1), plot(e, v,  'LineWidth',5), title('Curva de Control')

set(gca, 'FontSize', 18), axis =([-21 2 -13 13])
