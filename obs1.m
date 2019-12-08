clc;
clear all;
close all;
A = imread('cameraman.tif');
imshow(A);
Q = dct2(A);
Rim = [Q(1:128,1:128),zeros(128);zeros(128,256)];
figure;
imshow(uint8(idct2(Rim)));
