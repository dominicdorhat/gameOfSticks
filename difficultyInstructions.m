function difficultyInstructions(x)
    %function displays additional instructions based on difficulty chosen
    switch x 
        case 1 
            fprintf('\nThere will only be 1 round. Win it and you win the match.\n');
           
        case 2
            fprintf('\nThis will be a Best of 3 format.\nWin 2 rounds out of 3 and you win the match.\n');
            
        case 3 
            fprintf('\nWin all 3 rounds to win the match.\n');
            
    end
        fprintf('The less turns used the higher the score.\n');
        fprintf('\nPress anything to continue.\n')
        %pauses until keypress
        pause('on');
        pause;
        
end
    