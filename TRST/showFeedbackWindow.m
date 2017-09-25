%feedback task window

function showFeedbackWindow(tc)
    global screen;
    global kbx;
    global parameters;
    global buildVector;
    
    global taskMap;
    global resReport;
    global totalScore;
    global bet;

    
    cumScorePerTrial = 0;
    
    for i=1:parameters.numberOfTrials
        if resReport(:,i).trial == tc
            cumScorePerTrial = cumScorePerTrial + resReport(:,i).score;
        end
    end
    
    white = screen.white;
    black = screen.black;
    grey  = screen.grey;
    
    green = [0 255 0];
    
   % get coordinates of the screen center
    xCenter = screen.screenXpixels/2;
    yCenter = screen.screenYpixels/2;
    
    %import the files for the fixation crosses and create the respective textures
    fixBG = [grey grey grey]; %grey background offset
    
    %import the files contating the fixation crosses
    fix1Data=imread(strcat(pwd,'/supportFiles/fix1.png'),'BackgroundColor',fixBG./255); %Trial fixation
    % make texture image out of image matrix 'imdata'
    fix1=Screen('MakeTexture', screen.win, fix1Data);
   
    fixRect = [ xCenter-parameters.fixationCrossSizePix ...
                yCenter-parameters.fixationCrossSizePix ...
                xCenter+parameters.fixationCrossSizePix ...
                yCenter+parameters.fixationCrossSizePix];
    
          
    Screen('DrawTexture', screen.win, fix1,[],fixRect); %fixaton dot
    
    %define the centers of triangles
    triangCenterX = screen.screenXpixels/2; % triangle
    triangCenterY = yCenter;
    
    %show triangles
    actualTriangle= Triangle(taskMap(:,tc).triangOrientation,triangCenterX,yCenter);
    reportedTriangle= Triangle(resReport(:,tc).reportedOrientation,triangCenterX,yCenter);
    
    %draw left and right triangles on the screen
    Screen(screen.win,'FillPoly',black, actualTriangle.setTriangleVertices())
    Screen(screen.win,'FillPoly',white, reportedTriangle.setTriangleVertices())
    
    
    DrawFormattedText(screen.win, sprintf('Total Points =  %.2f', totalScore), 'center',50, green);
    DrawFormattedText(screen.win, sprintf('You just gained %.2f points!', cumScorePerTrial), 'center', 100, green);
 
    Screen(screen.win, 'Flip');
    WaitSecs(parameters.feedBackTime);
    

end