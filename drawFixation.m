function drawFixation(duration, screen, character, size)
% DRAWFIXATION  Draw fixation character
%
% DRAWFIXATION(1000, screen, "+", 100)
%
%
% Created on 01/28/2019
% Authors: Yotaro Sueoka (ysueoka@mit.edu)
%          Anna Ivanova (annaiv@mit.edu)
%
% Update: (09/09/2024) (MM/DD/YYYY)
%   Will Decker (will.decker@gatech.edu)
    
arguments
    duration (1, 1) {mustBeNumeric}
    screen (1, 1) {mustBeNumeric}
    character (1, 1) string {mustBeTextScalar} = "+"
    size (1, 1) {mustBeNumeric} = 100 
end

    Screen('TextSize', screen , size);
    DrawFormattedText(screen, character, 'center', 'center');
    Screen('Flip', screen);
    WaitSecs(duration);

end
    