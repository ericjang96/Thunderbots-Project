% Creates new array from midArray of the x,y,z
% components for the linear regression model.

% col1 = change in time = y
% col2 = distance travelled = z
% col3 = initial velocity = x

for k = 2:size(midArray)
    
    prevRow = midArray(k-1,:);
    
    if midArray(k,8) == 1
        
        if midArray(k-1,8) == 0
            finalArray(k,1) = 0;
            finalArray(k,2) = 0;
            finalArray(k,3) = (midArray(k,7)+midArray(k-1,7))/2;
            if midArray(k+1,8) == 1
                finalArray(k,3) = (midArray(k,7)+midArray(k-1,7)+midArray(k+1,7))/3;
            end
        end
        
        if midArray(k-1,8) == 1
            distfromprev = sqrt((midArray(k,2) - midArray(k-1,2))^2 + (midArray(k,3) - midArray(k-1,3))^2);
            finalArray(k,1) = (finalArray(k-1,1) + (midArray(k,1) - midArray(k-1,1)));
            finalArray(k,2) = (finalArray(k-1,2) + distfromprev);
            finalArray(k,3) = finalArray(k-1,3);
        end
    end
    finalArray(k,4) = midArray(k,8);
end

indices = find(finalArray(:,4)==0);
finalArray(indices,:) = [];

x = finalArray(:,3);
y = finalArray(:,1);
z = finalArray(:,2);