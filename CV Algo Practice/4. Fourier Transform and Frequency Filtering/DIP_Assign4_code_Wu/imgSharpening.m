function output = imgSharpening(img,ROI,operator,parameters,combine,titles,dstfile)

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
    for r=1:n1
        for c=1:n2
            d = sqrt((r-c1)^2+(c-c2)^2);
            if strcmp(operator, 'butterworth')
                D0 = parameters(i);
                % butterworth
                h = 1.0/(1+(D0/d)^4);
            elseif strcmp(operator, 'gaussian')
                D0 = parameters(i);
                % gaussian
                h = 1 - exp(-d^2/(2*D0^2));
            elseif strcmp(operator, 'laplacian')
                % laplacian
                % h = -4*pi^2*d^2;
                h = 1-d^2;
                % h = -d^2;
            end
            
            if combine==1
                f_img(r,c) = (h+1)*f_img(r,c);
            else
                f_img(r,c) = h*f_img(r,c);
            end
        end
    end
    
    % inverse FT to resulting image
    if_img = ifftshift(f_img);
    if_img = ifft2(if_img);
    if_img =abs(if_img);
    
    % scale the intensity of output img to be from 0-255
    minmum=min(min(if_img));
    maxmum=max(max(if_img));
    outputImg=(if_img-minmum)/(maxmum-minmum);
    outputImg=0+outputImg*(255-0);
    
    if strcmp(operator, 'laplacian') && combine==1
        roiImg = double(img(r_start:r_start+Sr,c_start:c_start+Sc));
        output(r_start:r_start+Sr,c_start:c_start+Sc)=roiImg-outputImg;
    else
        output(r_start:r_start+Sr,c_start:c_start+Sc)=outputImg;
    end
    
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

