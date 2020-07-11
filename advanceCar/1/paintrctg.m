function rctg = paintrctg(img,status,m)
rctg = img;
for i = 1:m
    x=int16(status(i).BoundingBox(1));
    y=int16(status(i).BoundingBox(2));
    xl=int16(status(i).BoundingBox(3));
    yl=int16(status(i).BoundingBox(4));
    for dx = 1:xl
        for dy = 1:yl
            rctg(y+dy-1,x+dx-1)=1;
        end
    end
end