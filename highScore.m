function highScore()
    clc;
    %opens high score text file, respective to each difficulty levels
    [nameE, scoreE] = fileOpen(1);
    [nameM, scoreM] = fileOpen(2);
    [nameH, scoreH] = fileOpen(3);
    
    %if text files contains no data, display name as '-' and score as 0
    if isempty(nameE) && isempty(scoreE)
        nameE = '-';
        scoreE = 0;
        
    end
    if isempty(nameM) && isempty(scoreM)
        nameM = '-';
        scoreM = 0;
        
    end
        
    if isempty(nameH) && isempty(scoreH)
        nameH = '-';
        scoreH = 0;
        
    end
    
    %displays highest score obtained by difficulty
    fprintf('[H I G H  S C O R E] \n\n');
    fprintf('[Easy] \n');
    fprintf('   Name: %s\n', nameE);
    fprintf('   Turns: %d\n\n', scoreE);
    
    fprintf('[Medium] \n');
    fprintf('   Name: %s\n', nameM);
    fprintf('   Turns: %d\n\n', scoreM);
    
    fprintf('[Hard] \n');
    fprintf('   Name: %s\n', nameH);
    fprintf('   Turns: %d\n\n', scoreH);
    
    fprintf('**The less turns used the better.\n\n');
    
    %prompts user to menu
    fprintf('Return to main menu?[1 - Yes | 2 - No]\n');
    answer = input('Input: ');
    
    %calls menu function
    if answer == 1
        menuUI();
        mainMenu();
    elseif answer == 2
        return
    end
    

end