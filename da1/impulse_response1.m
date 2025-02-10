% compute the impulse response for a causal lti system whose input x[n] and
% output y[n] are related by the difference euqtion 
clc;
clear all;
close all;

prompt1 = ('enter the denomitator coefficients');
a = input(prompt1);
prompt2 = ('enter the numerator coefficients');
b = input(prompt2);

n = (0:1:50);
impulse = n ==0;
for i = 1:length(n)
    if(i>0 && i<15)
        x(i) = 1;  %input signal u[n]-u[n-15]
    else
        x(i) = 0;
    end
end


subplot(1,2,1);
stem(n, impulse);
title('impulse signal');
xlabel('n');
ylabel('\delta[n]');
y = filter(b,a,x);
length(y)
length(n)
subplot(1,2,2);
stem(n,y);
title('impulse response');
xlabel('n');
ylabel('y[n]');

