%This function is intended to compare the guess word to the randomly
%selected word and ouput a string of clues depending on the guess word. if
%the letter is in the word and in the correct position, resulting vector
%will have a 2 at that index. If the letter is in the word but not in the
%correct position, resulting vector will have a 1 at that index. If the
%letter is not in the word, resulting vector will have a 0 at that index.

function [result] = comparerv1(guessWord,chosenWord)

    %Convert guess word and character word into thier lowercase character
    %arrays using the pre-defined casing function.
    guessChar = casingv1(guessWord);
    chosenChar = casingv1(chosenWord);

    %Define a 1x5 result vector containing zeroes that will update based on
    %comparison
    result = zeros(1,5);
    
    %Use a for loop to iterate over each guess character entry, and use
    %another nested for loop to iterate over each entry of the chosen
    %character array and compare it to the guess character entry. If the
    %guess character is the same as the chosen character, update the entry
    %of the result vector at that index to 1 to indicate yellow. if it 
    %is the same as the chosen words letter at that position, update the 
    % entry of the result vector at that index to 2 to
    %indicate green.
    for i = 1:5
        for j = 1:5
             switch guessChar(i)
                case chosenChar(j)
                    result(i) = 1;
                otherwise
             end
        end
        switch guessChar(i)
            case chosenChar(i)
                    result(i) = 2;
            otherwise
        end
    end
end
