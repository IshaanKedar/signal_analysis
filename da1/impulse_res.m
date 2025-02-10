clc;
clear all;
close all;
% Coefficients of the numerator and denominator

b = input('type in the numerator coefficients = ');

a = input('type the denomiator coefficeints = ');



% Compute the impulse response
[h, t] = impz(b, a);

% Plot the impulse response
stem(t, h);
xlabel('n');
ylabel('h[n]');
title('Impulse Response of H(z)');
grid on;
