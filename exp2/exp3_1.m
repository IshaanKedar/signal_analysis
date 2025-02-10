clc;
clear all;
close all;

b = input('enter numerator coefficients = ');
a = input('enter denominator coefficients');

[z,p,k] = tf2zp(b,a);
m = abs(p); %findinf the distance from origin of poles

disp('zeros are at;');
disp(z);

disp('poles are at');
disp(p);

disp('gain constant');
disp(k);

disp('radius of poles');
disp(m);

sos = zp2sos(z,p,k);

disp('second order sections');
disp(real(sos));
zplane(b,a);

w = [-2.5:1/10:2.5];

[h,w] = freqz(b,a,w);

figure;
subplot(221);
plot(w/pi,20*log10(abs(h)));

xlabel('frequency in \pi units');ylabel('magnitude in db');
title('magnitude response');
subplot(222);
plot(w/pi,angle(h)/pi);
xlabel('frequency in \pi units');ylabel('phase in radians');
title('phase response');
[h,t] = impz(b,a);
subplot(223);
stem(t,h);
title('impulse response')