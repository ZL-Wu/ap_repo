function output = histBiStretch(img,ROI,parameters)
output = img;
rows = size(ROI,1);

for i=1:rows
    roi = num2cell(ROI(i,:));
    [r_start,c_start,Sr,Sc] = deal(roi{:});
    p = num2cell(parameters(i,:));
    [pa, pb, pc, pd] = deal(p{:});
    
    k1 = pc/pa;
    k2 = (pd-pc)/(pb-pa);
    k3 = (255-pd)/(255-pb);
    
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            p = output(r,c);
            if p <= pa 
                output(r,c) = p*k1;
            elseif p <= pb
                output(r,c) = (p-pa)*k2+pc;
            else
                output(r,c) = (p-pb)*k3+pd;
            end
        end
    end
    
end

end

