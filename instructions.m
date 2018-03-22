function instructions 
    %shows instructions for the game 
    clc;
    fprintf(' [I N S T R U C T I O N S] \n\n');
    fprintf('   In the game of sticks, there are 20 sticks on the board.\n');
    fprintf('   On each player''s turn, they may pick 1 to 3 sticks.\n');
    fprintf('   The player may also choose to randomly pick the number of sticks.\n');
    fprintf('   The last player who picks up the last stick loses.\n\n');
    fprintf('   When there is only 1 stick left however,\n'); 
    fprintf('   players can depend on their luck to survive the round by\n');
    fprintf('   choosing the random option whereby the player might randomly pick 0 sticks.\n');
    
    %prompts user to return to main menu 
    fprintf('\nReturn to main menu?[1 - Yes | 2 - No]\n');
    
    %loops until user enters a valid input
    while true
        answer = str2double(input('Input: ', 's'));
        if answer == 1 || answer == 2
            break
        else 
            disp('Invalid input!');
        end
    end
    
    if answer == 1
        clear;
        %calls the menu function 
        menuUI();
        mainMenu();
    elseif answer == 2
        %exits the game 
        return
    end

end