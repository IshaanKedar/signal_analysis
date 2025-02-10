clc;
clear all;

b = input('enter numerator coefficients = ');
a = input('enter denominator coefficients');

w = [-2.5:1/10:2.5];
[h,w] = freqz(b,a,w);
subplot(211)
plot(w/pi,20*log10(abs(h)));

xlabel('frequency in \pi units');ylabel('magnitude in db');
title('magnitude response');
subplot(212);
plot(w/pi,angle(h)/pi);
xlabel('frequency in \pi units');ylabel('phase in radians');
title('phase response');


