function highScore()
    clc;
    [nameE, scoreE] = fileOpen(1);
    [nameM, scoreM] = fileOpen(2);
    [nameH, scoreH] = fileOpen(3);
    
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

end