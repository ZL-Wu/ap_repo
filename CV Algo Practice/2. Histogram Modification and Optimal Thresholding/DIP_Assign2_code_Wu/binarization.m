function output = binarization(img,ROI,thresholds)
output = img;
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    
    T = thresholds(i);
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            p = output(r,c);
            if p <= T
                output(r,c) = 0;
            else
                output(r,c) = 255;
            end
        end
    end
end

end

