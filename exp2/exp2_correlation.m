% correlation

clc;
clear all;
close all;

x = input('enter 1st sequence');
h = input('enter 2nd sequence');
n1 = length(x);
n2 = length(h);

H = fliplr(h);

Y = zeros(1,n1+n2-1);

for i=1:n1
    for j=1:n2
        Y(i+j-1)=Y(i+j-1)+(x(i)*H(j));
    end
end
disp('correlation');
disp(Y);
corr = xcorr(x,h);
disp('correlation using inbuilt function');
disp(corr);

%correlation of signals

gongdat = load('gong.mat');
gongobj = audioplayer(gongdat.y,gongdat.Fs);

chirpdat = load('chirp.mat');
chirpobj = audioplayer(chirpdat.y,chirpdat.Fs);
playblocking(gongobj);
playblocking(chirpobj);



A = conv(gongdat.y,chirpdat.y);
B = xcorr(gongdat.y,chirpdat.y);

figure;
subplot(2,2,1);
grid on;
plot(gongdat.y);
title('gong');

subplot(2,2,2);
grid on;
plot(chirpdat.y);
title('chirp');
subplot(2,2,3);
grid on;
plot(A);
title('convolved');
subplot(2,2,4);
grid on;
plot(B);
title('correlated signal');


