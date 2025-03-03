% fft usage example

n = [0:29];
x = cos(2*pi*n/10);

N1 = 64;
N2 = 128;
N3 = 256;
N4 = 30;

x1 = abs(fft(x,N1));
x2 = abs(fft(x,N2));
x3 = abs(fft(x,N3));
x4 = abs(fft(x,N4));

%noramlize
f0 = [0 : 29]/30;
f1 = [0 : N1-1]/N1;
f2 = [0 : N2-1]/N2;
f3 = [0 : N3-1]/N3;
f4 = [0 : N4-1]/N4;
figure(1);

subplot(4,1,1);
plot(f1,x1,'-x'),title('N=64'),axis([0 1 0 20]);
subplot(4,1,2);
plot(f2,x2,'-x'),title('N=128'),axis([0 1 0 20]);
subplot(4,1,3);
plot(f3,x3,'-x'),title('N=256'),axis([0 1 0 20]);
subplot(4,1,4);
plot(f4,x4,'-x'),title('N=30'),axis([0 1 0 20]);

figure;
plot(f0,x);



