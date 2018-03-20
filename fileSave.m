function fileSave(n, s, lvl)
    %opens file based on difficulty played
    switch lvl 
        %EASY text file
        case 1 
            f1 = fopen('nameE.txt','w');
            f2 = fopen('scoreE.txt','w');
            
        %MEDIUM text file   
        case 2 
            f1 = fopen('nameM.txt','w');
            f2 = fopen('scoreM.txt','w');
            
         %HARD text file  
        case 3
            f1 = fopen('nameH.txt','w');
            f2 = fopen('scoreH.txt','w');
    end
    
    %writes score(accepted as one of the parameters) to the text files
    fprintf(f1, '%s', n);
	fprintf(f2, '%d', s);
   
    %close text files
    fclose(f1);
    fclose(f2);
    return
end