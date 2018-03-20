function[name, score] = fileOpen(lvl)
    %opens 2 text files, depending on the difficulty played 
    switch lvl 
        %EASY high score text file
        case 1
            f1 = fopen('nameE.txt', 'r');
            f2 = fopen('scoreE.txt', 'r');
            
        %MEDIUM high score text file    
        case 2 
            f1 = fopen('nameM.txt', 'r');
            f2 = fopen('scoreM.txt', 'r'); 
            
        %HARD high score text file    
        case 3 
            f1 = fopen('nameH.txt', 'r');
            f2 = fopen('scoreH.txt', 'r');
    end
    
    %if files are not found, display '-' and 0
    if f1 < 0 && f2 < 0 
        name = '-';
        score = 0;
    else
        %if files found, return data from file
        name = fscanf(f1, '%s');
        score = fscanf(f2, '%d');
        
        %close file
        fclose(f1);
        fclose(f2);
    end
end
