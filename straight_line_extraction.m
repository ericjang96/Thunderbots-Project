% From array "tickArray", add direction, speed, accel,
% and a boolean column that is set to 1 when the ball's
% direction hasn't changed since the last tick

% If direction of ball is within 3 degrees of previous
% tick's direction, considered part of straight line.

% Array col1 = time, col2 = x, col3 = y, col4 = x-velocity
% col5 = y-velocity, col6 = direction, col7 = speed,
% col8 = straightline

midArray = [];

for k = 2:size(tickArray)
        
        x_vel = tickArray(k,4);
        y_vel = tickArray(k,5);
        
        currAngle = atan(tickArray(k,5) / tickArray(k,4));
        prevAngle = atan(tickArray(k-1,5) / tickArray(k-1,4));
        
        currSpeed = sqrt(x_vel^2 + y_vel^2);
        % prevSpeed = sqrt((tickArray(k-1,4))^2 + (tickArray(k-1,5))^2);
        
        if currSpeed < 10
            midArray(k,1) = tickArray(k,1);
            midArray(k,2) = tickArray(k,2);
            midArray(k,3) = tickArray(k,3);
            midArray(k,4) = x_vel;
            midArray(k,5) = y_vel;
            midArray(k,6) = currAngle;
            midArray(k,7) = currSpeed;
            midArray(k,8) = 0;
        end
        
        if (abs(currAngle - prevAngle) < 0.05)
        midArray(k,8) = 1;
        end
end

% deletes rows with zeros
cond = midArray(:,1) == 0;
midArray(cond,:) = [];

clear currAngle;
clear prevAngle;
clear currSpeed;
clear prevSpeed;

