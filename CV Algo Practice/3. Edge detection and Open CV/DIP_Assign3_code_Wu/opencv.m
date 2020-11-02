function output = opencv(img,ROI,operation,parameters)

output = img;
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    roiout = img(r_start:r_start+Sr,c_start:c_start+Sc);
    
    if strcmp(operation, 'sobelEdge')
        if size(parameters,2)==0
            % default
            [BW,thresh] = edge(roiout,'sobel');
            disp(thresh)
        elseif size(parameters,2)==1
            % threshold
            T = parameters(i);
            BW = edge(roiout,'sobel',T);
        elseif size(parameters,2)==2
            % direction
            d = parameters(i,1);
            T = parameters(i,2);
            if d == 0
                BW = edge(roiout,'sobel',T,'vertical');
            elseif d==1
                BW = edge(roiout,'sobel',T,'horizontal');
            elseif d==2
                BW = edge(roiout,'sobel',T,'both');
            end
        end
        output(r_start:r_start+Sr,c_start:c_start+Sc)=BW*255;
    elseif strcmp(operation, 'cannyEdge')
        BW = edge(roiout,'canny');
        output(r_start:r_start+Sr,c_start:c_start+Sc)=BW*255;
    elseif strcmp(operation, 'histogramEqual')
        BW = histeq(roiout);
        output(r_start:r_start+Sr,c_start:c_start+Sc)=BW;
    elseif strcmp(operation, 'OtsuT')   
        OtsuT = graythresh(roiout);
        disp(OtsuT)
        BW = imbinarize(roiout,OtsuT);
        output(r_start:r_start+Sr,c_start:c_start+Sc)=BW*255;
        imshow(output)
    end
    

%     for r=r_start:r_start+Sr
%         for c=c_start:c_start+Sc
% 
%             elseif strcmp(operation, 'histogram')
%                 output = 
%             end
%         end
%     end

end

end

