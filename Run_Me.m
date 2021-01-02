% Run_Me.m
%
% Weighted Least Squares Based Detail Enhanced Exposure Fusion. 
%
% The algorithm implemented here is described in: 
%     Harbinder Singh, Vinay Kumar, and Sunil Bhooshan, 
%     Weighted Least Squares Based Detail Enhanced Exposure
%     Fusion, ISRN Signal Processing, HINDAWI, vol. 2014, 
%     Article ID 498762, 18 pages, February 2014.
%
% Please email any comment or report any bug to:
% Harbinder Singh (harbinder.ece@gmail.com), 
% https://sites.google.com/view/harbinder-fusion/home?authuser=0
%
% 
% The main function for image fusion ("WLS_Fusion.p")
% It takes as input a image sequence (color image), and
% returns as output the fused image.
% We find the default parameter setting works quite well for most image 
% series we've experimented with. To see default parameter settings, please
% refer article "Weighted Least Squares Based Detail Enhanced Exposure Fusion". 

% Referred code from others:
% wlsFilter routine:  described in Farbman, Fattal, Lischinski, and
%   Szeliski, "Edge-Preserving Decompositions for Multi-Scale Tone and Detail
%   Manipulation", which is available at https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/c95304a2-d9a9-4716-85e2-e01f1c7a841e/f735f344-a14b-4f70-9413-d9e381ac8992/previews/GRSL-Cloud_Detection_2018/functions/wlsFilter.m/index.html 
% The current package also contains routine used in diffusion process.
% it deals with anisotropy diffusion, which is authored by Aadarsh Malviya (https://www.mathworks.com/matlabcentral/fileexchange/31204-anisodiff-in-matlab).
clc;
clear;
close all;
%% Weighted Least Squares Based Detail Enhanced Exposure Fusion
scale=1;% Parameter used to resize input images (value should be <=1, 1 means 100% size).
Folder_Name='Type the name of folder'; % Folder's name, which is available in current directory containg input images.
[Input,ANI] = load_images('Folder_Name',scale);% Loading input images and Compute Base Layers from input images.
[F,D,WB,WD,N] = WLS_Fusion(Input,ANI);% Function used to fuse input images.
imwrite(F,'WLS_Fused.jpg') % saving fused image in current directory.
figure;imshow(F);title('Fused Image')% Display fused image

