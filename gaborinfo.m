function [contrast, gabortex,degPerFrameGabors,phaseLine,...
    propertiesMat] = gaborinfo(window, windowRect, ifi,trial)

    % Dimension of the region where will draw the Gabor in pixels
    gaborDimPix = windowRect(4)/5;

    % Sigma of Gaussian?
    sigma = gaborDimPix / 7;
    
    %Gabor contrast values
    usedcontrast=[1.8 3 5 8.2 13.5 22.3];
    
    % Contrast on Trial
    if mod(trial,2) == 0
        contrast = 100;
    else
        contrast = datasample(usedcontrast,1);
    end
    
    aspectRatio = 1.0;
    phase = 0;

    % Spatial Frequency
    % One Cycle = Grey-Black-Grey-White-Grey i.e. One Black and One White Lobe
    numCycles = 2;
    freq = numCycles / gaborDimPix;

    % Build a procedural gabor texture 
    backgroundOffset = [0.5 0.5 0.5 0.0];
    disableNorm = 1;
    preContrastMultiplier = 0.5;
    gabortex = CreateProceduralGabor(window, gaborDimPix, gaborDimPix, [],...
        backgroundOffset, disableNorm, preContrastMultiplier);
    % Drift speed for the 2D global motion
    degPerSec = 360 * .5; %lower multiple slower speed
    degPerFrame =  degPerSec * ifi;

    %Orientation
    %gaborAngles = 180; %add orientation from gauss dist here?;
    degPerFrameGabors = degPerFrame;
    phaseLine = 360;
    propertiesMat = repmat([phase, freq, sigma, contrast, aspectRatio, 0, 0, 0],...
    1, 1);
    propertiesMat(:, 1) = phaseLine;
end