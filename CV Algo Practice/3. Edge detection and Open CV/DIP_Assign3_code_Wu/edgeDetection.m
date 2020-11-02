function output = edgeDetection(img,ROI,operator,display,parameters)

output = img;
double_img = double(img);
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            % different computation based on operator
            if strcmp(operator, 'sobel3')
                Sobel_x = double_img(r-1,c+1) + 2*double_img(r,c+1) + double_img(r+1,c+1) - double_img(r-1,c-1) - 2*double_img(r,c-1) - double_img(r+1,c-1);
                Sobel_y = double_img(r-1,c-1) + 2*double_img(r-1,c) + double_img(r-1,c+1) - double_img(r+1,c-1) - 2*double_img(r+1,c) - double_img(r+1,c+1);
                Sobel_Num = sqrt(Sobel_x^2 + Sobel_y^2);
            elseif strcmp(operator, 'sobel5')
                Sobel_x = 5*(double_img(r-2,c-2)+double_img(r+2,c-2)-double_img(r-2,c+2)-double_img(r+2,c+2)) + ...
                          8*(double_img(r-1,c-2)+double_img(r+1,c-2)-double_img(r-1,c+2)-double_img(r+1,c+2)) + ...
                          4*(double_img(r-2,c-1)+double_img(r+2,c-1)-double_img(r-2,c+1)-double_img(r+2,c+1)) + ... 
                          10*(double_img(r,c-2)+double_img(r-1,c-1)+double_img(r+1,c-1)-double_img(r-1,c+1)-double_img(r+1,c+1)-double_img(r,c+2)) +... 
                          20*(double_img(r,c-1)-double_img(r,c+1));
                Sobel_y = 5*(double_img(r+2,c-2)+double_img(r+2,c+2)-double_img(r-2,c-2)-double_img(r-2,c+2)) + ...
                          8*(double_img(r+2,c-1)+double_img(r+2,c+1)-double_img(r-2,c-1)-double_img(r-2,c+1)) + ...
                          4*(double_img(r+1,c-2)+double_img(r+1,c+2)-double_img(r-1,c-2)-double_img(r-1,c+2)) + ... 
                          10*(double_img(r+2,c)+double_img(r+1,c-1)+double_img(r+1,c+1)-double_img(r-1,c-1)-double_img(r-1,c+1)-double_img(r-2,c)) +... 
                          20*(double_img(r+1,c)-double_img(r-1,c));
                Sobel_Num = sqrt(Sobel_x^2 + Sobel_y^2);
            end
            
            % different image display
            if strcmp(display, 'amplitude')
                % only output gradient amplitude
                output(r,c) = Sobel_Num;
            elseif strcmp(display, 'binary')
                % thresholding gradient amplitude
                threshold = parameters(i);
                if Sobel_Num > threshold
                    output(r,c) = 255;
                else
                    output(r,c) = 0;
                end
            elseif strcmp(display, 'direction')
                % direction and threshold
                direction = Sobel_y/Sobel_x;
                a = parameters(i, 1);
                b = parameters(i, 2);
                T = parameters(i, 3);
                if direction>tand(a) && direction<tand(b)
                    if Sobel_Num > T
                        output(r,c) = 255;
                    else
                        output(r,c) = 0;
                    end
                else
                    output(r,c)=0;
                end
            end
        end
    end
end

end

