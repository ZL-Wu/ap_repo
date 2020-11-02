function output = drawHSIhist(hsi,ROI,histfile)
output = hsi; 
rows = size(ROI,1);
H = hsi(:, :, 1);
S = hsi(:, :, 2); 
I = hsi(:, :, 3); 
for j=1:rows
    roi = num2cell(ROI(j,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});  
    
    % background and foreground histogram
    Hh = zeros(1, 361);
    Hs = zeros(1, 101);
    Hi = zeros(1, 256);
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            h = uint8(H(r,c));
            s = uint8(S(r,c));
            i = uint8(I(r,c));
            Hh(h+1) = Hh(h+1) + 1;
            Hs(s+1) = Hs(s+1) + 1;
            Hi(i+1) = Hi(i+1) + 1;
        end
    end
    subplot(rows,3,3*j-2);
    bar(1:361,Hh);
    title('Hue');
    subplot(rows,3,3*j-1);
    bar(1:101,Hs);
    title('Saturation');
    subplot(rows,3,3*j);
    bar(1:256,Hi);
    title('Intensity');
end
saveas(gcf, histfile)

end

