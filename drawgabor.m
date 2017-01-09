function drawgabor(window,gabortex,orientation,propertiesMat,phaseLine, degPerFrameGabors)
duration = 0;
secs0 = GetSecs;
while duration < .05
    Screen('DrawTexture', window, gabortex, [], [], orientation+90,...
        [], [], [], [], kPsychDontDoRotation, propertiesMat');
    Screen('Flip', window);

    % Increment the phase of Gabors
    phaseLine = phaseLine + degPerFrameGabors;
    propertiesMat(:, 1) = phaseLine';
    duration = GetSecs-secs0;
end
end