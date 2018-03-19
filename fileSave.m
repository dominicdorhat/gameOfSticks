function fileSave(n, s, lvl)
    switch lvl 
        case 1 
            f1 = fopen('nameE.txt','w');
            f2 = fopen('scoreE.txt','w');
        case 2 
            f1 = fopen('nameM.txt','w');
            f2 = fopen('scoreM.txt','w');
        case 3
            f1 = fopen('nameH.txt','w');
            f2 = fopen('scoreH.txt','w');
    end
    
    fprintf(f1, '%s', n);
	fprintf(f2, '%d', s);
   
    fclose(f1);
    fclose(f2);
    return
end