function[name, score] = fileOpen(lvl)
    switch lvl 
        case 1
            f1 = fopen('nameE.txt', 'r');
            f2 = fopen('scoreE.txt', 'r');
        case 2 
            f1 = fopen('nameM.txt', 'r');
            f2 = fopen('scoreM.txt', 'r'); 
        case 3 
            f1 = fopen('nameH.txt', 'r');
            f2 = fopen('scoreH.txt', 'r');
    end
    
    %if files are not found, display '-' and 0
    if f1 < 0 && f2 < 0 
        name = '-';
        score = 0;
    else
        name = fscanf(f1, '%s');
        score = fscanf(f2, '%d');
        fclose(f1);
        fclose(f2);
    end
end
