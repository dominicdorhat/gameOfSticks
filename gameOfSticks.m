function gameOfSticks
        clear;
        %initializes important variables
        sticks = 20;
        win = 0;
        lose = 0;
        tries = 0;
        
        clc;
        
        disp('[G A M E  M O D E]:');
        disp('  1 - Single Player')
        disp('  2 - 2 Player')
        disp(' ');       
        
        FLAG = false;
        while ~FLAG
        gameMode = str2double(input('Input: ', 's'));  
            if gameMode == 1
                FLAG = true;
                %[single player mode]
                clc;
                player = input('Enter your name, Lover of Sticks: ', 's');
                clc;
            
                fprintf('Welcome, %s the Lover of Sticks.\n\n', player);
            
                %difficulty menu
                disp('Select difficulty: ');
                disp('   1 -   EASY');
                disp('   2 -   MEDIUM');
                disp('   3 -   HARD');
                disp(' ');
            
                FLAG1 = false;
                while ~FLAG1 
                    difficultyOption = str2double(input ('Input: ', 's'));
                    if difficultyOption == 1 || difficultyOption == 2 || difficultyOption == 3
                        FLAG1 = true;
                    else
                        disp('Invalid input!');
                    end
                end
                %variable 'match' determines the level of difficulty and amount of
                %   rounds to be played 
                %variable 'lvl' determines what instruction to show 
                [lvl, match] = difficulty(difficultyOption);
                %calls the instruction display based on variable 'lvl'
                difficultyInstructions(lvl);
                %generate random number from 1 to 2 to determine who starts
                %   first
                turn = randperm(2, 1);            
                clc;
           
                %no. of iterations based on variable 'match'
                for n = 1:match
                    clc;
                    %displays the current iteration/round
                    fprintf('[  R O U N D  %d  ] \n', n);
                    pause(1);
                
                    %loops until sticks == 0
                    while sticks > 0
                        %players turn
                        if turn == 1 
                            clc;
                            %tracks the number of turns (determines score)
                            tries = tries + 1;

                            fprintf('[YOUR TURN] \n\n')
                            %calls function to display number of sticks
                            %   available
                            stickMsg(sticks);
                            disp('How many sticks would you like to remove?')
                            fprintf('\n Sticks: \n');
                            disp(' | 1 | 2 | 3 | 4 for RANDOM |');
                            disp(' ');
                   
                            %pseudo do while loop since there is no do while loop
                            %   in matlab
                            while true
                                playerChoice = str2double(input('Choice: ', 's'));
                                %ensures user input
                                if ~isempty(playerChoice)
                                    %restricts user from entering illegal input
                                    % only 1 2 3 accepted
                                    if playerChoice > 0 && playerChoice < 4 && sticks >= playerChoice
                                        %decreases chosen amount from variables
                                        %   'sticks'
                                        sticks = sticks - playerChoice;    
                                        fprintf('\nYou took %d stick(s). \n\n', playerChoice);
                                        break
                                
                                        %option for user to random
                                    elseif playerChoice == 4
                                        fprintf('\nYou chose to random!\n');
                                        pause(1/2);
                                        %calls function that generates numbers
                                        randomSticks = random(sticks);                                    
                                        sticks = sticks - randomSticks;     
                                        fprintf('You randomly take %d stick(s). \n\n', randomSticks);
                                        pause(1);
                                        break   
                             
                                    %display message for illegal input
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
                                    else
                                        disp('Invalid input!');
                                    end
                                end
                            end
                      
                            if sticks == 0
                                clc;
                                %tracks the number of lost rounds
                                lose = lose + 1;
                                disp('You lost the round!');
                            
                            end
                   
                            pause(1);
                            %hands over turn to the AI
                            turn = 2;
                     
                        elseif turn == 2
                            clc;
                            fprintf('[Computer''s turn] \n\n');                       
                            stickMsg(sticks);                       
                        
                            %generates number from 3 to 1
                            if sticks > 2
                                compSticks = randperm(3,1);
                            %AI will take 1 stick, making it difficult for the
                            %player
                            elseif sticks == 2
                                %compSticks = randperm(2,1);
                                compSticks = 1;
                            
                            %AI does not have 'luck survival' feature to prevent unfairness    
                            elseif sticks == 1
                                compSticks = 1;
                            end
                            sticks = sticks - compSticks;                        
                            fprintf('The computer took %d stick(s). \n\n', compSticks);
                            %pauses the program until keypress to enable user
                            %to read at a desired pace
                            fprintf('\nPress anything to continue.\n');
                            pause('on');
                            pause;                        
                                            
                            if sticks == 0
                                %tracks number of won rounds
                                clc;
                                win = win + 1;
                                disp('You won the round!');
                                pause(1);
                            end
                            %hands over turn to user
                            turn = 1;
                        end
                    end
                    %reinitializes sticks to 20 for futher iterations (rounds)
                    sticks = 20;
                    %calls a function to determine if match is already won/lost
                    %or not 
                    result = winloss(lvl, win, lose, player, tries);
                
                    %if winloss() determines match is won/lost 
                    if result == 1
                        %prompts user to menu
                        fprintf('\nReturn to main menu?[1 - Yes | 2 - No]\n');
                        
                        while true
                            %accepts strings or integer as input then
                            %converts it to double
                            answer = str2double(input('Input: ', 's'));
                            
                            if answer == 1 || answer == 2
                                break
                            else 
                                disp('Invalid input!');
                            end
                        end
    
                        if answer == 1
                            %calls menu function
                            menuUI();
                            mainMenu();
                        elseif answer == 2
                            %exit
                                return
                        end
                    end
                end
            
            %[2-player mode]
            elseif gameMode == 2
            
                FLAG = true;
                %determines first playerr
                turn = randperm(2,1);            
                pause(1/2);
                clc;
           
                %loops until sticks == 0
                while sticks > 0
                
                    %[Player 1]
                    if turn == 1 
                        clc;
                        fprintf('[Player 1''s turn] \n\n')
                    
                        %calls function to display number of sticks
                        %   available
                        stickMsg(sticks);
                        disp('How many sticks would you like to remove?')
                        fprintf('\n Sticks: \n');
                        disp(' | 1 | 2 | 3 | 4 for RANDOM |');
                        disp(' ');
                   
                        %pseudo do while loop since there is no do while loop
                        %in matlab
                        while true
                            player1Choice = str2double(input('Choice: ', 's'));
                            if ~isempty(player1Choice)
                                %restricts Player 1 from entering illegal input
                                % only (1 or 2 or 3) accepted
                                if player1Choice > 0 && player1Choice < 4 && sticks >= player1Choice
                                    sticks = sticks - player1Choice;    
                                    fprintf('\nPlayer 1 takes %d stick(s). \n\n', player1Choice);
                                    %exits do while loop 
                                    break
                             
                                %option for Player1 to random
                                elseif player1Choice == 4
                                    fprintf('\nPlayer 1 chooses to random!\n');
                                    pause(1/2)
                                    %function to generate random numeber
                                    rndSticks = random(sticks);                                
                                    sticks = sticks - rndSticks;                               
                                    fprintf('Player 1 randomly takes %d stick(s). \n\n', rndSticks);
                                    pause(1/2);
                                    %exits do while loop 
                                    break   
                             
                                %display message for illegal input
                                elseif player1Choice <= 0 || player1Choice > 4
                                    disp('You can only take 1 to 3 sticks!');     
                            
                                %prevents player 1 from taking more than the
                                %available sticks left 
                                elseif player1Choice > sticks 
                                    if sticks > 1
                                        fprintf('There are only %d sticks left! \n', sticks);                                
                                    elseif sticks == 1
                                        fprintf('There is only 1 stick left! \n');
                                    end
                                else
                                    disp('Invalid input!');
                                end
                            end
                        end
                      
                        %Player 1 picks last stick and loses
                        if sticks == 0
                            pause(1);
                            clc;
                            disp('Player 1 lost!');
                            %prompt user to menu
                            fprintf('\nReturn to main menu?[1 - Yes | 2 - No]\n');
                            answer = input('Input: ');
    
                            %calls the menu function    
                            if answer == 1
                                menuUI();
                                mainMenu();
                            
                            elseif answer == 2
                                %exit game
                                return
                            end
                        end                   
                        pause(1);
                        %hands over turn to Player 2
                        turn = 2;

                    %[Player 2]        
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
                            player2Choice = str2double(input('Choice: ', 's'));
                            if ~isempty(player2Choice)
                                %restricts Player 2 from entering illegal input
                                % only (1 or 2 or 3) accepted
                                if player2Choice > 0 && player2Choice < 4 && sticks >= player2Choice
                                    sticks = sticks - player2Choice;
                                    fprintf('\nPlayer 2 takes %d stick(s). \n\n', player2Choice);
                                    break
                                
                                %option for player 2 to random    
                                elseif player2Choice == 4
                                    fprintf('\nPlayer 2 chooses to random!\n');
                                    pause(1/2)
                                    %function to generate random numbers based
                                    %on the value of 'sticks'
                                    rndSticks = random(sticks);                               
                                    sticks = sticks - rndSticks;                                
                                    fprintf('Player 2 randomly takes %d stick(s). \n\n', rndSticks);
                                    pause(1/2);
                                    break   
                             
                                %display message for illegal input
                                elseif player2Choice <= 0 || player2Choice > 4
                                    disp('You can only take 1 to 3 sticks!');     
                            
                                %prevents player 2 from taking more than the
                                %available sticks left 
                                elseif player2Choice > sticks 
                                    if sticks > 1
                                        fprintf('There are only %d sticks left! \n', sticks);                                
                                    elseif sticks == 1
                                        fprintf('There is only 1 stick left! \n');
                                    end
                                else 
                                    disp('Invalid input!');
                                end
                            end
                        end
                      
                        %Player 2 picks last stick and loses
                        if sticks == 0
                            pause(1);
                            clc;
                            disp('Player 2 lost!');
                            fprintf('\nReturn to main menu?[1 - Yes | 2 - No]\n');
                            
                            %loops until player enters a valid input
                            while true
                                answer = str2double(input('Input: ', 's'));
                                if answer == 1 || answer == 2
                                    break;
                                else
                                    disp('Invalid input!');
                                end
                            end
    
                            %calls menu function
                            if answer == 1
                                menuUI();
                                mainMenu();
                            
                            elseif answer == 2
                                return
                            end
                        end
                   
                        pause(1);
                        %hands over turn to Player 1
                        turn = 1;
                    end
                end            
            else
                disp('Invalid input!');
            end
        end
end