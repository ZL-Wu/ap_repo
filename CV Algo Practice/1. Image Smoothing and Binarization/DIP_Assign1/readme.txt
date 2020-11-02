*** INSTALATION ***

On Matlab

Open Matlab and run the script main.m


*** FUNCTIONS ***

1. Binarization of grayscale images : biTwoT
Binarize the pixels of a grayscale image with two thresholds.
User needs to define two thresholds.


2. Add noise on signal: addnoise
Add noise into an image. 
User can specify noise according to these parameter: 
	Type: uniform(u) or normal(n) distribution
	sigma: noise fluctuation


3. Uniform smoothing: uSmooth
Smooth the image to reduce noise. Only support 3x3 window size


4. Adaptive smoothing: adaptSmooth
Smooth the image in a more flexible way. 
User needs to define a window size.
Window size can be any natural odd number.


5. Binarization of color images: colorBi
Binarize the pixels of a grayscale image with one threshold.
User needs to define two parameter:
	RGB: the color as a reference for comparison.
	Distance: a threshold.




*** PARAMETERS FILE ***

There are five parameters:

1. the input file address;
2. the output file address;

3. the ROI location and size. Use (row, column, Sr, Sc) in definition.
For example, (28, 284, 150, 200) is a ROI, which is a rectangle with a vertex of 28th row and 284th column in the upper left corner, a height of 150 pixels, and a length of 200 pixels. 

4. the name of Function. Use "biTwoT", "addnoise", "uSmooth", "adaptSmooth", and "colorBi" for your filters;

5. the argument of Function: the value for thresholds, noise type and sigma, window size, RGB, and distance.

