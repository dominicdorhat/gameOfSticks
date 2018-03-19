function[rnd] = random(s)
    if s > 2
        rnd = randperm(3, 1);
        return
        
    elseif s == 2
        rnd = randperm(2, 1);
        return
        
    elseif s == 1 
        rnd = round(rand);
        return
        
    end
        
end