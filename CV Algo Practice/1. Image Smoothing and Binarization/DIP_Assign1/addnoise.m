function output = addnoise(img, r_start, c_start, Sr, Sc, type, sigma)
output = img;

if type=='u'
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            output(r,c) = img(r,c) + rand()*sigma;
        end
    end
elseif type=='n'
    for r=r_start:r_start+Sr
        for c=c_start:c_start+Sc
            output(r,c) = img(r,c) + normrnd(0, sigma);
        end
    end
end
end

