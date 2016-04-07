clear; close all; clc

%two images from the same scene with different scales
imTest1 = rgb2gray(imread('1.jpg'));
imTest2 = imresize(imTest1,0.7);
imTest1 = double(imTest1);
imTest2 = double(imTest2);

%set the parameters
sigma = 1.6;
layer = 13;
threshold = 0.03;

%find the interest points
keyPoint1 = DoG(0.8,layer,sigma,threshold,imTest1);
keyPoint2 = DoG(0.6,layer,sigma,threshold,imTest2);

%show the results
figure(1);
imshow(imTest1,[]), hold on, drawCircle(keyPoint1); 
figure(2);
imshow(imTest2,[]), hold on, drawCircle(keyPoint2);