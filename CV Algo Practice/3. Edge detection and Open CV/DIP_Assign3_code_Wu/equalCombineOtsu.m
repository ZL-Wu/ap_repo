function output = equalCombineOtsu(img, ROI, histfile)
output = img;
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    roimg = img(r_start:r_start+Sr,c_start:c_start+Sc);
    Hb = zeros(1, 256);
    Hf = zeros(1, 256);
    % Otsu
    OtsuT = graythresh(roimg);
    BW = imbinarize(roimg,OtsuT);
    [a,b] = size(BW);
    for r=1:a
        for c=1:b
            g = roimg(r,c);
            if BW(r,c)==0
                % background
                Hb(g+1) = Hb(g+1) + 1;
            else
                % foreground
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
    
    % Histogram Equalization for only foreground
    % threshold = find(Hf~=0,1,'first');
    totalFore = sum(sum(Hf));
    T = zeros(1, 256);
    T = double(T); 
    Hf = double(Hf);
    cumulative = 0;
    % cumulative probability density function: T
    for x = 1 : 256
        cumulative = cumulative + Hf(1, x) / totalFore;
        T(1,x) = cumulative;
    end
    % update cumulative probability density function
    for x = 1 : 256
        T(1,x) = T(1,x) * 255;
        % disp([x, T(1,x)])
    end
    
    roimg = double(roimg);
    for r = 1:a
        for c = 1:b
            if BW(r,c)==1
                roimg(r, c) = T(1, roimg(r, c) + 1);
            end
        end
    end
    roimg = uint8(roimg);
    subplot(rows,3,3*i);
    imhist(roimg)
    title('Combine');
    
    output(r_start:r_start+Sr,c_start:c_start+Sc)=roimg;
end
saveas(gcf, histfile)
end

