%frequency of samples in dtft

w = -pi:2*pi/255:pi;
num = input("enter sequence");
D = 10;


h1 = freqz(num,1,w);
h2 = freqz([zeros(1,D) num], 1,w);


%plotting the dtft
figure;
subplot(2,1,1);
plot(w/pi,abs(h1));grid on;
title('magnitude spectrum of original sequence');
xlabel('\omega /\pi');
ylabel('Amplitude');

subplot(2,1,2);
plot(w/pi,abs(h2));grid on;
title('magnitude spectrum of time shifted sequence');

xlabel('\omega /\pi');
ylabel('Amplitude');

figure;
subplot(2,1,1);
plot(w/pi,angle(h1));grid on;
title('phase spectrum of original sequence');
xlabel('\omega /\pi');
ylabel('Amplitude');
subplot(2,1,2);
plot(w/pi,angle(h2));grid on;
title('phase spectrum of time shifted sequence');
xlabel('\omega /\pi');
ylabel('phase in radians');

