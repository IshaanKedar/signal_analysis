clc;
clear all;

t = 0:1:1000;

for i = 1:length(t)
    if(t(i)>=100 && t(i)<=900)
        amplitude = 1;
        y(i) = amplitude;
    else
        amplitude = 0;
        y(i) = amplitude;
    end
end



for i = 1:length(t)
    if(t(i)>= 200 && t(i)<=800)
        amplitude = 1;
        y2(i) = amplitude;
    else
        amplitude = 0;
        y2(i) = amplitude;
    end
end

for i = 1:length(t)
    if(t(i)>= 400 && t(i)<=600)
        amplitude = 1;
        y3(i) = amplitude;
    else
        amplitude = 0;
        y3(i) = amplitude;
    end
end


figure;

plot(t,y,LineWidth=1.5);
hold on;
plot(t,y2,LineWidth=1.5);
plot(t,y3,LineWidth=1.5);
hold off;

z1 = xcorr(y,y);
z2 = xcorr(y2,y2);
z3 = xcorr(y3,y3);

figure;
subplot(1,2,1);
plot(y);
title('signal')
hold on;
plot(y2);
plot(y3);
hold off;
subplot(1,2,2);
plot(z1);
title('autocorr of signal')
hold on;
plot(z2);
plot(z3);






