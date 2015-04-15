%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              Keith  Eyre                                        %
%                                          D11124850 - DT228/4                                    %
%                                     Assignment 3 - Skeletonisation                              %
%                                            Image Processing                                     %
%					   Reference: http://homepages.inf.ed.ac.uk/rbf/HIPR2/thin.htm    		      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clean environment
clear all;
close all;
clc;

%% Read in image: -> uigetfile -> F
[filename, pathname] = uigetfile('*.jpg', 'Choose Image');
F = fullfile(pathname, filename);

%% Convert input image: -> gray -> double
I = imread(F);
I = rgb2gray(I);
I = im2double(I);

I = I > 0.5;

[h, w] = size(I);
 
%% Skelitonisation: 
% Take in number of scans
% Display activity
prompt = 'Please enter required scan ammount: ';
numofscans = input(prompt);
notify = ['Scanning image... Amount of scans:  ', num2str(numofscans)];
disp(notify);

%% Scan the image's X & Y points and perforn checks for each pixel against patterns
% from @ 90, 180, 270 & 360
for numofpasses = 1:numofscans
    for i=2:h-1
        for j=2:w-1
            
            % Pattern 1 @ 0 degrees
            if( I(i-1, j-1) == 1                   && I(i-1, j)     == 1 && ...
                I(i, j-1)   == 1 && I(i, j)   == 0 && I(i, j+1)     == 0 && ...
                I(i+1, j)   == 0)
                I(i, j)      = 1;
                        
            % Pattern 2 @ 0 degrees
            elseif( I(i-1, j-1) == 1                 && I(i-1, j+1) == 0 && ...
                    I(i, j-1)   == 1 && I(i, j) == 0 && I(i, j+1)   == 0 && ...
                    I(i+1, j-1) == 1                 && I(i+1, j+1) == 0)
                    I(i, j)  = 1;
                        
            % Pattern 1 @ 90 degrees
            elseif( I(i-1, j) == 1                   && I(i-1, j+1) == 1 && ...
                    I(i, j-1) == 0 && I(i, j)   == 0 && I(i, j+1)   == 1 && ...
                    I(i+1, j) == 0)
                    I(i, j) = 1;
                       
            % Pattern 2 @ 90 degrees
            elseif( I(i-1, j-1) == 0                 && I(i-1, j+1) == 1 && ...
                    I(i, j-1)   == 0 && I(i, j) == 0 && I(i, j+1)   == 1 && ...
                    I(i+1, j-1) == 0                 && I(i+1, j+1) == 1)
                    I(i, j) = 1;
 
            % Pattern 1 @ 180 degrees
            elseif( I(i-1,j) == 0 && ...
                    I(i,j-1) == 0 && I(i,j)   == 0 && I(i,j+1)   == 1 && ...
                    I(i+1,j) == 1                  && I(i+1,j+1) == 1)
                    I(i,j) = 1;
            
            % Pattern 2 @ 180 degrees
            elseif( I(i-1, j-1) == 1 && ...
                    I(i-1, j) == 1 && I(i-1, j+1) == 1 && I(i, j)     == 0 && ...
                    I(i+1, j-1) == 0                   && I(i+1, j) == 0 && ...
                    I(i+1, j+1) == 0)
                    I(i, j)      = 1;
                    
            % Pattern 1 @ 270 degrees
            elseif( I(i-1, j)   == 0 && ...
                    I(i, j-1)   == 1 && I(i, j)   == 0 && I(i, j+1) == 0 && ...
                    I(i+1, j-1) == 1                   && I(i+1, j) == 1)
                    I(i, j)      = 1;
                    
            % Pattern 2 @ 270 degrees
            elseif( I(i-1, j-1) == 0 && ...
                    I(i-1, j)   == 0 && I(i-1, j+1) == 0 && I(i, j)   == 0 && ...
                    I(i+1, j-1) == 1                    && I(i+1, j)  == 1 && ...
                    I(i+1, j+1) == 1)
                    I(i, j)      = 1;
            end % End if
        end % End for
    end % End for
end % End for numofpasses

%% Display result to screen
disp('Skeleton Thinning Completed');
figure, imshow(I);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
