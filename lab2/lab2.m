clear; clc;

im = imread('zubr.jpg');
im = double(im)/255;
h = 2;
w = 2;
i = 1;
subplot(h,w,i); 
i = i+1;
imshow(im);
subplot(h,w,i); 
imshow(1-im);

imr = im;
imr(:,:,[2,3]) = 0;

img = im;
img(:,:,[1,3]) = 0;

imb = im;
imb(:,:,[1,2]) = 0;

subplot(3,1,1);
imshow(imr);
subplot(3,1,2);
imshow(img);
subplot(3,1,3);
imshow(imb);

subplot(3,2,1);
imshow(im(:,:,1));
subplot(3,2,2);
imhist(im(:,:,1));
subplot(3,2,3);
imshow(im(:,:,2));
subplot(3,2,4);
imhist(im(:,:,2));
subplot(3,2,5);
imshow(im(:,:,3));
subplot(3,2,6);
imhist(im(:,:,3));

im = mean(im,3);
imshow(im);

%rgb2gray
YUV = [.299, .587, .114];
YUV = permute(YUV,[1,3,2]);

im = im.*YUV;
im = sum(im,3);
subplot(1,2,1);
imshow(im(:,:,1));
subplot(1,2,2);
imhist(im(:,:,1));

%jasnosc
b = .2;
imb = im + b;
imb(imb>1) = 1;
imb(imb<0) = 0;

x = 0:1/255:1;
y = x + b;
y(y>1) = 1;
y(y<0) = 0;
plot(x,y);
ylim([0,1]);

subplot(4,3,1);
imshow(imb(:,:,1));
subplot(4,3,2);
imhist(imb(:,:,1));
subplot(4,3,3);
plot(x,y);
ylim([0,1]);

%kontrast
c = .5;
imc = im*c;
imc(imc>1) = 1;

x = 0:1/255:1;
y = x * c;
y(y>1) = 1;
y(y<0) = 0;

subplot(4,3,4);
imshow(imc(:,:,1));
subplot(4,3,5);
imhist(imc(:,:,1));
subplot(4,3,6);
plot(x,y);
ylim([0,1]);

%przesuwanie wokol punktu
%im = (im-.5)*c+.5;
%im*c-.5*c+.5;

%gamma
g = .5;
img = im.^(1/g);

x = 0:1/255:1;
y = x .^ (1/g);
y(y>1) = 1;
y(y<0) = 0;

subplot(4,3,7);
imshow(img(:,:,1));
subplot(4,3,8);
imhist(img(:,:,1));
subplot(4,3,9);
plot(x,y);
ylim([0,1]);

%im = c*im.^(1/g)+b;

%wyrownanie histogramu
imh = histeq(im);
subplot(4,3,10);
imshow(im(:,:,1));
subplot(4,3,11);
imhist(imh(:,:,1));
