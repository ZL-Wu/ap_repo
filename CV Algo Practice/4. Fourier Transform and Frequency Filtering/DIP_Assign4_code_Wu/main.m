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
    elseif strcmp(operation, 'dft')
        titles = strsplit(str{5},'|');
        imgout = dft(img, ROI, titles, output);
    elseif strcmp(operation, 'freqFilter')
        operator = str{5};
        cutoff = str2num(str{6});
        titles = strsplit(str{7},'|');
        dstfile = str{8};
        imgout = freqFilter(img,ROI,operator,cutoff,titles,dstfile);
        imwrite(imgout, output);
    elseif strcmp(operation, 'combineFreqFilter')
        operator = str{5};
        cutoff = str2num(str{6});
        titles = strsplit(str{7},'|');
        dstfile = str{8};
        imgout = combineFreqFilter(img,ROI,operator,cutoff,titles,dstfile);
        imwrite(imgout, output);
    elseif strcmp(operation, 'imgSharpening')
        operator = str{5};
        parameters = str2num(str{6});
        combine = str2num(str{7});
        titles = strsplit(str{8},'|');
        dstfile = str{9};
        imgout = imgSharpening(img,ROI,operator,parameters,combine,titles,dstfile);
        imwrite(imgout, output);
    elseif strcmp(operation, 'edgeDetection')
        operator = str{5};
        display = str{6};
        parameters = str2num(str{7});
        imgout = edgeDetection(img,ROI,operator,display,parameters);
        imwrite(imgout, output);
    elseif strcmp(operation, 'adaptSmooth')
        windowSize = str2double(str{5});
        imgout = adaptSmooth(img,ROI,windowSize);
        imwrite(imgout, output);
    else
        fprintf('No function: %s\n', operation);
    end
    str = fgets(fid);
end