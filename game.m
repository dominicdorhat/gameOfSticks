%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   G A M E  O F  S T I C K S   %%%
%%%                               %%%
%%%                               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; 
clc;

%% Interface
disp('   T H E  G A M E  O F  S T I C K S   ');
disp(' ');
disp('Commands: ');
disp('   1 -   Start Game');
disp('   2 -   Instructions');
disp('   3 -   High Score');
disp('   4 -   Exit');
disp(' ');

%% Game 

option = input('Input: ');

switch option
    case 1 
        gameOfSticks();
    case 2
        instructions();
        gameOfSticks();
        
    case 3 
        highScore();
        
    case 4
        fprintf('\nSo you don''t like sticks afterall!\n');
        return
    otherwise
        disp('Invalid input!');
end





