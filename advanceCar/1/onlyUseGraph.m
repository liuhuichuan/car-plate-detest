function [statusaftcbn,bestid] = onlyUseGraph(img,wthe,lthe)
 
imgray = rgb2gray(img);

[r,c] = size(imgray);

medgray = medfilt2(imgray,[4,4]);

se = strel('square',10);
op = imopen(medgray,se);

abdiff = imabsdiff(medgray,op);

% bw = twovalue(abdiff);
eggray = Sobel(abdiff);
% bwedge = edge(abdiff,'canny');
% bwedge = edge(bw,'sobel');

bwedge =twovalue(eggray);

clsimg = bwmorph(bwedge,'close',3);


opimg = bwmorph(clsimg,'open',3);
% test

[L,num1] = bwlabel(opimg);
status1 = regionprops(opimg,'BoundingBox');
centroid = regionprops(opimg,'Centroid');
cbnstatus = combine(status1,centroid,num1,wthe,lthe);


 
cbnrctg = paintrctg(opimg,cbnstatus,num1);

statusaftcbn = regionprops(cbnrctg,'BoundingBox');
[aftcbnL,num2] = bwlabel(cbnrctg);
% figure,imshow(cbnrctg);
bestid = getnum(statusaftcbn,num2);
figure,imshow(img);

hold on
rectangle('Position',statusaftcbn(bestid).BoundingBox,'FaceColor','r');
statusaftcbn(bestid).BoundingBox