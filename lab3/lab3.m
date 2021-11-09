clear; clc;

im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
subplot(1,2,1);
imshow(im);

%rozmycie - filtry dolnoprzepustowe
im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
s = 3;
f = ones(s)/s^2;
im = imfilter(im,f);
subplot(1,2,2);
imshow(im);

%wyostrzenie filtry gornoprzepustowe
im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
f = -ones(s);
f((s+1)/2,(s+1)/2) = s^2;
im = imfilter(im,f);
subplot(1,2,2);
imshow(im);

%wykrycie krawedzi
im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
f = -ones(s);
f((s+1)/2,(s+1)/2) = s^2-1;
im = imfilter(im,f);im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
subplot(1,2,2);
imshow(im);


%rozmycie - filtry dolnoprzepustowe
im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
s = 3;
f = ones(s)/s^2;
im = imfilter(im,f);
subplot(1,2,1);
imshow(im);
%filtracja medianowa;
im = medfilt2(im,[3,3]);
subplot(1,2,2);
imshow(im);

%czarno-bialy
im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
imb = im;im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
imb = im;
imb(imb<.5) = 0;
imb(imb>=.5) = 1;
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(imb);
imb(imb<.5) = 0;
imb(imb>=.5) = 1;
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(imb);

%srednia jasnosc obrazu
im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
t = mean(im, 'all');
imb = im;
imb(imb<t) = 0;
imb(imb>=t) = 1;
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(imb);

im = double(imread('zubr.jpg'))/255;
im = 1 - rgb2gray(im);
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imhist(im);

%otsu
t = graythresh(im);
imb = im;
imb(imb<t) = 0;
imb(imb>=t) = 1;
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(imb);

%binaryzacja adaptive dobra dla teksu
t = graythresh(im);
imb = imbinarize(im, 'adaptive');   
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(imb);

%binaryzacja
t = graythresh(im);
imb = imbinarize(im);   
subplot(1,2,1);
imshow(im);
subplot(1,2,2);
imshow(imb);

%erozja
s = 3;
imb = imerode(imb,ones(s));
subplot(1,2,1);
imshow(imb);
%dylatacja
imb = im;
imb = imbinarize(im);   
imb = imdilate(imb, ones(s));
subplot(1,2,2);
imshow(imb);

%erozja i dylatacja
imb = im;
imb = imbinarize(im);   
s = 3;
imb = imerode(imb,ones(s));
subplot(1,2,1);
imshow(imb);
imb = imdilate(imb, ones(s));
subplot(1,2,2);
imshow(imb);

%otwarcie
imb = im;
imb = imbinarize(im);   
s = 3;
imb = imopen(imb,ones(s));
subplot(1,2,1);

%dylatacja i erozja
imb = im;
imb = imbinarize(im);   
s = 3;
imb = imdilate(imb,ones(s));
subplot(1,2,1);
imshow(imb);
imb = imerode(imb, ones(s));
subplot(1,2,2);
imshow(imb);

%otwarcie
imb = im;
imb = imbinarize(im);   
s = 3;
imb = imopen(imb,ones(s));
subplot(1,2,1);

%zamkniecie
imb = im;
imb = imbinarize(im);   
s = 3;
imb = imclose(imb,ones(s));
subplot(1,2,2);

%filtracja
%fspecial