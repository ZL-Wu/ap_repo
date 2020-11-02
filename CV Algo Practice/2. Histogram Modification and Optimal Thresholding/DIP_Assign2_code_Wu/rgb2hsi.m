function hsi = rgb2hsi(img)
% rgb = im2double(img);
rgb = double(img);
R = rgb(:, :, 1); 
G = rgb(:, :, 2); 
B = rgb(:, :, 3); 
r = R./(R+G+B);
g = G./(R+G+B);
b = B./(R+G+B);

% Implement the conversion equations. 
num = 0.5*((r - g) + (r - b)); 
den = sqrt((r - g).^2 + (r - b).*(g - b)); 
theta = acos(num./(den + eps)); 
 
H = theta; 
H(b > g) = 2*pi - H(b > g); 
H = H*180/pi;
 
S = 1 - 3.*min(min(r, g), b);
S = S*100;
% H(S == 0) = 0; 
I = (R + G + B)/3; 

% Combine all three results into an hsi image. 
hsi = cat(3, H, S, I); 
end

