function  finalScore(name, score, lvl)
    [oldName, oldScore] = fileOpen(lvl);
    
    if score <= oldScore 
        fprintf('Congratulations. You have broken the high score, %s! \n', name);
        fileSave(name, score, lvl);
        
    elseif isempty(oldScore) && isempty(oldName)
        fprintf('\nYou are the first player, %s! Therefore your score will be saved.\n', name);
        fileSave(name, score, lvl);
    
    end
    return
end