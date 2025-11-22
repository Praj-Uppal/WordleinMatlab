%This program is intended to verify and check that the provided word contains no spaces or special symbols, only
%letters

%Define function which returns a binary result and takes the guess word,
%and the acceptable 14855 list of words as an input
function [result] = checkerv2(word,listOfWords)

    %Define the result flag to be false at begining of the function and
    %update it to true if conditions are not met
    result = false;

    %Convert the word to a character array
    wordChar = char(word);

    %Use an if condition to check that the length of the input word is 5
    %letters long. 
    if length(wordChar) ~= 5
        
        %if condition not met, set result flag to true and return the
        %function as no further checks neccessary
        result = true;
        return

    end

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

       %Convert the guess word to a character array consisting of lowercase
       %letters as to have reached this point in the function, it must have
       %passed all the above conditions. Thus, it must be a string of
       %acceptable letters and can be used with the previously defined
       %casing funciton.
       guessChar = casingv2(word);

       %Use an if condition and the ismember function to check if the guess
       %words character array is in the list of words character array, and
       %thus is an acceptable 5 letter word. If the result of the ismember
       %function is 0, then the guess word is not in the accepted list of
       %words, and if its 1 it is. 
       if ismember(guessChar,listOfWords) == 0
          
           %If guess word not in word list, set result to true and return
           %the function
           result = true;
           return

       else
       end
end
