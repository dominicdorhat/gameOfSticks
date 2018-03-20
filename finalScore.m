%function to save new high score and display message 
%score is number of turns

function  finalScore(name, score, lvl)
    %calls fileOpen() to read existing high score and name assign it to 2 variables
    [oldName, oldScore] = fileOpen(lvl);
    
    %if a new high score is obtained, a message is displayed
    if score <= oldScore 
        fprintf('Congratulations. You have broken the high score, %s! \n', name);
        %function to save new high score to text file
        fileSave(name, score, lvl);
        
    %if no previous score exists, save current score     
    elseif isempty(oldScore) && isempty(oldName)
        fprintf('\nYou are the first player, %s! Therefore your score will be saved.\n', name);
        fileSave(name, score, lvl);
    
    end
    return
end