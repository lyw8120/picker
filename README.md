@Yao-Wang Li

# Introduction
I am going to develop a program to determine the helical symmetry of helical polymer including amyloid fibrils base the cryo-EM image of them.

All of them are C++ programs.

The main program is Picker which is a GUI program in which image can be displayed and be processed.
The rest programs are tools to assist user for helical determination.


zoom in and out
zoom in
expanded in row and column.

then
interpolation in row and column 
or 
by convolution mask first-order hold
1/4 1/2 1/4
1/2 1   1/2
1/4 1/2 1/4


rotation and translation
r'= (r+r0)cos(theta) + (c+c0)sin(theta)
c'=-(r+r0)sin(theta) + (c+c0)cos(theta)

edge determination
eliminate the noise effect
using operator
roberts operator
sobel operator
row mask
-1 -2 -1
0  0  0
1  2  1
 
-> s1

column mask
-1 0 1
-2 0 2
-1 0 1
-> s2

edge magnitude sqrt(s1^2 + s2^2)
edge direction tan-1(s1/s2)

prewitt operator
-1 -1 -1
0   0  0
1   1  1
->p1
-1  0  1
-1  0  1
-1  0  1
->p2
sqrt(p1^2 + p2^2)
tan-1(p1/p2)

hough transform
for line determination
p = rcos(theta) + csin(theta)

connectivity
growing and shrinking
segment the image into regions.
homogeneity test
for example, variance.

cluster techniques
SCT/center algroithm

morphological operations
dilation allows objects to expand
step 1. if the origin of kernel map a location is '0' on the mask, skip.
step 2. if it is '1', perform OR logic operation between mask and kernel, reset it to '1'.
erosion shrinks objects 
step 1. if the origin of kernel map a location is '1' on the mask, skip.
step 2, if it is '0', perform OR logic operation, set it to '0'.

image enhancement
stretch = (I-Imin)/(Imax - Imin) * (setMax-setMin) + setMin
setMax setMin, the range you want to set.

histogram equalization
step 1. count the pixels for each value.
step 2. for current pixel value, sum the counts of  pixels of value <= the current value.
step 3. divide the total number of pixels.
step 4. multiply the maximum value in the image and round it. 
step 5. map the origin value to the new value



the mrc matrix operation / and * did not work very well.
now the dilation and erosion function also have problems.

but I need to go back the work of making mask 

