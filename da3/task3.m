% Load ECG signal
clc
clear
close all
ecg_signal = load('ecg_hfn.data.txt');
fs = 1000;  % Sampling frequency in Hz
t = (0:length(ecg_signal)-1)/fs;  % Time vector

% Butterworth filters
butter_orders = [2, 4, 6, 8];
butter_cutoffs = [10, 20, 40, 70];
figure;
subplot(5, 1, 1);
plot(t, ecg_signal);
title('Original ECG Signal');
xlabel('Time (s)'); ylabel('Amplitude');
for i = 1:length(butter_orders)
    [b, a] = butter(butter_orders(i), butter_cutoffs(i)/(fs/2), 'low');
    filtered_signal = filter(b, a, ecg_signal);
    
    subplot(5, 1, i+1);
    plot(t, filtered_signal);
    title(['Filtered ECG Signal (Butterworth Order ', num2str(butter_orders(i)),' fc: ',num2str(butter_cutoffs(i)),')']);
    xlabel('Time (s)'); ylabel('Amplitude');
end

% Chebyshev Type-1 and Type-2 filters
cheby_orders = 2:1:8;
cheby_cutoffs = linspace(5,100,7);
figure;
subplot(8, 1, 1);
plot(t, ecg_signal);
title('Original ECG Signal');
xlabel('Time (s)'); ylabel('Amplitude');
for i = 1:length(cheby_orders)
    [b1, a1] = cheby1(cheby_orders(i), 0.5, cheby_cutoffs(i)/(fs/2), 'low');
    
    filtered_signal1 = filter(b1, a1, ecg_signal);
    
    
    subplot(8, 1, i+1);
    plot(t, filtered_signal1);
    title(['Chebyshev Type-1 Order ', num2str(cheby_orders(i)),' fc: ',num2str(cheby_cutoffs(i))]);
    xlabel('Time (s)'); ylabel('Amplitude');
    
    
end
cheby_orders = 2:1:8;
cheby_cutoffs = linspace(5,100,7);
figure;
subplot(8, 1, 1);
plot(t, ecg_signal);
title('Original ECG Signal');
xlabel('Time (s)'); ylabel('Amplitude');
for i = 1:length(cheby_orders)
    
    [b2, a2] = cheby2(cheby_orders(i), 20, cheby_cutoffs(i)/(fs/2), 'low');
    
    filtered_signal2 = filter(b2, a2, ecg_signal);
   
    
    subplot(8, 1, i+1);
    plot(t, filtered_signal2);
    title(['Chebyshev Type-2 Order ', num2str(cheby_orders(i)),' fc: ', num2str(cheby_cutoffs(i))]);
    xlabel('Time (s)'); ylabel('Amplitude');
end
