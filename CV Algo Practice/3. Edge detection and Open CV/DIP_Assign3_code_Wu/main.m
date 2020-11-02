fid = fopen('parameters/parameters.txt');
str = fgets(fid);

while str~=-1
    str = strsplit(str,', ');
    
    % Start operation
    filename = str{1};
    img = imread(filename);
    output = str{2};
    operation = str{3};
    ROI = str2num(str{4});
    
    % overlapping test and correct the ROI
    board = zeros(size(img));
    for r=1:size(ROI,1)
        roi = num2cell(ROI(r,:));
        [Rx,Ry,Sx,Sy] = deal(roi{:});
        if board(Rx,Ry) + board(Rx+Sx,Ry) + board(Rx,Ry+Sy) + board(Rx+Sx,Ry+Sy) == 0
            board(Rx:Rx+Sx, Ry:Ry+Sy) = 1;  % "1" means this place has already belong to a ROI
        else
            ROI(r,:) = [];  % Overlapped ROI was removed from ROIs matrix
        end
    end
    
    if strcmp(operation, 'drawROI')
        imgout = drawROI(img,ROI);
        imwrite(imgout, output);
    elseif strcmp(operation, 'drawHist')
        titles = strsplit(str{5},'|');
        drawHist(img,ROI,titles,output);
    elseif strcmp(operation, 'edgeDetection')
        operator = str{5};
        display = str{6};
        parameters = str2num(str{7});
        imgout = edgeDetection(img,ROI,operator,display,parameters);
        imwrite(imgout, output);
    elseif strcmp(operation, 'opencv')
        operation = str{5};
        parameters = str2num(str{6});
        imgout = opencv(img,ROI,operation,parameters);
        imwrite(imgout, output);
    elseif strcmp(operation, 'histStretch')
        parameters = str2num(str{5});
        imgout = histStretch(img,ROI,parameters);
        imwrite(imgout, output);
    elseif strcmp(operation, 'optimalT')
        [iteration, thresholds] = optimalT(img, ROI);
        disp([iteration, thresholds])
        imgout = binarization(img,ROI,thresholds);
        imwrite(imgout, output);
    elseif strcmp(operation, 'equalCombineOtsu')
        histfile = str{5};
        imgout = equalCombineOtsu(img,ROI,histfile);
        imwrite(imgout, output);
    else
        fprintf('No function: %s\n', operation);
    end
    str = fgets(fid);
end