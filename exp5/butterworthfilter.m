clc
clear 
close
fp = 3500;fs = 4500;
%lowpass
wp = 2*pi*fp;ws = 2*pi*fs;
[n,wn] = buttord(wp,ws,0.5,30,'s');
[b,a] = butter(n,wn,'s');
wa = 0:(3*ws)/511:3*ws;
h = freqs(b,a,wa);

subplot(2,2,1);

plot(wa/(2*pi),20*log10(abs(h)));grid;
title('lowpass');
axis([0 3*fs -60 5]);
%highpass
[b,a] = butter(n,wn,'high','s');
h2 = freqs(b,a,wa);
subplot(2,2,2);
plot(wa/(2*pi),20*log10(abs(h2)));grid;
title('high pass filter');
axis([0 3*fs -60 5]);

%bandpass
fp = 3000;fs = 6000;
wp = 2*pi*fp;ws = 2*pi*fs;
wn = [wp,ws];
[n] = buttord(wp,ws,0.5,30,'s');
[b,a] = butter(n,wn,'s');
wa = 0:(3*ws)/511:3*ws;
h3 = freqs(b,a,wa);
subplot(2,2,3);
plot(wa/(2*pi),20*log10(abs(h3)));grid;
title('band pass')
axis([0 3*fs -60 5]);

%bandstop
fp = 300;fs = 6000;
wp = 2*pi*fp;ws = 2*pi*fs;
[n] = buttord(wp,ws,0.5,30,'s');
[b,a] =butter(n,wn,'stop','s');
wa = 0:(3*ws)/511:3*ws;
h4 = freqs(b,a,wa);
subplot(2,2,4);
plot(wa/(2*pi),20*log10(abs(h4)));grid;
title('bandstop');
axis([0 3*fs -60 5]);
