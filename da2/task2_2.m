clc;
clear;
close all;

% Read an audio file (Replace 'your_audio.wav' with actual file)


chirpdat = load('train.mat');
audio_signal = chirpdat.y
fs = chirpdat.Fs;
% Extract a single channel if stereo
if size(audio_signal, 2) > 1
    audio_signal = mean(audio_signal, 2); % Convert to mono if stereo
end

% Plot time-domain signal
t = (0:length(audio_signal)-1) / fs;
subplot(3,1,1);
plot(t, audio_signal);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Time-Domain Audio Signal');

% Perform FFT
N = length(audio_signal);
nfft = 2^nextpow2(N); % Zero-padding to nearest power of 2
fft_audio = fft(audio_signal, nfft);
frequencies = (0:nfft-1) * (fs / nfft); % Frequency axis

% Plot Magnitude Spectrum
subplot(3,1,2);
plot(frequencies(1:nfft/2), abs(fft_audio(1:nfft/2)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum');

% Plot Power Spectrum (Magnitude Squared)
power_spectrum = abs(fft_audio).^2 / N;
subplot(3,1,3);
plot(frequencies(1:nfft/2), power_spectrum(1:nfft/2));
xlabel('Frequency (Hz)');
ylabel('Power');
title('Power Spectrum');

% Play the audio (optional)
sound(audio_signal, fs);
