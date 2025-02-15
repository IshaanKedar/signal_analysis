% DTFT and DFT relationship
clc;clear all;close all;
k=0:31;
x=[1 1 1 1 1 zeros(1,27)];
[h w]=freqz(x,1,'whole');
plot(w/(2*pi),abs(h));grid on;
xlabel('freq');ylabel('|H(e^{j\omega})|');
title('Relation between DTFT & DFT');
X=fft(x); hold on;
stem(k/32, abs(X),'ro');grid on;