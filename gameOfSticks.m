function gameOfSticks
        sticks = 20;
        win = 0;
        lose = 0;
        tries = 0;
        
        clc;
        disp('[G A M E  M O D E]:');
        disp('  1 - Single Player')
        disp('  2 - 2 Player')
        disp(' ');       
        
        gameMode = input('Input: ');  
        if gameMode == 1
            clc;
            player = input('Enter your name, Lover of Sticks: ', 's');
            clc;
            fprintf('Welcome, %s the Lover of Sticks.\n\n', player);
            pause(1);
            
            disp('Select difficulty: ');
            disp('   1 -   EASY');
            disp('   2 -   MEDIUM');
            disp('   3 -   HARD');
            disp(' ');
            
            difficultyOption = input ('Input: ');
            [lvl, match] = difficulty(difficultyOption);
            difficultyInstructions(lvl);
            turn = randperm(2, 1);            
            clc;
           
            for n = 1:match
                clc;
                fprintf('[  R O U N D  %d  ] \n', n);
                pause(1);
                
                while sticks > 0
                    if turn == 1 
                        clc;
                        tries = tries + 1;

                        fprintf('[YOUR TURN] \n\n')
                        stickMsg(sticks);
                        disp('How many sticks would you like to remove?')
                        fprintf('\n Sticks: \n');
                        disp(' | 1 | 2 | 3 | 4 for RANDOM |');
                        disp(' ');
                   
                        %pseudo do while loop since there is no do while loop
                        %in matlab
                        while true
                            playerChoice = input('Choice: ');
                            if ~isempty(playerChoice)
                                if playerChoice > 0 && playerChoice < 4 && sticks >= playerChoice
                                    sticks = sticks - playerChoice;    
                                    fprintf('\nYou took %d stick(s). \n\n', playerChoice);
                                    break
                                
                                elseif playerChoice == 4
                                    fprintf('\nYou chose to random!\n');
                                    pause(1/2);                                
                                    randomSticks = random(sticks);                                    
                                    sticks = sticks - randomSticks;     
                                    fprintf('You randomly take %d stick(s). \n\n', randomSticks);
                                    pause(1);
                                    break   
                             
                                %restricts stick options from 1 to 3
                                elseif playerChoice <= 0 || playerChoice > 4
                                    disp('You can only take 1 to 3 sticks!');     
                            
                                %prevents player from taking more than the
                                %available sticks left 
                                elseif playerChoice > sticks 
                                    if sticks > 1
                                        fprintf('There are only %d sticks left! \n', sticks);                                
                                    elseif sticks == 1
                                        fprintf('There is only 1 stick left! \n');
                                    end
                                end
                            end
                        end
                      
                        if sticks == 0
                            clc;
                            lose = lose + 1;
                            disp('You lost the round!');
                        end
                   
                        pause(1);
                        turn = 2;
                     
                    elseif turn == 2
                        clc;
                        fprintf('[Computer''s turn] \n\n');                       
                        stickMsg(sticks);                       
                        
                        if sticks > 2
                            compSticks = randperm(3,1);
                        elseif sticks == 2
                            compSticks = randperm(2,1);
                        elseif sticks == 1
                            compSticks = 1;
                        end
                        sticks = sticks - compSticks;                        
                        fprintf('The computer took %d stick(s). \n\n', compSticks);
                        fprintf('\nPress anything to continue.\n');
                        pause('on');
                        pause;                        
                                            
                        if sticks == 0
                            clc;
                            win = win + 1;
                            disp('You won the round!');
                            pause(1);
                        end                   
                        turn = 1;
                    end
                end
                sticks = 20;
                result = winloss(lvl, win, lose, player, tries);
                
                if result == 1
                    break
                end
            end
            
        elseif gameMode == 2
            
            turn = randperm(2,1);            
            pause(1/2);
            clc;
           
            while sticks > 0
                if turn == 1 
                    clc;
                    fprintf('[Player 1''s turn] \n\n')
                    
                    stickMsg(sticks);
                    disp('How many sticks would you like to remove?')
                    fprintf('\n Sticks: \n');
                    disp(' | 1 | 2 | 3 | 4 for RANDOM |');
                    disp(' ');
                   
                    %pseudo do while loop since there is no do while loop
                    %in matlab
                    while true
                        player1Choice = input('Choice: ');
                        if ~isempty(player1Choice)
                            if player1Choice > 0 && player1Choice < 4 && sticks >= player1Choice
                                sticks = sticks - player1Choice;    
                                fprintf('\nPlayer 1 takes %d stick(s). \n\n', player1Choice);
                                break
                                
                            elseif player1Choice == 4
                                fprintf('\nPlayer 1 chooses to random!\n');
                                pause(1/2)
                                rndSticks = random(sticks);                                
                                sticks = sticks - rndSticks;                               
                                fprintf('Player 1 randomly takes %d stick(s). \n\n', rndSticks);
                                pause(1/2);
                                break   
                             
                             %restricts stick options from 1 to 3
                            elseif player1Choice <= 0 || player1Choice > 4
                                disp('You can only take 1 to 3 sticks!');     
                            
                             %prevents player from taking more than the
                             %available sticks left 
                            elseif player1Choice > sticks 
                                if sticks > 1
                                    fprintf('There are only %d sticks left! \n', sticks);                                
                                elseif sticks == 1
                                    fprintf('There is only 1 stick left! \n');
                                end
                            end
                        end
                     end
                      
                     if sticks == 0
                         pause(1);
                        clc;
                        disp('Player 1 lost!');
                     end                   
                     pause(1);
                     turn = 2;

                elseif turn == 2
                    clc;
                    fprintf('[Player 2''s turn] \n\n')                  
                    stickMsg(sticks);   
                    disp('How many sticks would you like to remove?')
                    fprintf('\n Sticks: \n');
                    disp(' | 1 | 2 | 3 | 4 for RANDOM |');
                    disp(' ');
                   
                    %pseudo do while loop since there is no do while loop
                    %in matlab
                    while true
                        player2Choice = input('Choice: ');
                        if ~isempty(player2Choice)
                            if player2Choice > 0 && player2Choice < 4 && sticks >= player2Choice
                                sticks = sticks - player2Choice;
                                fprintf('\nPlayer 2 takes %d stick(s). \n\n', player2Choice);
                                break
                                
                            elseif player2Choice == 4
                                fprintf('\nPlayer 2 chooses to random!\n');
                                pause(1/2)
                                rndSticks = random(sticks);                               
                                sticks = sticks - rndSticks;                                
                                fprintf('Player 2 randomly takes %d stick(s). \n\n', rndSticks);
                                pause(1/2);
                                break   
                             
                             %restricts stick options from 1 to 3
                            elseif player2Choice <= 0 || player2Choice > 4
                                disp('You can only take 1 to 3 sticks!');     
                            
                             %prevents player from taking more than the
                             %available sticks left 
                            elseif player2Choice > sticks 
                                if sticks > 1
                                    fprintf('There are only %d sticks left! \n', sticks);                                
                                elseif sticks == 1
                                    fprintf('There is only 1 stick left! \n');
                                end
                            end
                        end
                     end
                      
                     if sticks == 0
                         pause(1);
                        clc;
                        disp('Player 2 lost!');
                     end
                   
                     pause(1);
                     turn = 1;
                 end
             end           
        end
end