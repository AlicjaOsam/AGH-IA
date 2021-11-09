clear; clc;

im = double(imread('opera.jpg'))/255; 
im = rgb2gray(im);
fim = fft2(im);
%amplituda
A = abs(fim);
%faza
phi = angle(fim);
maxA = max(A,[],'all');
imshow(log(A),[0,log(maxA)]);
%zamiana cwiartek macierzy
imshow(fftshift(log(A)),[0,log(maxA)]);
imshow(phi,[-pi,pi]);

z = A.*exp(1i*phi);
im2 = ifft2(z);
im2 = abs(im2);
imshow(im2);

%zmiana amplitudy jednej ze skladowych funkcji
%A(5,10) = 10^5;
%zmiana fazy jednej ze skladowych funkcji
phi(1,1) = phi(1,1) + pi;
z = A.*exp(1i*phi);
im2 = ifft2(z);
im2 = abs(im2);
imshow(im2);

f = fspecial('average',[9,9]);
[h,w] = size(im);
ff = fft2(f,h,w);
Af = abs(ff);
maxF = max(Af,[],'all');
minF = min(Af,[],'all');
imshow(fftshift(log(Af)),log([minF,maxF]));
imshow(angle(ff),[-pi,pi]);

phi = angle(fim);
A = A.*Af;
z = A.*exp(1i*phi);
im2 = ifft2(z);
im2 = abs(im2);
imshow(im2);

imshow(fftshift(log(A)),[0,log(maxA)]);