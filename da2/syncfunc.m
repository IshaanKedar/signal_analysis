% sync function response

f = -5:.01:5;
X=4*sinc(4*f);
subplot(311);
plot(f,X);
title('SYNC function');
subplot(312);
plot(f,abs(X));
title('Magnitude Response');
subplot(313);
plot(f,angle(X));
title('Frequency Response');
