%initialize
clc;
clear; 
close;

N = 200;  %length of signal no of smaples in x[n]
L = 256;  %length of dft
nn = 0:N-1;
kk = 0:L-1;
% the signal x

xr = [0.1*(1:100) zeros(1,N-100)];  %real part 
xi = [zeros(1,N)]; %imaginary part
x = xr+ i*xi;

%freqz bulit in for dtft 
% fft is built in function for dft

xf = fft(x,L);
subplot(3,2,1);grid;
plot(nn,xr);grid;
title('re(x(n)');

subplot(3,2,2);

plot(nn,xi);
title('im[x(n)]');

subplot(3,2,3);
plot(kk,real(xf));grid;

title('real(x(k))');
subplot(3,2,4);
plot(kk,imag(xf));grid;

title('imag(x(k)');

xx = ifft(xf,L);
subplot(3,2,5);
plot(kk,real(xx));grid;
title('real part of idft');

subplot(3,2,6);
plot(kk,imag(xx));grid;
title('imag part of idft');

