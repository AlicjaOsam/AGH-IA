clear;clc;

im = double(imread('kaczki.jpg'))/255;
im = 1 - rgb2gray(im);
im = imclose(im, ones(11));
im(im>0.5) = 1;
im(im<=0.5) = 0;
imshow(im);

%liczba eulera - ilosc dziur na obrazie (bez 1)

% im = bwmorph(im,'remove');
% imshow(im);

%szkielet - jednakowa odleglosc od dwoch krawedzi

sk = bwmorph(im,'skel',Inf);
imshow(sk);
% sk = bwmorph(sk,'endpoints');
% imshow(sk);
sk = bwmorph(sk,'branchpoints');
imshow(sk);

% im = bwmorph(im,'shrink',Inf);
% imshow(im);

% im = bwmorph(im,'thin',Inf);
% imshow(im);

% im = bwmorph(im,'thicken',Inf); %dylatacja bez laczenia obiektow - segmentacj$
% imshow(im);

l = bwlabel(im);
%  imshow(label2rgb(l));
imshow(l==2);

% seg = bwmorph(im,'thicken',Inf);
% l = bwlabel(seg);
imc = double(imread('kaczki.jpg'))/255;
imshow((l==2).*imc);

% d = bwdist(1-im);
% imshow(d,[0,max(d,[],'all')]);

im(:,[1,end]) = 1;
im([1,end],:) = 1;
d = bwdist(im);
imshow(d,[0,max(d,[],'all')]);

l = watershed(d);

%norma czebyszewa
%metryka szachowa
d = bwdist(im,'chessboard');
imshow(d,[0,max(d,[],'all')]);
l = watershed(d);



