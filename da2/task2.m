clc
clear all 
close all

chirpdat = load('train.mat');
chirpobj = audioplayer(chirpdat.y,chirpdat.Fs);

audioData = chirpdat.y;
fs = chirpdat.Fs;

% Convert to mono if stereo
if size(audioData, 2) > 1
    audioData = mean(audioData, 2); % Convert stereo to mono by averaging channels
end

% Define time vector
N = length(audioData);
t = (0:N-1) / fs;

% Plot the waveform
subplot(3,1,1);
plot(t, audioData);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Signal');

% Compute FFT
xf = fft(audioData);
f = (0:N-1) * (fs / N); % Frequency axis

% Plot Magnitude Spectrum
subplot(3,1,2);
plot(f(1:N/2), abs(xf(1:N/2))); % Only plot positive frequencies
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum');

% Plot the spectrogram (time-frequency analysis)
subplot(3,1,3);
spectrogram(audioData, 256, 250, 256, fs, 'yaxis');
title('Spectrogram');
