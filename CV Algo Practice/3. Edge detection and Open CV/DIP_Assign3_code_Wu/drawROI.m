function output = drawROI(img,ROI)
output = img;
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            if r==r_start||r==r_start+Sr||c==c_start||c==c_start+Sc
                if size(size(output),2) == 2
                    % gray-scale image
                    output(r,c)=0;
                elseif size(size(output),2) == 3
                    % color image
                    output(r,c,1)=0;
                    output(r,c,2)=0;
                    output(r,c,3)=0;
                end
            end 
        end
    end
end
end

