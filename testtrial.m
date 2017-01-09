function [NewTest] = testtrial(window,windowRect,ifi,trial, allCoords, ...
    lineWidthPix, xCenter, yCenter)
%Set Orientation via function
[orientation,C] = setorient();

%Gabor Info via function
[contrast, gabortex,degPerFrameGabors,phaseLine,...
                propertiesMat] = gaborinfo(window, windowRect, ifi,trial);
            
WaitSecs(1.25);
            
% Animation loop via function
drawgabor(window,gabortex,orientation,propertiesMat...
                ,phaseLine, degPerFrameGabors);
            
%Draw Fixation
Screen('DrawLines', window, allCoords,...
            lineWidthPix, [0 1 0], [xCenter yCenter], 2);
            
% Flip to the screen
Screen('Flip', window);
            
% Pressed Key and Rxn Time via function
[RT, responsenumber] = reactiontime();
            
% Flip to the screen
Screen('Flip', window);
            
WaitSecs(1);
            
%Save Results
NewTest = [ C, contrast, orientation, responsenumber, RT];
end