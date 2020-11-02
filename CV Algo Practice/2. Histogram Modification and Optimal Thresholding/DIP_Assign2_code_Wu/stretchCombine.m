function output = stretchCombine(img,ROI,thresholds,histfile)
output = img;
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});  
    T = thresholds(i);
    
    % background and foreground histogram
    Hb = zeros(1, 256);
    Hf = zeros(1, 256);
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            g = output(r, c);
            if g <= T
                Hb(g+1) = Hb(g+1) + 1;
            else
                Hf(g+1) = Hf(g+1) + 1;                
            end
        end
    end
    subplot(rows,3,3*i-2);
    bar(1:256,Hb);
    title('Background');
    subplot(rows,3,3*i-1);
    bar(1:256,Hf);
    title('Foreground');
    
    % combine histogram
    min_intensity = find(Hb~=0,1,'first');
    max_intensity = find(Hf~=0,1,'last');
    H = zeros(1, 256);
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            p = output(r, c);
            if p <= T
                newP = 255-(T-p)*(255/(T-min_intensity));
                output(r,c) = min(255, newP);
                H(newP+1) = H(newP+1) + 1;
            else
                newP = (p-T)*(255/(max_intensity-T));
                output(r,c) = min(255, newP);
                H(newP+1) = H(newP+1) + 1;
            end
        end
    end
    subplot(rows,3,3*i);
    bar(1:256,H);
    title('Combine');
end
saveas(gcf, histfile)
end

