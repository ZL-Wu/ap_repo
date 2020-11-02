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


3. binarization: Binarization of the gray-scale image
Input: image, ROI, threshold
Output: Binarization image with the specific ROI


4. histStretch: Implement normal histogram stretching in the gray-scale image
Input: image, ROI, (a,b)
Output: new image after intensity histogram stretching in ROI


5. optimalT: Return the optimal thresholds in the region.
Input: image, ROI
Output: iteration: iteration counts in calculating threshold of a ROI, 
	thresholds: optimal thresholds in the ROI


6. edgeDetection: Return the image after Sobel edge detection.
Input: image, ROI, 
	operator: 'Sobel3' or 'Sobel5'
	display: 'amplitude', 'threshold', or 'direction'
	display parameters
Output: new image after Sobel edge detection in ROI


7. opencv: Process image based on several different third-party functions.
Input: image, ROI,
	operation: 'sobelEdge', 'cannyEdge', 'histogramEqual', 'OtsuT'
Output: new image after different defined operations in ROI
Attention: In fact, the OpenCV library is not called in this function, but MatLab's built-in image processing methods are used.


8. equalCombineOtsu: Equalize histogram of Foreground after Otsu segmentation
Input: img, ROI, histfile (file for histogram)
Output: new image after processing in ROI


*** PARAMETERS FILE ***

There are 5 parameters:

1. the input file address;
2. the output file address;

3. the name of Function. Use "drawROI", "drawHist", "edgeDetection", "opencv", and "optimalT" for your filters;

4. the ROIs location and size. Use (row, column, Sr, Sc) in definition.
For example, (28, 284, 150, 200) is a ROI, which is a rectangle with a vertex of 28th row and 284th column in the upper left corner, a height of 150 pixels, and a length of 200 pixels. 
For example, [28,28,200,200;28,284,200,200;284,28,200,456] are 3 ROIs.

5. (Optional) The argument of Function: the value for histogram info, Edge Detection parameters.



*** output images ***

There are total 23 output images.
The meaning of each image is already marked in its name.

The overall runtime of this experimental code is a bit long. In order to save users' running time, I kept these images in the folder. 

If the test code is necessary, please delete all images except "lena.pgm" and run script "main.m", or run script "main.m" directly to replace all images.

