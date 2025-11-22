%This function is supposed to prompt the user to input a guess word which
%will be later compared with the chosen word

function [guessWord] = guesserv1(i)

    %Define the text which will be used to to prompt the user. Use the
    %num2ordinal function to determine the string to be used depending on
    %which guess this is.
    text = "Enter the "+num2Ordinalv1(i)+" guess: ";
    
    %prompt the user using the above text and store the input as a string
    guessWord = input(text,"s");
    
    %Check if the guessword is of length 5 by converting it to a character
    %array and using length function. Also use the checker function to
    %check the word and detect any flags such as the use of spaces or
    %special characters. If the requirements are fulfilled
    %function ends and returns the guessword as an output.

    while length(char(guessWord)) ~= 5 || checkerv1(guessWord) == true
        
        %While the above condition is true, the user has not submitted a
        %word fitting the guidelines. Inform them with fprint function.
        fprintf("Your guess word did not meet the guidelines! (Word must be 5 letters long, contain no spaces or symbols and be in the word dictionary.) \n")

        %Prompt the user for another word and the while fucntion repeats so
        %on.
        guessWord = input(text,"s");
    end
end