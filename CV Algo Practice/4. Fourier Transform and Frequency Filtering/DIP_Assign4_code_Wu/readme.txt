*** INSTALATION ***

On Matlab

Open Matlab and run the script main.m


*** FUNCTIONS ***

1. drawROI: Mark the ROI on the image
Input: image
Output: new image with marked ROI


2. edgeDetection: Return the image after Sobel edge detection.
Input: image, ROI, 
	operator: 'Sobel3' or 'Sobel5'
	display: 'amplitude', 'threshold', or 'direction'
	display parameters
Output: new image after Sobel edge detection in ROI


3. adaptSmooth: Adaptive smoothing, smooth the image in a more flexible way. 
Input: image, ROI, windowSize(natural odd number)
Output: new image after adaptive smoothing in ROI


4. dft: return the Fourier transform of a certain image
Input: image, ROI, drawPlot parameters
Output: the Fourier transform of ROI of the image.
	Generate a Fourier transform graph for the image


5. freqFilter: return the new image after low-pass, high-pass or band-stop filtering
Input: image, ROI, Operator, cutoffs, drawPlot parameters
	Operator: 'low-pass', 'high-pass', 'band-stop'
	cutoffs: cutoff frequency
Output: new image after frequency filtering
	Generate the Fourier transform graph for new image


6. combineFreqFilter: return the new image combining filter of band-stop with low-pass or high-pass
Input: image, ROI, Operator, cutoffs, drawPlot parameters
	Operator: 'low-pass', 'high-pass'
	cutoffs: cutoff frequency
Output: new image after combined frequency filtering
	Generate the Fourier transform graph for new image


7. imgSharpening: return a new sharpening image in frequency domain
Input: image, ROI, Operator, parameters, combine, drawPlot parameters
	Operator: 'butterworth', 'gaussian', 'laplacian'
	parameters: cutoff frequency or other parameters of the certain operator algorithm
	combine: whether combine the new frequency domain with original one
Output: new image after image sharpening
	Generate the Fourier transform graph for new image



*** PARAMETERS FILE ***

There are 5 parameters:

1. the input file address;
2. the output file address;

3. the name of Function. Use "drawROI", "edgeDetection", "adaptSmooth", "dft", "freqFilter", "combineFreqFilter", or "imgSharpening";

4. the ROIs location and size. Use (row, column, Sr, Sc) in definition.
For example, (28, 284, 150, 200) is a ROI, which is a rectangle with a vertex of 28th row and 284th column in the upper left corner, a height of 150 pixels, and a length of 200 pixels. 
For example, [28,28,200,200;28,284,200,200;284,28,200,456] are 3 ROIs.

5. (Optional) The argument of each Function: for example, the value for freqFilter parameters.



*** output images ***

There are total 28 output images.
The meaning of each image is already marked in its filename.

