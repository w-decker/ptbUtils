function [varargout] = createStimArray(path)
% CREATESTIMARRAY Create iterable array of stimuli and/or stimuli pointers

% check that arg is string type and points to a valid file
assert(ischar(path) || isstring(path), 'Path must be a string or character array.');
assert(isfile(path), 'Path must be a valid file.');

% make sure the stimulus file is compatible
valid_files = {'.csv', '.txt', '.xlsx'};
[~, ~, ext] = fileparts(path);
assert(ismember(ext, valid_files), 'Valid file types are .csv, .txt, .xlsx')

% read data
T = [];
if strcmpi(ext, '.csv') || strcmpi(ext, '.txt')
    T = readcell(path);
elseif strcmpi(ext, '.xlsx')
    T = readcell(path, 'FileType', 'spreadsheet');
end

% index where data is non-textual/must be read in separately (like a .png
% file)
Idx = cell(size(T, 1), 1);
for s = 1:size(T, 1)
    row = T(s, :);
    
    % Check each cell in the row to see if it points to a file
    for i = 1:length(row)
        stimulus = row{i};
        
        if ischar(stimulus) || isstring(stimulus)
            % Check if the stimulus is a valid file (e.g., image file)
            if isfile(stimulus)
                Idx{s}{i} = 1;
            else
                Idx{s}{i} = [];
            end
        else
            Idx{s}{i} = []; 
        end
    end
end

% Output as a struct
stimStruct.T = T;
stimStruct.Idx = Idx;

% Assign output to varargout
varargout{1} = stimStruct;
end