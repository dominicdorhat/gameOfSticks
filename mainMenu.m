%% Main Menu
%function that handles User input in the menu
function mainMenu
    
    %loops until player enters a valid input
    FLAG = false;    
    while ~FLAG
        option = str2double(input('Input: ', 's'));

        switch option
            case 1 
                %calls the main game function
                FLAG = true;
                gameOfSticks();
            case 2
                %calls the instruction function to display the manual
                FLAG = true;
                instructions();
        
            case 3 
                %shows highscore 
                FLAG = true;
                highScore();
        
            case 4
                %ends the game and displays final message
                fprintf('\nThank you for playing!\n');
                return
            otherwise
                %display error message for wrong input
                disp('Invalid input!');
         end
    end

end