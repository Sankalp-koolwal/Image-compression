clc;
clear all;
close all;
A = imread('cameraman.tif');
Q = dct2(A);
Q1 = myCompression(A,256);
Rim = [Q1(1:128,1:128),zeros(128);zeros(128,256)];
figure;
imshow(uint8(idct2(Rim)));
