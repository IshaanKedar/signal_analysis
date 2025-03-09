% design of butterworth loww apss and high pass filter using bilinear
% tranformation

clc
clear
close 

disp("enter the iir filter specifications");
ap = input("enter the passpband ripple");
as = input("enter the stopband ripple");

wp = input("enter the passband frequency");
ws = input("enter the stopband frequency");

t = input("enter the sampling time");

[n,wc] = buttord(wp,ws,ap,as,'s');
ch = input('give the type of filter 1:LPF 2:HPF 2:BPF 4:BSF');
switch ch
    case 1
        disp("Frequency response of butterworth iir lpf is:");
        [bn,an]=butter(n,1,"s");
        disp("normalized tf is:");
        hsn = tf(bn,an);
        [b,a] = butter(n,wc,'S')
        disp("unnormalized transfer function is:");
        hs = tf(b,a)
        [num,den] = bilinear(b,a,1/t);
        disp("digital ts is");
        hz = tf(num,den,1/t)

        w = 0:pi/16:pi;
        disp("freq response is:");
        hw = freqz(num,den,w)

        disp("magnitude response is");
        hw_mag = abs(hw)
        
        plot(w/pi,hw_mag);
        grid;
        title('magnitude reponse of the desired butteworth lpf')
        xlabel('--> Normalized frequency in Hz');
        ylabel('--> Magnitude in dB');


    case 2
        disp('frequency response of butterworth iit hpf:');
        [bn,an] = butter(n,1,'S');
        disp('normalized tf is,')
        Hsn=tf(bn,an)
        [b,a]=butter(n,wc,'high','S');
        disp('unnormalized tf is,')
        Hs=tf(b,a)
        [num,den]=bilinear(b,a,1/t);
        disp('digital tf is,')
        Hz=tf(num,den,t)
        w=0:pi/16:pi;
        disp('freq response is,')
        Hw=freqz(num,den,w)
        disp('magnitude response is,')
        Hw_mag=abs(Hw)
        
        plot(w/pi,Hw_mag,'k');
        grid;
        title('Magnitude Response of the desired Butterworth LPF')
        xlabel('--> Normalized frequency in Hz');

        ylabel('--> Magnitude in dB');
end
