%frequency of samples in dtft

w = -4*pi:8*pi/511:4*pi;
num = input("enter the numerator");
den = input('enter the denominator');

h = freqz(num,den,w);

%plotting the dtft
figure;
subplot(2,1,1);
plot(w/pi,real(h));grid on;
title('real part of h(e^{j\omega})');
xlabel('\omega /\pi');
ylabel('Amplitude');

subplot(2,1,2);
plot(w/pi,imag(h));grid on;
title('Imaginary part of h(e^{j\omega})');

xlabel('\omega /\pi');
ylabel('Amplitude');

figure;
subplot(2,1,1);
plot(w/pi,abs(h));grid on;
title('magnitude spectrum |h(e^{j\omega})|');
xlabel('\omega /\pi');
ylabel('Amplitude');
subplot(2,1,2);
plot(w/pi,angle(h));grid on;
title('phase spectrum h(e^{j\omega})');
xlabel('\omega /\pi');
ylabel('phase in radians');
