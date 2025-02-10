%chebychev

fp = 3500;fs = 4500;

wp = 2*pi*fp;ws = 2*pi*fs;

[n,wn] = cheb2ord(wp,ws,0.5,30,'s');
[b,a] = cheby2(n,30,wn,'s');
wa = 0:(3*ws)/511:3*ws;
h = freqs(b,a,wa);
subplot(2,2,1);
plot(wa/(2*pi),20*log10(abs(h)));grid
title('low pass');
axis([0 3*fs -60 5]);


%highpass

fp = 3500;fs = 4500;

wp = 2*pi*fp;ws = 2*pi*fs;

[n,wn] = cheb2ord(wp,ws,0.5,30,'s');
[b,a] = cheby2(n,30,wn,'high','s');
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

[n] = cheb2ord(wp,ws,0.5,30,'s');
[b,a] = cheby2(n,30,wn,'stop','s');
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

[n] = cheb2ord(wp,ws,0.5,30,'s');
[b,a] = cheby2(n,30,wn,'s');
wa = 0:(3*ws)/511:3*ws;
h = freqs(b,a,wa);
subplot(2,2,4);
plot(wa/(2*pi),20*log10(abs(h)));grid
title('bandpass');
axis([0 3*fs -100 5]);






