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

%wsp. Malinowskiej - porownujemy figury do kola
%wsp. Blair-Blim - odleglosc pikseli od srodka (dla kola najmniejsza)
%wsp. Daniellsona - srednia odleglosc od krawedM = zeros(n, length(fun));zi (dl$
%wsp. Haralicka - odleglosc krawedzi od srodka
%wsp. Feretta - stosunek rozpietosci osi x i y

% AO5RBlairBliss(prop.Image)
%
% a = regionprops(im, 'all');
% a(1).Image;
% % fun = {@AO5 , @AO5}
% %fun{1}(a(2).Image);
% M = zeros(n, length(fun));

a = regionprops(im, 'all');
fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
M = zeros(n, length(fun));

for i = 1:8
    for j = 1:length(fun)
        M(i, j) = fun{j}(a(i).Image);
    end
end

%LAB 7
% %nietypowe wartosci (ostatni wiersz), ktore kaczki odbiegaja od reszty
% m = mean(M);
% s = std(M);
% out = abs(M-m)./s;
% out = out>1.8;
% out = max(out,[],2);
% %usuwamy elementy nietypowe
% M(out,:) = [];

im = double(imread('ptaki2.jpg'))/255;

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
% imshow(imb);

b = imbinarize(im(:,:,3));
g = imbinarize(im(:,:,2));
r = imbinarize(im(:,:,1));

% subplot(3,1,1);
% imshow(r);
% subplot(3,1,2);
% imshow(g);
% subplot(3,1,3);
% imshow(b);

im = ~b;

% im = imopen(im, ones(2));
% im = imclose(im, ones(2));

imshow(im);

l = bwlabel(im);
% imshow(im);
n = max(l, [], 'all');
% prop = regionprops(l==4, 'all');
% prop.Area;

a = regionprops(im, 'all');
fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
M2 = zeros(n, length(fun));

for i = 1:n
    for j = 1:length(fun)
        M2(i, j) = fun{j}(a(i).Image);
    end
end

for i=1:size(M2,1)
    Area(i) = a(i).Area;
end
out = Area < 900;
M3 = M2(out,:);
M2(out,:) = [];
n = size(M, 1);
n2 = size(M2, 1);
n3 = size(M3, 1);

in = [M', M2', M3'];
out = [repmat([1;0;0], [1,n]), repmat([0;1;0], [1,n2]), repmat([0;0;1], [1,n3])];

% %siec neuronowa
nn = feedforwardnet;
nn = train(nn, in, out);

% nn(in(:,1))
% nn(in)

