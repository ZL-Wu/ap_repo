function output = histStretch(img,ROI,parameters)
output = img;
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    
    p = num2cell(parameters(i,:));
    [a, b] = deal(p{:});
    
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            p = output(r,c);
            if p <= a
                output(r,c) = 0;
            elseif p >= b
                output(r,c) = 255;
            else
                newP = (p-a)*(255/(b-a))+0;
                output(r,c) = min(255, newP) ;
            end
        end
    end
end
end

