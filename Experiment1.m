function Experiment1()
sca;
close all;

% Setup PTB with default values
PsychDefaultSetup(2);

% Set the screen number to the external secondary monitor
screenNumber = max(Screen('Screens'));

% Define white and grey
white = WhiteIndex(screenNumber);
grey = white / 2;

% Skip sync tests for demo purposes only*QUESTION*
Screen('Preference', 'SkipSyncTests', 2);

% Enter particpiant number via function
[thissub] = partnumber();

%Folders
ResultsFolder ='C:\MATLABFiles\Experiment1\results\';
Outputfile = [ResultsFolder,'FirstExperiment_',thissub,'.mat'];

%Cross Info
fixCrossDimPix = 20;
lineWidthPix = 4;

%Relative Coordinates For Display
xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

%Open the screen
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey, [], 32, 2,...
        [], [],  kPsychNeed32BPCFloat);

% Get the size of the on screen window in pixels
[~, screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window in pixels
[xCenter, yCenter] = RectCenter(windowRect);

% IFI and Screen Info 
ifi = Screen('GetFlipInterval', window);
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
Screen('TextFont', window, 'Ariel');

% Three lines of text**********
line1 = 'Experiment Will Begin';
line2 = '\n\n Press Z if Cat 1';
line3 = '\n\n\n Press M if Cat 2';
line4 = '\n\n\n\n Press B to Continue';

% Draw all the text
Screen('TextSize', window, 70);
DrawFormattedText(window, [line1 line2 line3 line4],...
    'center', screenYpixels * 0.25, white);

% Flip to the screen
Screen('Flip', window);

% Wait for Press to move on
KbWait; 
Screen('Flip', window);

%Results Matrix
ResultsTest = [];

%Run via function
for trial = 0:2
    if mod(trial,2) == 0
        for subtrial = 0:2
            [NewTest] = testtrial(window,windowRect,ifi,trial, allCoords, ...
                lineWidthPix, xCenter, yCenter);
            ResultsTest = [ResultsTest;NewTest];
        end 
    else
        for subtrial = 0:2
            [NewTest] = testtrial(window,windowRect,ifi,trial, allCoords, ...
                lineWidthPix, xCenter, yCenter);
            ResultsTest = [ResultsTest;NewTest];
        end 
    end
end

save(Outputfile,'ResultsTest')
 
% Flip to the screen
Screen('Flip', window);
    
% Write Text
lineq = '\n\n Done';

% Draw all the text
Screen('TextSize', window, 70);
DrawFormattedText(window, lineq,'center', screenYpixels * 0.25, white);

% Flip to the screen
Screen('Flip', window);
    
% Wait to exit
WaitSecs(2);

% Clear screen
sca;

end