clc
clear all;

t = 0:1:1000;

for i = 1:length(t)
    if(t(i)>=100 && t(i)<=300)
        amplitude = 1;
        y(i) = amplitude;
    else
        amplitude = 0;
        y(i) = amplitude;
    end
end



for i = 1:length(t)
    if(t(i)>= 200 && t(i)<=800)
        amplitude = 1.5;
        y2(i) = amplitude;
    else
        amplitude = 0;
        y2(i) = amplitude;
    end
end
figure;
subplot(1,2,1);
plot(t,y);
hold on;
plot(t,y2);
hold off;

z = xcorr(y,y2);
disp('crosscorrelation')


subplot(1,2,2);
plot(z);




