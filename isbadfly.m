function [ output ] = isbadfly( times,crossings)
% ISBADFLY Analyze fly sleep data from crossings and see if the data looks
% wrong. Data is wrong if fly is sleeping for more than 12 hours

%  [OUTPUT] = ISBADFLY(TIMES, CROSSINGS)
%
%
%

match = 0; % match to be used (sleeping)
n = 270; % if the fly is sleeping for more than 12 hours (270 mins)
out = strfind(['0' num2str(crossings'==match,'%1d')],['0' repmat('1',1,n)]); % starting indices of consecutive zeros

if isempty(out) % if vector is empty and fly has been active

    output = 0; % good fly

else

output = 1; % bad fly

end
