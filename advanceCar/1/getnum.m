function num = getnum(status,m)
min = 100;
for i = 1:m
    l = status(i).BoundingBox(3);
    w = status(i).BoundingBox(4);
    C = 2*(l+w);
    S = l*w;
    F = abs(1-(4*58*58/44/14)*S/C/C);
    if F < min && l>w
        min = F;
        num = i;
    end
end
end