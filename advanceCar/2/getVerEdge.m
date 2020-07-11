function [top,bottom] = getVerEdge(pic)
% �Ѳ�ɫͼƬ���룬�����ַ������¸߶�
imgray = rgb2gray(pic);
imshow(imgray);
[r,c] = size(pic);
se = strel('square',10);
op = imopen(imgray,se);
figure,imshow(op);
abdiff = imabsdiff(imgray,op);
figure,imshow(abdiff);
%�����ֵ������ֵ����Ϊ100����Ч��
bw = twovalue(abdiff);
figure,imshow(bw);
%��һ�ο�����ȥһ�����
% bw1 = bwmorph(bw,'open',1);
% figure,imshow(bw1);
%��������ɨ�裬Ѱ�Ҵ��ڵ���12�����±߽�
%count[]��һ��һάr�е����飬��Ÿ��е��������
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

%���µ���ɨ�裬���Ǵ�����п�ʼɨ�裬�Ӷ��ܿ��ϲ����ĸ���ϸ��
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

    

    