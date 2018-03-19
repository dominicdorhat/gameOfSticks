function[r] = winloss(lvl, w, lo, p, t)
    clc;
    msg1 = 'Y O U  W O N!';
    msg2 = 'Y O U  L O S T!';
    
    switch lvl
        case 1
            if w == 1 && lo == 0
                disp(msg1);
                fprintf('\nTurns taken: %d \n', t);
                finalScore(p, t, lvl);
                r = 1;
                return
                
            elseif w == 0 && lo == 1
                disp(msg2);
                r = 1;
                return
                
            end
            
        case 2
            if w == 2 && lo == 1 % lww
                disp(msg1);
                fprintf('\nTurns taken: %d \n', t);
                finalScore(p, t, lvl);
                r = 1;
                return
                
            elseif w == 2 && lo == 0 %ww
                disp(msg1);
                fprintf('\nTurns taken: %d \n', t);
                finalScore(p, t, lvl);
                r = 1;
                return
                
            elseif w == 0 && lo == 2 %ll
                disp(msg2);
                r = 1;
                return
                
            elseif w == 1 && lo == 2 %lwl and wll
                disp(msg2);
                r = 1;
                return
                
            else 
                r = 0;
            end
            
        case 3
            if w == 3 
                disp(msg1);
                fprintf('\nTurns taken: %d \n', t);
                r = 1;
                finalScore(p, t, lvl);
                return
                
            elseif lo > 0
                disp(msg2);
                r = 1;
                pause(1);
            else
                r = 0;
            end
    end
end
    