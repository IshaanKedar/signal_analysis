%initialize

N = 200;  %length of signal no of smaples in x[n]
L = 256;  %length of dft
nn = 0:N-1;
kk = 0:L-1;
% the signal x

xr = [0.1*(1:100) zeros(1,N-100)];  %real part 
xi = [zeros(1.N)]; %imaginary part
x = xr+xi;

%freqz bulit in for dtft 
% fft is built in function for dft

