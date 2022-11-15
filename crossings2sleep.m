function [ sleep_vector] = crossings2sleep(times,crossings)

%CROSSING2SLEEP Analyze fly sleep data from crossings and times

%  [SLEEP_VECTOR, TIME_SLEEP, MYSLEEPREC,] = CROSSINGS2SLEEP(TIMES,
%  CROSSINGS)

%

%  Takes as input measurement times and cross detections and returns 
%  sleep_vector, time_sleep, and mysleeprec vectors

%  

% SLEEPVECTOR: indicates for each measurement time if the animal is asleep

i = 1

sleep_vector = [ ]; % put into one table
quiet_counter = 0
sleeping_now = 0

for i=1:numel(crossings),

t1 = i + 5 %(1/60)*5 % time plus 5 mins ahead
EX = crossings(i:t1,:) % look at time within that window

    if sum(EX) == 0 % if not moving
    sleeping_now = 1 % set it to sleeping
    quiet_counter = 5 % sleeping for 5 mins

    else,   % sum(EX) > 0 % if is moving
    sleeping_now = 0 % set sleeping now to zero
    quiet_counter = 0 % set quiet counter to zero

   i = i+1

    end;
     

sleep_vector(end+1) = sleeping_now;

end;

% % TIMESLEEP: center time of each half hour window 
% edges = 0:0.5:times(end); % time is in hrs, so 1/5 hr is every 0.5 
% time_bins = discretize(times, edges); % seperate times into 30 min intervals
% time_sleep = splitapply(@median,times, time_bins); % apply bins and calculate median of bins      
% 
% 
% % MYSLEEPREC: 
% mysleeprec = splitapply(@sum, sleep_vector, time_bins); % sum of the crossing in each interval
% 

end