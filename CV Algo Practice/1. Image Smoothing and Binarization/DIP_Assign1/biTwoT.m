function output = biTwoT(img, threshold1, threshold2, r_start, c_start, Sr, Sc)
output = img;
for r=r_start:r_start+Sr
    for c=c_start:c_start+Sc
        if img(r,c) > threshold1 && img(r,c) < threshold2
            output(r,c) = 255;
        else
            output(r,c) = 0;
        end
    end
end
end
