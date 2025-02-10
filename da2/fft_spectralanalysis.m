% fast fourier transform for spectral analysis
N = 250;
ts = .0004;
deltaf = 1/(N*ts);
t = [0:N-1]*ts;
x = cos(2*pi*100*t)+cos(2*pi*500*t);
subplot(311);
plot(t,x);
title('cosine signal');
xf = fft(x);
f=[0:N-1]*deltaf;
subplot(312);
plot(f,abs(xf));
title('mag of fourier transform')
xf_shift = fftshift(xf);
subplot(313);
plot([-N/2:N/2-1]*deltaf, abs(xf_shift));
title('shifted plot');
