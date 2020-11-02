function output = hsiStretch(hsi,ROI,Hparams,Sparams,Iparams)
rows = size(ROI,1);
H = hsi(:, :, 1);
S = hsi(:, :, 2); 
I = hsi(:, :, 3); 
processH = 0; 
processS = 0; 
processI = 0; 
for j=1:rows
    roi = num2cell(ROI(j,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    
    % Hue
    if ~isempty(Hparams)
        processH = 1; 
        p = num2cell(Hparams(j,:));
        [ha, hb] = deal(p{:});
    end
    % Saturation
    if ~isempty(Sparams)
        processS = 1; 
        p = num2cell(Sparams(j,:));
        [sa, sb] = deal(p{:});
    end
    % Intensity
    if ~isempty(Iparams)
        processI = 1; 
        p = num2cell(Iparams(j,:));
        [ia, ib] = deal(p{:});
    end
    
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            % Hue
            if processH~=0
                i = H(r,c);
                if i <= ha 
                    H(r,c) = 0;
                elseif i > hb
                    H(r,c) = 360;
                else
                    newP = (i-ha)*(360/(hb-ha))+0;
                    H(r,c) = min(360, newP) ;
                end
            end
            % Saturation
            if processS~=0
                i = S(r,c);
                if i <= sa 
                    S(r,c) = 0;
                elseif i > sb
                    S(r,c) = 100;
                else
                    newP = (i-sa)*(100/(sb-sa))+0;
                    S(r,c) = min(100, newP) ;
                end
            end
            % Intensity
            if processI~=0
                i = I(r,c);
                if i <= ia 
                    I(r,c) = 0;
                elseif i > ib
                    I(r,c) = 255;
                else
                    newP = (i-ia)*(255/(ib-ia))+0;
                    I(r,c) = min(255, newP) ;
                end
            end
        end
    end
end
output = cat(3, H, S, I); 

end

