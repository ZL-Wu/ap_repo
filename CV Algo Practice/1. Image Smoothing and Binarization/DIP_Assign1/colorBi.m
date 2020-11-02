function output = colorBi(img, r_start, c_start, Sr, Sc, red, green, blue, threshold)
output = img;

for r=r_start:r_start+Sr
    for c=c_start:c_start+Sc
        distR = double(img(r,c,1)-red);
        distG = double(img(r,c,2)-green);
        distB = double(img(r,c,3)-blue);
        distance = sqrt(distR^2 + distG^2 + distB^2);
        
        if distance < threshold
            output(r,c,1) = 255;
            output(r,c,2) = 255;
            output(r,c,3) = 255;
        else
            output(r,c,1) = 0;
            output(r,c,2) = 0;
            output(r,c,3) = 0;
        end
    end
end
end

