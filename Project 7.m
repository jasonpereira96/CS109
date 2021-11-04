% INPUTS
%   opt - a value of 1-5 or -1. If the user enters any other value of opt 
%       other than -1 or 1-5, then return an empty array ([]), do not plot, 
%       and provide a useful error message (any message is fine).
%
%     Each option changes the grid array in a specific way:
%       -opt 1 - First, find the maximum value in the gridIn array. Then,
%             all elements in gridIn, that are either 2 or 4, should be 
%             set to the maximum value found. Assign this new updated 
%             gridIn to the output, gridOut.
%       -opt 2 - First, find the minimum value in the gridIn array. Then,
%             set all values in all odd rows equal to the minimum value 
%             found. Assign this new updated gridIn to the output, gridOut.
%       -opt 3 - First, find the minimum value in the gridIn array. Then, 
%             set the diagonal and off diagonal values of the array equal 
%             the minimum value found. Assign this new updated gridIn to 
%             the output, gridOut.
%       -opt 4 - First, find the minimum value in the gridIn array. Then,
%             set all elements in all four boundaries of the grid to the 
%             minimum value. Assign this new updated gridIn to the 
%             output, gridOut.
%       -opt 5 - First, find the maximum value in the gridIn array. Then, 
%             find the middle row and middle column of gridIn and set all 
%             values in the middle row and middle column to the maximum 
%             value found. If there is an odd number of rows/columns, 
%             there will be one middle. If there is an even number of 
%             rows/columns, there will be two middles. Assign this new 
%             updated gridIn to the output, gridOut. 
% 
%     Functions that might be useful include: floor, ceil, rem, etc.
%
%       -opt -1 - assign gridOut to gridIn unchanged.
%    
%   gridIn - the 2D array that will be filtered. It is required that this
%          array is square (number of columns equals number of rows). 
%          If the grid is not square, return an empty array, do not plot
%          anything, and display a userful error message.
%
% OUTPUTS
%   gridOut - The changed or (unchanged) inputted array based on the opt 
%           value.
%
%   In addition to outputting gridOut, this function should also plot it
%   using the imagesc function. See project description for sample plots 
%   (the plots use the colormap hot, and set axis to equal and tight). 
%   The plot should also have the proper title.  
function [gridOut] = filterAndPlot(opt, gridIn)
    % set up grid for alteration and grab stats
    grid = gridIn;
    mx = max(grid(:));
    mn = min(grid(:));
    sz = size(grid);
    
    % grid is valid initially, invalidated in certain cases
    valid = true;
    
    % make sure grid is square 
    % then perform alterations based on opt value
    if sz(1)==sz(2)    
        if (opt == 1)
            grid(grid==2 | grid == 4) = mx;
        elseif (opt == 2)
            for i = 1:2:sz(1)
                grid(i,:) = mn;
            end
        elseif (opt == 3)
            for i = 1:sz(1)
                for j = 1:sz(2)
                    if i==j || i+j==sz(2)+1
                        grid(i,j) = mn;
                    end
                end
            end
        elseif (opt == 4)
            grid(1, :) = mn;
            grid(end, :) = mn;
            grid(:, 1) = mn;
            grid(:, end) = mn;
        elseif (opt == 5)
            if rem(sz(1), 2)==0 %even number of rows or columns
                mid = [sz(1)/2, sz(1)/2+1];
            else
                mid = ceil(sz(1)/2);
            end
            grid(mid, :) = mx;
            grid(:, mid) = mx;
        elseif (opt == -1)
            % no change to grid when opt is -1
        else
           grid = [];
           disp("Invalid opt, please enter -1 or 1-5");
           valid = false;
        end
        
    else
        disp("Grid must be square");
        grid = [];
        valid = false;
    end
    
    % setup the function output
    gridOut = grid;
    
    % create plot if valid option and grid size
    if valid
        imagesc(grid)
        colormap hot
        colorbar
        axis equal
        axis tight
        if (opt < 0)
            title(["original"]);
        else
            title(["filtered, opt=" + opt]);
        end
    end
    close all;
end
