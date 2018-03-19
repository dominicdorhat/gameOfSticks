function[level, rounds] = difficulty(x)
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
