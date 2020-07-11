function I = twovalue(img)
[r,c] = size(img);
I = img;
for i = 1:r
    for j = 1:c
        if img(i,j)>=25
            I(i,j)=1;
        else
            I(i,j)=0;
        end
    end
end
I = logical(I);
end