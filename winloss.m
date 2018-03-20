%function that determines if player has won or lost the match based on the
%difficulty level, and future actions if match is won/lost 

%accepts level of difficulty, number of won rounds, number of lost rounds,
%   player name and number of tries as parameters
%returns variable 'r' that either breaks or keeps iterating the loop
function[r] = winloss(lvl, w, lo, p, t)
    clc;
    msg1 = 'Y O U  W O N!';
    msg2 = 'Y O U  L O S T!';
    
    switch lvl
        %EASY difficulty
        case 1
            %1 win 
            if w == 1 && lo == 0
                disp(msg1);
                %displays turns taken
                fprintf('\nTurns taken: %d \n', t);
                %opens up final score function before ending
                finalScore(p, t, lvl);
                r = 1;
                return
            %1 lost    
            elseif w == 0 && lo == 1
                disp(msg2);
                r = 1;
                return
                
            end
            
        %MEDIUM difficulty (best out of 3)    
        case 2
            %lose win win (won match)
            if w == 2 && lo == 1 
                disp(msg1);
                %displays turns taken
                fprintf('\nTurns taken: %d \n', t);
                %opens up final score function before ending
                finalScore(p, t, lvl);
                r = 1;
                return
                
             %win win (won match)
            elseif w == 2 && lo == 0
                disp(msg1);
                fprintf('\nTurns taken: %d \n', t);
                %opens up final score function before ending
                finalScore(p, t, lvl);
                r = 1;
                return
                
            %lose lose
            elseif w == 0 && lo == 2 
                disp(msg2);
                r = 1;
                return
            
            %lose win lose / win lose lose (lost match)   
            elseif w == 1 && lo == 2 %lwl and wll
                disp(msg2);
                r = 1;
                return
                
            else 
                r = 0;
            end
            
        %HARD difficulty (win all 3)    
        case 3
            %win win win (won match)
            if w == 3 
                disp(msg1);
                %displays turns taken
                fprintf('\nTurns taken: %d \n', t);
                r = 1;
                %opens up final score function before ending
                finalScore(p, t, lvl);
                return
             
             %lose (lost match)   
            elseif lo > 0
                disp(msg2);
                r = 1;
                pause(1);
            else
                r = 0;
            end
    end
end
    