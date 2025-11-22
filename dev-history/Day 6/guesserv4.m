%This function is supposed to prompt the user to input a guess word which
%will be later compared with the chosen word

function [guessWord] = guesserv4(i,listOfWords)

    %Define the text which will be used to to prompt the user. Use the
    %num2ordinal function to determine the string to be used depending on
    %which guess this is.
    text = "Enter the "+num2Ordinalv1(i)+" guess: ";
    
    %prompt the user using the above text and store the input as a string
    guessWord = input(text,"s");
    
    %Use the checker function to check the word and detect any flags such 
    %as the use of spaces, special characters or the guess word not being 
    %in the 14855 word dictionary being used for the game. Also check if 
    % the guessword is of length 5 by converting it to a character array 
    % and using length function. If the requirements are fulfilled function
    % ends and returns the guessword as an output. 
    
    %Define return values of the checker function, with result being a
    %binary output which is set to true if a condition was not fulfilled
    %and the error code represents the first condition which the result
    %flag was triggered by.
    [result, errorCodes] = checkerv3(guessWord,listOfWords);
    
        while result == true
        
        %Based on the errorcode returned by the checker function, a
        %different message is printed in the command window informing the
        %user which requirements were not fulfilled.

        %Use a for loop to iterate over each error code and check if it was
        %flagged. If flagged based on the loop iteration index, i, a
        %different error message will be displayed informing the user of
        %thier mistake.
        for i = 1:3
                if errorCodes(i) == 1
                        switch i
                            case 1
                                fprintf("You guess was not 5 letters! \n")
                            case 2
                                fprintf("Your guess contained spaces or special symbols! \n")
                            case 3
                                fprintf("Your guess was not in the dictionary! \n")
                        end
                end
                
        end
        %While the above condition is true, the user has not submitted a
        %word fitting the guidelines. Inform them with fprint function.
        fprintf("Your guess word did not meet the guidelines! (Word must be 5 letters long, contain no spaces or symbols and be in the word dictionary.) \n")

        %Prompt the user for another word and the while fucntion repeats so
        %on.
        guessWord = input(text,"s");

        %Redefine result and code for next iteration of loop
        [result,errorCodes] = checkerv3(guessWord,listOfWords);
    end
end