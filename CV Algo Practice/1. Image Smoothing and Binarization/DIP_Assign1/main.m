fid = fopen('parameters/parameters.txt');
str = fgets(fid);
output = ' ';

while str~=-1
    str = strsplit(str,' ');
    if strcmp(str{2}, output) == 0
        % Switch the image that should be processed currently
        filename = str{1};
        output = str{2};
        imgout = imread(filename);
        board = zeros(size(imgout));
    end
    
    r = str2double(str{3});
    c = str2double(str{4});
    Sr = str2double(str{5});
    Sc = str2double(str{6});
    % Overlapping test
    if board(r,c) + board(r+Sr,c) + board(r,c+Sr) + board(r+Sr,c+Sc) == 0
        board(r:r+Sr, c:Sc) = 1;  % "1" means this place has already belong to a ROI
    else
        str = fgets(fid);
        continue
    end
    
    % Start operation
    operation = str{7};
    
    if strcmp(operation, 'biTwoT')
        threshold1 = str2double(str{8});
        threshold2 = str2double(str{9});
        imgout = biTwoT(imgout, threshold1, threshold2, r, c, Sr, Sc);
    elseif strcmp(operation, 'addnoise')
        type = str{8};
        sigma = str2double(str{9});
        imgout = addnoise(imgout, r, c, Sr, Sc, type, sigma);
    elseif strcmp(operation, 'uSmooth')
        imgout = uSmooth(imgout, r, c, Sr, Sc);
    elseif strcmp(operation, 'adaptSmooth')
        windowSize = str2double(str{8});
        imgout = adaptSmooth(imgout, r, c, Sr, Sc, windowSize);
    elseif strcmp(operation, 'colorBi')
        red = str2double(str{8});
        green = str2double(str{9});
        blue = str2double(str{10});
        threshold = str2double(str{11});
        imgout = colorBi(imgout, r, c, Sr, Sc, red, green, blue, threshold);
    else
        fprintf('No function: %s\n', operation);
    end
    str = fgets(fid);
    if str(1)=='-'
        imwrite(imgout, output)
        str = fgets(fid);
    end
end