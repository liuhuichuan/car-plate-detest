function cbnstatus = combine(status,centroid,num,wthe,lthe)
cbnstatus = status;
for i = 1:num-1
    for j =i+1:num
        hfw1 = int16(status(i).BoundingBox(3))/2;
        hfl1 = int16(status(i).BoundingBox(4))/2;
        hfw2 = int16(status(j).BoundingBox(3))/2;
        hfl2 = int16(status(j).BoundingBox(4))/2;
        interw = abs(int16(centroid(j).Centroid(1)-centroid(i).Centroid(1)));
        interl = abs(int16(centroid(j).Centroid(2)-centroid(i).Centroid(2)));
        if interw < hfw1+hfw2+wthe && interl < hfl1+hfl2+lthe
            cbnstatus(i).BoundingBox(1)=min([status(i).BoundingBox(1),status(j).BoundingBox(1)]);
            cbnstatus(i).BoundingBox(2)=min([status(i).BoundingBox(2),status(j).BoundingBox(2)]);
            cbnstatus(i).BoundingBox(3)=interw+hfw1+hfw2;
            cbnstatus(i).BoundingBox(4)=interl+hfl1+hfl2;
            cbnstatus(j).BoundingBox(1)=min([status(i).BoundingBox(1),status(j).BoundingBox(1)]);
            cbnstatus(j).BoundingBox(2)=min([status(i).BoundingBox(2),status(j).BoundingBox(2)]);
            cbnstatus(j).BoundingBox(3)=interw+hfw1+hfw2;
            cbnstatus(j).BoundingBox(4)=interl+hfl1+hfl2;
        end
    end
end
end