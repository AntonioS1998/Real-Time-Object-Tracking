# Real-Time-Object-Tracking

This repository contains code for a simple object tracking program that detects red and yellow tags using webcam input. The program calculates and displays the distance between the two tags in real-time.

## Features

- Real-time object tracking
- Distance calculations using City Block, Chessboard, and Euclidean metrics
- Webcam support
- Real-time annotations on video output

## Prerequisites

To run this code, you need MATLAB installed on your computer, along with the Image Processing Toolbox and the Webcam Support Package.

## Usage

1. Clone the repository
2. Run the provided MATLAB script in your MATLAB environment
3. The program will use your connected webcam to track red and yellow tags in real-time
4. The calculated distances and annotated video will be displayed in the MATLAB window

## Code Overview

The main script provided in this repository performs the following steps:

1. Set up a clean environment by clearing all variables and closing all windows
2. Load the webcam object
3. Enter the main loop, which runs until the user stops the script
4. Capture a snapshot from the webcam
5. Threshold the image to detect red and yellow tags
6. Perform morphological closing on the tags to reduce noise
7. Apply further filtering to refine the detected tags
8. Calculate the centroids and boundaries of the tags
9. Overlay the boundaries and centroids onto the original image
10. Calculate the distances between the tags using City Block, Chessboard, and Euclidean metrics
11. Annotate the image with the calculated distances
12. Display the updated image


## Distance Calculation Formulas

The program calculates the distance between the centroids of the red and yellow tags using three different distance metrics:

**City Block (Manhattan) distance:**<br>
<center><img src="https://github.com/AntonioS1998/Real-Time-Object-Tracking/assets/132867163/ee5afe53-8162-4acc-9c51-30dc19ce044e" alt="City Block Distance"></center>
  
 **Chessboard (Chebyshev) distance:**<br>
<center><img src="https://github.com/AntonioS1998/Real-Time-Object-Tracking/assets/132867163/8d399cee-ef04-48d9-a221-1cee34075246" alt="Chessboard Distance"></center>

**Euclidean distance:**<br>
<center><img src="https://github.com/AntonioS1998/Real-Time-Object-Tracking/assets/132867163/a64a52ec-0502-4b03-aa01-5be3c1f23dc3" alt="Euclidean Distance"></center>



## Camera and RGB Values Adjustment

Please note that you may need to change the camera name in the code to match the specific name of your connected webcam. You can find the name of your webcam in the MATLAB environment or your computer's device manager.

In addition, the RGB values used for color detection may need to be adjusted depending on the lighting and environmental factors in your setup. Adjust the values in the `RedMask` and `YellowMask` functions to better suit your specific conditions.


