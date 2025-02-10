%elliptical

fp = 3500;fs = 4500;

wp = 2*pi*fp;ws = 2*pi*fs;

[n,wn] = ellipord(wp,ws,3,60,'s');
[b,a] = ellip(n,3,60,wn,'s');
wa = 0:(3*ws)/511:3*ws;
h = freqs(b,a,wa);
subplot(2,2,1);
plot(wa/(2*pi),20*log10(abs(h)));grid
title('low pass');
axis([0 3*fs -60 5]);


%highpass

fp = 3500;fs = 4500;

wp = 2*pi*fp;ws = 2*pi*fs;

[n,wn] = ellipord(wp,ws,3,60,'s');
[b,a] = ellip(n,3,60,wn,'high','s');
wa = 0:(3*ws)/511:3*ws;
h = freqs(b,a,wa);
subplot(2,2,2);
plot(wa/(2*pi),20*log10(abs(h)));grid
title('highpass');
axis([0 3*fs -60 5]);

%bandpass

fp = 3000;fs = 6000;

wp = 2*pi*fp;ws = 2*pi*fs;

[wn] = [wp,ws];

[n] = ellipord(wp,ws,3,60,'s');
[b,a] = ellip(n,3,60,wn,'stop','s');
wa = 0:(3*ws)/511:3*ws;
h = freqs(b,a,wa);
subplot(2,2,3);
plot(wa/(2*pi),20*log10(abs(h)));grid
title('bandstop');
axis([0 3*fs -200 5]);


%bandpass
fp = 3000;fs = 6000;

wp = 2*pi*fp;ws = 2*pi*fs;

[wn] = [wp,ws];

[n] = ellipord(wp,ws,3,60,'s');
[b,a] = ellip(n,3,60,wn,'s');
wa = 0:(3*ws)/511:3*ws;
h = freqs(b,a,wa);
subplot(2,2,4);
plot(wa/(2*pi),20*log10(abs(h)));grid
title('bandpass');
axis([0 3*fs -100 5]);






