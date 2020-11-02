*** INSTALATION ***

On Matlab

Open Matlab and run the script main.m


*** FUNCTIONS ***

1. drawROI: Mark the ROI on the image
Input: image
Output: new image with marked ROI


2. drawHist: Draw the histogram of the gray-scale image
Input: image, ROI, histogram info
Output: histogram of the intensity of the image ROI


3. drawHSIhist: Draw the histogram of the color HSI image
Input: HSI image, ROI, histogram info
Output: histogram of the Hue, Saturation and Intensity of the image ROI


4. binarization: Binarization of the gray-scale image
Input: image, ROI, threshold
Output: Binarization image with the specific ROI


5. histStretch: Implement normal histogram stretching in the gray-scale image
Input: image, ROI, (a,b)
Output: new image after intensity histogram stretching in ROI


6. histBiStretch: Implement general bilinear histogram stretching in the gray-scale image
Input: image, ROI, (a,b,c,d)
Output: new image after intensity bilinear histogram stretching in ROI


7. hsiStretch: Implement normal histogram stretching in the color HSI image
Input: HSI image, ROI, H(a,b), S(a,b), I(a,b)
Output: new image after HSI histogram stretching in ROI


8. stretchCombine: Combine the background histogram stretching and object (foreground) histogram stretch.
Input: image, ROI, thresholds, histogram info
Output: new image after combining the histogram stretching of background and object in ROI


9. optimalT: Return the optimal thresholds in the region.
Input: image, ROI
Output: iteration: iteration counts in calculating threshold of a ROI, 
	thresholds: optimal thresholds in the ROI


10. rgb2hsi: Convert RGB to HSI
Input: RGB image
Output: HSI image


11. hsi2rgb: Convert HSI to RGB
Input: HSI image
Output: RGB image




*** PARAMETERS FILE ***

There are 5 parameters:

1. the input file address;
2. the output file address;

3. the name of Function. Use "drawROI", "drawHist", "histStretch", "histBiStretch", and "optimalT" for your filters;

4. the ROIs location and size. Use (row, column, Sr, Sc) in definition.
For example, (28, 284, 150, 200) is a ROI, which is a rectangle with a vertex of 28th row and 284th column in the upper left corner, a height of 150 pixels, and a length of 200 pixels. 
For example, [28,28,200,200;28,284,200,200;284,28,200,456] are 3 ROIs.

5. (Optional) The argument of Function: the value for histogram info, histogram stretch parameters.

