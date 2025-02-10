clc;
clear all;
close all;

%linear convolution
disp("linear convolution"+newline)
x = input("enter 1st sequence");
h = input("enter 2nd sequence");
n1 = length(x);
n2 = length(h);

for i=1:n1
    for j=1:n2
        y(i,i+j-1)=x(i)*h(j);
    end
end
y2 = sum(y);
disp('convoluted signal');
disp(y2);
Y = conv(x,h);
disp('convoluted signal using built in function');
disp(Y);

%circular convolution

disp(newline)
disp('circular convolution')
n = max(n1,n2);
X = [x,zeros(1,n-n1)];
H = [h,zeros(1,n-n2)];
J = zeros(1,n);
for i = 0:n-1
    for j = 0:n-1
        k = mod(i-j,n);
        J(i+1)=J(i+1)+(X(k+1)*H(j+1));
    end
end
disp('circular convolution')
disp(J)
cc = cconv(x,h,n);
disp('circular convolution using inbuilt function');
disp(cc);
plot(J);