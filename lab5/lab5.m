clear;clc;

im = double(imread('kaczki.jpg'))/255;
im = 1 - rgb2gray(im);
im = imclose(im, ones(11));
im(im>0.5) = 1;
im(im<=0.5) = 0;
imshow(im);

% im = bwmorph(im,'remove');
% imshow(im);

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

% im = bwmorph(im,'thicken',Inf);
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

d = bwdist(im,'chessboard');
imshow(d,[0,max(d,[],'all')]);
l = watershed(d);



