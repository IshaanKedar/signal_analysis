% pole zero plot of a given transfer function

clc;
clear all;

num = input('type in the numerator coefficients = ');

den = input('type the denomiator coefficeints = ');


[z,p,k] = tf2zp(num,den);

m = abs(p); %finding the distance from origin of poles

disp('zeros are at;');
disp(z);

disp('poles are at');
disp(p);

disp('gain constant');
disp(k);

disp('radius of poles');
disp(m);

sos = zp2sos(z,p,k);

disp('second order sections');
disp(real(sos));

zplane(num,den);

