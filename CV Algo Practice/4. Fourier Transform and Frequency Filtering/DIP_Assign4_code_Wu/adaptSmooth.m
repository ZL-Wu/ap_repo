function output = adaptSmooth(img, ROI, windowSize)
output = img;

rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    r_ROI = [r_start, r_start+Sr];
    c_ROI = [c_start, c_start+Sc];

    w = (windowSize-1)/2; 

    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            m = min([abs(r - r_ROI), abs(c - c_ROI)]);
            if m == 0
    %             img(r, c) = 0;
            elseif m < w
                window = img(r-m:r+m, c-m:c+m);
                output(r,c) = sum(window(:))/((2*m+1)^2);
            else
                window = img(r-w:r+w, c-w:c+w);
                output(r,c) = sum(window(:))/(2*w+1)^2;
            end
        end
    end
end
end

