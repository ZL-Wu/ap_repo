function output = uSmooth(img, r_start, c_start, Sr, Sc)
output = img;
r_ROI = [r_start, r_start+Sr];
c_ROI = [c_start, c_start+Sc];

for r=r_start:r_start+Sr
    for c=c_start:c_start+Sc
        if ismember(r, r_ROI) || ismember(c, c_ROI)
%                 output(r, c) = 0;
        else
            window = img(r-1:r+1, c-1:c+1);
            output(r,c) = sum(window(:))/9;
        end
    end
end

end

