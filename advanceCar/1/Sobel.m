function [G] = Sobel(Image)
Image = double(Image);
h = [-1 -2 -1;0 0 0;1 2 1];
Gy= filter2(h',Image);
G=255*Gy./max(Gy(:));
G=uint8(G);
end