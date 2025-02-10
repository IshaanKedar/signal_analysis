clc;
clear all;
close all;

% Define system coefficients

b = input('enter numerator coefficients = ');
a = input('enter denominator coefficients');

% Compute impulse response
n = 0:50;  % Range of n
impulse = (n == 0);  % Unit impulse signal
h = filter(b, a, impulse);  % Compute impulse response using filter

% Plot the impulse response
figure;
stem(n, h, 'b', 'filled');
xlabel('n');
ylabel('h[n]');
title('Impulse Response h[n]');
grid on;

% Define input x[n] = u[n] - u[n-15]
x = (n >= 0) - (n >= 15);  % Rectangular pulse

% Compute output y[n] using filter
y = filter(b, a, x);

% Plot input x[n] and output y[n]
figure;
subplot(1,2,1);
stem(n, x, 'r', 'filled'); 
xlabel('n');
ylabel('amplitude');
title('input x[n]')
subplot(1,2,2);
stem(n, y, 'b', 'filled');
xlabel('n');
ylabel('amplitude');
title('output y[n]');
grid on;
