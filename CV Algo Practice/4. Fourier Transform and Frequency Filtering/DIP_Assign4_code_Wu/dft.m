function output = dft(img,ROI,titles,dstfile)

output = double(img);
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
    
    roiImg=im2double(roiImg);
    f_img = fft2(roiImg);
    f_img = fftshift(f_img);
    
    output(r_start:r_start+Sr,c_start:c_start+Sc)=f_img;

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
% imshow(output);
saveas(gcf, dstfile)
end

