% design of butterworth low pass and high pass filter using impulse
% invariant method

clc;
clear;
close;
disp('enter the IIR filter design specifications');
Ap=input('enter the passband ripple in db');
As=input('enter the stopband ripple in db');
wp=input('enter the passband freq');
ws=input('enter the stopband freq');
T=input('enter the sampling time');
[N,wc]=buttord(wp,ws,Ap,As,'s'); % Find the order n and cutoff frequency%
ch=input('give type of filter 1:LPF,2:HPF');
switch ch
    case 1
        disp('Frequency response of Butterworth IIR LPF is:');
        [bn,an]=butter(N,1,'S');
        disp('normalized tf is,')
        Hsn=tf(bn,an)
        [b,a]=butter(N,wc,'S');
        disp('unnormalized tf is,')
        Hs=tf(b,a)
        [num,den]=impinvar(b,a,1/T);
        disp('digital tf is,')
        Hz=tf(num,den,T)
        w=0:pi/16:pi;
        disp('freq response is,')
        Hw=freqz(num,den,w)
        disp('magnitude response is,')

        Hw_mag=abs(Hw)
        plot(w/pi,Hw_mag,'k');
        grid;
        title('Magnitude Response of the desired Butterworh LPF')
        xlabel('--> Normalized frequency in Hz');
        ylabel('--> Magnitude in dB');
        %HIGH PASS FILTER%
    case 2
        disp('Frequency response of Butterworth IIR HPF is:');
        [bn,an]=butter(N,1,'S');
        disp('normalized tf is,')
        Hsn=tf(bn,an)
        [b,a]=butter(N,wc,'high','S');
        disp('unnormalized tf is,')
        Hs=tf(b,a)
        [num,den]=impinvar(b,a,1/T);
        disp('digital tf is,')
        Hz=tf(num,den,T)
        w=0:pi/16:pi;
        disp('freq response is,')
        Hw=freqz(num,den,w)
        disp('magnitude response is,')
        Hw_mag=abs(Hw)
        plot(w/pi,Hw_mag,'k');
        grid;
        title('Magnitude Response of the desired Butterworh HPF')
        xlabel('--> Normalized frequency in Hz');
        ylabel('--> Magnitude in dB');
end

