function [iteration, thresholds] = optimalT(img, ROI)

rows = size(ROI,1);
[iteration, thresholds]=deal(zeros(rows,1));

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    
    % start finding optimal T
    g = img(r_start:r_start+Sr, c_start:c_start+Sc);
    T = median(reshape(g,numel(g),1));
    [background, foreground, back_count, fore_count] = deal(0);
    j = 0;  % record the iteration
    
    while true
        j = j+1;
        for r=r_start:r_start+Sr
            for c=c_start:c_start+Sc
                p = img(r,c);
                if p < T
                    background = background + double(p);
                    back_count = back_count + 1;
                else
                    foreground = foreground + double(p);
                    fore_count = fore_count + 1;
                end
            end
        end
        mean_back = background/back_count;
        mean_fore = foreground/fore_count;
        newT = (mean_back+mean_fore)/2;
        diff = abs(newT-T);
        if diff <= 0.5
            break;
        else
            T = newT;
        end
    end
    iteration(i)=uint8(j);
    thresholds(i)=uint8(T);
    
%     % binarize the image
%     for r=r_start:r_start+Sr
%         for c=c_start:c_start+Sc
%             p = output(r,c);
%             if p <= T
%                 output(r,c) = 0;
%             else
%                 output(r,c) = 255;
%             end
%         end
%     end
end
end

