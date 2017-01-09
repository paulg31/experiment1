function [orientation,C] = setorient()
        %Distributions of Categories
        sigmaCat = [3,12];
        C = (rand() < 0.5) + 1; % C is either 1 or 2
        orientation = normrnd(0,sigmaCat(C));
end