%accepts the remaining number of sticks left as parameter
function[rnd] = random(s)
    %if sticks more than 3, generate number from 1 to 3
    if s > 2
        rnd = randperm(3, 1);
        return
    %if sticks is 2, generates number from 1 to 2
    elseif s == 2
        rnd = randperm(2, 1);
        return
        
    %'luck survival' feature as mentioned in documentation
    %allows user to survive the last round 
    %generates number from 0 to 1
    elseif s == 1 
        rnd = round(rand);
        return
        
    end
        
end