function [top,bottom] = getVerEdge(pic)
% 把彩色图片读入，读出字符的上下高度
imgray = rgb2gray(pic);
imshow(imgray);
[r,c] = size(pic);
se = strel('square',10);
op = imopen(imgray,se);
figure,imshow(op);
abdiff = imabsdiff(imgray,op);
figure,imshow(abdiff);
%这个二值化的阈值先设为100看看效果
bw = twovalue(abdiff);
figure,imshow(bw);
%做一次开运算去一下噪点
% bw1 = bwmorph(bw,'open',1);
% figure,imshow(bw1);
%从上至下扫描，寻找大于等于12的上下边界
%count[]是一个一维r列的数组，存放各行的跳变次数
count = [];
for i = 1:r
    times = 0;
    for j = 2:340
        if  bw(i,j) ~= bw(i,j-1)
            times = times + 1;
        end
    end
    count = [count times];
end

%从下到上扫描，就是从最大行开始扫描，从而避开上层更多的干扰细节
i = 2;
PB = 0;
PT = 0;
while i<=r-2 && PT == 0
    cor = r-i+1;
    if PB == 0
        if count(cor-1)>=12 && count(cor-2)>=12 && count(cor)>=12 && count(cor+1)<12
            PB = i;
        end
    else
        if count(cor-1)<12 && count(cor-2)<12 && count(cor)<12 && count(cor+1)>=12
            PT = i;
        end
    end
    i= i+1;
end

top = r-PT+1;
bottom = r-PB+1;
figure,imshow(pic(top:bottom,:,:));
end

    

    