function output = drawHist(img,ROI,titles,histfile)
output = img;
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    H = zeros(1, 256);
    
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            g = img(r, c);
            H(g+1) = H(g+1) + 1;
        end
    end
    subplot(rows,1,i);
    bar(1:256,H);
    title(titles{i});
end
saveas(gcf, histfile)

end
