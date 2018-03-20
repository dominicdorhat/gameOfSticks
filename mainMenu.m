%% Main Menu
%function that handles User input in the menu
function mainMenu
    option = input('Input: ');

    switch option
        case 1 
            %calls the main game function
            gameOfSticks();
        case 2
            %calls the instruction function to display the manual
            instructions();
        
        case 3 
            %shows highscore 
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