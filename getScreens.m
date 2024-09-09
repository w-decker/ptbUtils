function screen = getScreens(varargin)
% GETSCREENS  Get and set screens.
%
% SCREEN = GETSCREEN('SHOW') Diplays the possibleu values of screen
%
% SCREEN = GETSCREEN(1) Returns the value of the screen you've selected (in
% this case, 1.
%
% Created on 09/09/2024 (MM/DD/YYY)
% Authors: Will Decker (will.decker@gatech.edu)

if nargin > 1
    error('getScreens takes only one or zero input arguments.')
end

% get screens
screens = Screen('Screens');

if nargin == 1 && ischar(varargin{1})
    if strcmpi(varargin{1}, 'show')
        disp(screens)
    end
elseif nargin == 1 && isnumeric(varargin{1})
    if ~ismember(varargin{1}, screens)
        error(['Inputs must be' + num2str(screens)])
    
    else
        screen = varargin{1};
    end

else
    screen = [];
end