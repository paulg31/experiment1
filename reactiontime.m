function [RT, responsenumber] = reactiontime()
 secs0=GetSecs;
 KbWait; 
 % Collect keyboard response
 [KeyIsDown, secs, pressedKey, deltaSecs] = KbCheck;% Wait for and checkwhich key was pressed
 response=KbName(pressedKey);
 responsenumber=KbName(response);
 RT=secs-secs0;% Get reaction time
end