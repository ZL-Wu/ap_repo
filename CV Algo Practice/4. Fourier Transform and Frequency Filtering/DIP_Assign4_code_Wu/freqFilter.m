function output = freqFilter(img,ROI,operator,cutoffs,titles,dstfile)

output = img;
rows = size(ROI,1);

% gr is the rows of the grids of subplot
if rem(rows,2)==1
    gr = (rows+1)/2;
else
    gr = rows/2;
end

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    roiImg = img(r_start:r_start+Sr,c_start:c_start+Sc);
    
    % f_img is the FT of current ROI
    roiImg=im2double(roiImg);
    f_img = fft2(roiImg);
    f_img = fftshift(f_img);
    
    [n1,n2] = size(f_img);
    % center of the FT (c1,c2)
    c1 = round(n1/2);
    c2 = round(n2/2);
    T = cutoffs(i,:);
    for r=1:n1
        for c=1:n2
            d = sqrt((r-c1)^2+(c-c2)^2);
            if strcmp(operator, 'low-pass')
                % Low pass
                if d <= T
                    h = 1;
                else
                    h = 0;
                end
            elseif strcmp(operator, 'high-pass')
                % High pass
                if d <= T
                    h = 0;
                else
                    h = 1;
                end
            elseif strcmp(operator, 'band-stop')
                t1 = T(1);
                t2 = T(2);
                if d >= t1 && d <=t2
                    h = 1;
                else
                    h = 0;
                end
            end
            f_img(r,c) = h*f_img(r,c);
        end
    end
    
    % inverse FT to resulting image
    if_img = ifftshift(f_img);
    if_img = ifft2(if_img);
    if_img =abs(if_img);
    
    output(r_start:r_start+Sr,c_start:c_start+Sc)=if_img*255;
    
    % Draw the new DFT graph
    if rem(rows,2)==1 && i==rows
        subplot(gr,2,[i,i+1]);
        imshow(log(abs(f_img)+1),[]);
        title(titles{i});          
    else
        subplot(gr,2,i);
        imshow(log(abs(f_img)+1),[]);
        title(titles{i});        
    end
end
saveas(gcf, dstfile)
end

