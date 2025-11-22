%This program is intended to use switch cases to develop a function which
%outputs the ordinal version of the word index as a string for the first 6
%numbers (6 guess max)

%Define function with input index
function [ordinal] = num2ordinal(index)

%Depending on the value of index, use a switch case to determine the value
%that the string ordinal should assume. In the case that index value
%exceeds 6 or is not defined, simply use num2string as a backup.
    switch index
        case 1
            ordinal = "first";
        case 2
            ordinal = "second";
        case 3 
            ordinal = "third";
        case 4 
            ordinal = "fourth";
        case 5
            ordinal = "fifth";
        case 6 
            ordinal = "sixth";
        otherwise
            ordinal = num2str(index);
    end
end
