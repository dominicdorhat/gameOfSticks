%expects user input from choosing the difficulty 
function[level, rounds] = difficulty(x)
    %based on difficulty chosen, outputs 2 different values saved to 2
    %   variables
    %variable 'level' used to determine the displayed instruction in another function 
    %variable 'rounds' determines number of iterations of while loop in the
    %   gameofSticks function
    
    switch x
        case 1 
            level = 1;
            rounds = 1;
        case  2
            level = 2;
            rounds = 3;
        case 3 
            level = 3;
            rounds = 3;
        otherwise
            msg = 'Invalid input!';
            error(msg);
    end
end
