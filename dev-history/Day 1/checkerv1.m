%This program is intended to verify and check that the provided word contains no spaces or special symbols, only
%letters

%Define function which returns a binary result and takes the guess word,
%and the acceptable 14855 list of words as an input
function [result] = checkerv1(word)

    %Define the result flag to be false at begining of the function and
    %update it to true if conditions are not met
    result = false;

    %Convert the word to a character array
    wordChar = char(word);

  

    %Use a for loop to iterate over each letter of the word and check if
    %its within the ascii alphabet ranges for uppercase characters of 65
    %and 90, or within the lowercase ascii alphabet ranges of 97 and 122.
    %If letter is within these ranges, nothing occurs whereas if it isnt,
    %the result flag is set to true and the function is returned.
    for i = 1:length(wordChar)
        
        %Convert the letter into its ascii code by converting the character
        %to a double format number.
        ascii = double(wordChar(i));
        
        %Use the if condition to check for lowercase letter
        if (ascii >= 97 && ascii <= 122)

        %Use another if condition to check for uppercase characters   
        elseif (ascii >= 65 && ascii <= 90) 
        
        %Else set result flag to true and return function.
        else
            result = true;
            return
        end
        
    end

end