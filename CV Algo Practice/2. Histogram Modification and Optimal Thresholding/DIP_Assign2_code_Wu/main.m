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
    elseif strcmp(operation, 'drawHSIhist')
        hsi = rgb2hsi(img);
        drawHSIhist(hsi,ROI,output);
    elseif strcmp(operation, 'histStretch')
        parameters = str2num(str{5});
        imgout = histStretch(img,ROI,parameters);
        imwrite(imgout, output);
    elseif strcmp(operation, 'histBiStretch')
        parameters = str2num(str{5});
        imgout = histBiStretch(img,ROI,parameters);
        imwrite(imgout, output);
    elseif strcmp(operation, 'optimalT')
        [iteration, thresholds] = optimalT(img, ROI);
%         disp([iteration, thresholds])
        imgout = binarization(img,ROI,thresholds);
        imwrite(imgout, output);
    elseif strcmp(operation, 'stretchCombine')
        [iteration, thresholds] = optimalT(img, ROI);
        disp([iteration, thresholds])
        histfile = str{5};
        imgout = stretchCombine(img,ROI,thresholds,histfile);
        imwrite(imgout, output);
    elseif strcmp(operation, 'hsiStretch')
        hsi = rgb2hsi(img);
        Hparams = str2num(str{5});
        Sparams = str2num(str{6});
        Iparams = str2num(str{7});
        imghsi = hsiStretch(hsi,ROI,Hparams,Sparams,Iparams);
        imgout = hsi2rgb(imghsi);
        imwrite(imgout, output);
    else
        fprintf('No function: %s\n', operation);
    end
    str = fgets(fid);
end