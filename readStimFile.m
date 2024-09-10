function S = readStimFile(stim_file_path)
% READSTIMFILE Read in stimulus file
%
% S = READSTIMFILE('/path/to/file')
%
% Created: (09/10/2024) (MM/DD/YYY)
% Author: Will Decker (will.decker@gatech.edu)
    
    assert(isfile(stim_file_path), 'Please provide the file path')
    
    % read in file
    fid = fopen(stim_file_path, 'r');
    S = textscan(fid, '%s', 'Delimiter', '\n');
    fclose(fid);
    
    % split by delimeter (hard coded as comma!)
    S = cellfun(@(x) strsplit(x, ','), S{1}, 'UniformOutput', false);
    
    % Convert the list of cell arrays to a matrix with padding for unequal lengths
    maxWords = max(cellfun(@length, S));
    S = cellfun(@(x) [x, repmat({''}, 1, maxWords - length(x))], S, 'UniformOutput', false);
    S = vertcat(S{:});

end