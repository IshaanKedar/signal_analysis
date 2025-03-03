% fast fourier transform for spectral analysis
clc;
clear;
close;
fs=400;
N = fs;
ts = 1/fs;
deltaf = 1/(N*ts);
n = [1:N]*ts;
x = sin((50*pi*n)/fs)+cos(((50*pi*n)/fs)+((4*pi)/3))+sin(((1000*pi*n)/fs)+(4*pi)/5);
subplot(311);
plot(n,x);
title('x[n]');
xf = fft(x);
f=([0:N-1]*deltaf);

subplot(312);
plot(f,abs(xf));
title('mag of fourier transform')

subplot(313);
plot(f,angle(xf));
title('phase spectrum');
