%audio spectral analysis

whaleFile = "C:\Users\ishaa\Downloads\sem6\dsplabcodes\da2\bluewhale.au.au";
[x,fs] = audioread(whaleFile);
subplot(311);
plot(x);
xlabel('Sample Number');
ylabel('Amplitude');
title('Sample signal');
moan = x(2.45e4:3.10e4);
t = 10*(0:1/fs:(length(moan)-1)/fs);
subplot(312);
plot(t,moan)
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Single Moan');
xlim([0 t(end)]);
m = length(moan); % original sample length
n = pow2(nextpow2(m)); % transform length
y = fft(moan,n); % DFT of signal
f = (0:n-1)*(fs/n)/10;
power = abs(y).^2/n;
subplot(313);
plot(f(1:floor(n/2)),power(1:floor(n/2)));
xlabel('Frequency');
ylabel('Power');
title('Power Spectrum');