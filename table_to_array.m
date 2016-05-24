% Must import the game log file as table

% Transfers data from table to an array (minimizes runtime)
% The table is filtered to add only the rows with the first
% column set to 'tick' to the new array.

% The array setup is:
% col1 = time, col2 = x, col3 = y, col4 = x-velocity
% col5 = y-velocity


data = BallData;
tickArray = [];
k = 1;

for j = 1:height(data)
    if strcmp(data{j,1} , 'Tick') == 1
        tickArray(k,1) = data{j,'time'};
        tickArray(k,2) = data{j,'x'};
        tickArray(k,3) = data{j,'y'};
        k = k + 1;
    end
end

for k = 2:size(tickArray)
        tickArray(k,4) = (tickArray(k,2) - tickArray(k-1,2))/(tickArray(k,1) - tickArray(k-1,1));
        tickArray(k,5) = (tickArray(k,3) - tickArray(k-1,3))/(tickArray(k,1) - tickArray(k-1,1));
end

tickArray(1,:) = [];



