clear;clc;

im = double(imread('ptaki.jpg'))/255;
% im = 1 - rgb2gray(im);

imr = im;
imr(:,:,[2,3]) = 0;

img = im;
img(:,:,[1,3]) = 0;

imb = im;
imb(:,:,[1,2]) = 0;

% subplot(3,1,1);
% imshow(imr);
% subplot(3,1,2);
% imshow(img);
% subplot(3,1,3);

b = imbinarize(im(:,:,3));
r = imbinarize(im(:,:,1));

im = ~b | r;

im = imopen(im, ones(7));
im = imclose(im, ones(7));

imshow(im);

l = bwlabel(im);
n = max(l, [], 'all');
prop = regionprops(l==4, 'all');
prop.Area;

subplot(2,1,1);
imshow(prop.Image);
subplot(2,1,2);
imshow(l==4);

% AO5RBlairBliss(prop.Image)
%
% a = regionprops(im, 'all');
% a(1).Image;
% % fun = {@AO5 , @AO5}
% %fun{1}(a(2).Image);
% M = zeros(n, length(fun));

a = regionprops(im, 'all');
fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, $
M = zeros(n, length(fun));

for i = 1:8
    for j = 1:length(fun)
        M(i, j) = fun{j}(a(i).Image);
    end
end
