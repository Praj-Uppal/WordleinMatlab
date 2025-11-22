%Function for determining if the user wishes to replay the game
function [] = replayv1(replayOption)

%Depending on the value of the replay option, the user wishes to replay the
%game or not. If the value is 1, reinvoke the Wordle function and trigger
%the begining of a new game. If the value is 2, player does not wish to 
% replay, and so close all, clear memory and command window and return.
switch replayOption
    case 1
        Wordle()
    otherwise
        clear all
        close all
        clc
        return
end
end