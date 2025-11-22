%This program contains all the code used in the wordle game including
%functions, driver functions, etc.
hello :)
%This program contains the code for the Wordle game

%This program contains the code for the Wordle game
function [] = Wordle()
%Clear stored data, command line, etc to prevent any memory issues
clear all
close all
clc

%Print rules and welcome user
fprintf("Welcome to Wordle!\n")
fprintf("How to play Wordle: \n")
fprintf("Each guess must be a valid 5 letter word.\n")
fprintf("The color of a tile will change to show you how close your guess word was.\n")
fprintf("If the tile turns green, the letter is in the word and in the correct position.\n")
fprintf("If the tile turns yellow, the letter is in the word but not in the correct position.\n")
fprintf("If the tile turns black, the letter is not in the word.\n")
fprintf("You have 6 guesses to guess the randomly chosen word.\n \n")
fprintf("Good Luck! \n \n")

%Create a function which can be used to genereate a word
function [chosenWord] = generateWord()

%Generate random index for a word to read from the excel sheet rather
%than importing full library
wordIndex = randi([1,469]);

%Use the random integer to create an index in the excel spreadsheet format
%since words are stored in col B
excelIndex = string("B" + wordIndex);

%Import the randomly selected word word from sheet 1 of the WordleLibrary spreadsheet
[~,excelWord] = xlsread("WordleLibrary.xlsx","Sheet1",excelIndex);
chosenWord = string(excelWord);
end

%Define index which keeps track of the player's number of guesses alongside
%the correct vector that the results will need to be equal to for the
%player to have won.
index = 0;
correctVector = [2,2,2,2,2];

%Generate a random word and preallocate the 14855 acceptable words list.
chosenWord = generateWord;
listOfWords= wordList();

%Use a while loop which continues to prompt the player for a word while
%player is under 6 guesses and ends when the player exceeds 6 guesses or
%they have guessed the word
while index<6

%Updates the index
index = index+1;

%Use the defined guesser function to prompt the user for a guess
[guessWord] = guesser(index,listOfWords);

%Compare the guess word to the chosen word, holding the results in
%letterValues vector
letterValues = comparer(guessWord,chosenWord);

%Print output based on the data held in the letter values vector
printer(letterValues,guessWord,index);

%Use an if condition to stop and break the while loop if the player has
%guessed the chosen word and the letter values vector matches the correct
%vector.
if letterValues == correctVector

    break
end

end

%Define win sounds and loss sounds
loseSound=audioread("You Lose.mp3");
winSound=audioread("You Win.mp3");

%Use a if condition to determine if player has won or lost, and print a
%different final message depending on this.
if letterValues == correctVector

    fprintf("You Win! You guessed the correct word,%s on your %s attempt!\n",chosenWord,num2Ordinal(index))
    soundsc(winSound, 44100);
else

    fprintf("You lose! The word was %s. Better luck next time!\n",chosenWord)
    soundsc(loseSound, 44100);
end

%Prompt the user with a menu asking if they would like to replay the game
replayOption = menu("Would you like to play again?",'Yes','No');

%Provide the input from the above prompt into the replay function, and
%depedning on what the player chose, the function wordle may be invoked
%again.
replay(replayOption)

end





%This function is intended to display the guess results

function [] = printer(results,guessWord,index)

    %Converts the guess word into a string of lower case characters with the
    %custom casing function
    guessChar = casing(guessWord);
    
    %Define coordinates to construct a square
    x = [-1,1,1,-1,-1];
    y = [0,0,1,1,0];
    
    %Gets the current figure or creates one if no figure exists
    figure = gcf;
    %Defines the properties of the figure, and makes it docked to ensure it
    %doesnt minimise
    set(figure,"Name","Wordle","WindowStyle","docked")
    
    %Use a for loop to iterate over each character in the guess word based on the results from the comparer function stored in the results.  
    %vector. Creates a square with the subplot and fills it with black, yellow
    %or green based on the results stored in the results vector. Also sets the
    %y axis and x to be empty, and sets the title of the square as the guess
    %letter.
    for i =1:5
        
        switch results(i)
            case 0 
                
                subplot(6,5,i+5*(index-1))
                fill (x,y,"-k")
                set(gca,"XTickLabel",[],"YTickLabel",[])
                title(guessChar(i))
    
            case 1
               
                subplot(6,5,i+5*(index-1))
                fill (x,y,"-y")
                set(gca,"XTickLabel",[],"YTickLabel",[])
                title(guessChar(i))
    
            case 2
               
                subplot(6,5,i+5*(index-1))
                fill (x,y,"-g")
                set(gca,"XTickLabel",[],"YTickLabel",[])
                title(guessChar(i))
    
        end
    
    end
end


%This function is intended to compare the guess word to the randomly
%selected word and ouput a string of clues depending on the guess word. if
%the letter is in the word and in the correct position, resulting vector
%will have a 2 at that index. If the letter is in the word but not in the
%correct position, resulting vector will have a 1 at that index. If the
%letter is not in the word, resulting vector will have a 0 at that index.

function [result] = comparer(guessWord,chosenWord)

    %Convert guess word and character word into thier lowercase character
    %arrays using the pre-defined casing function.
    guessChar = casing(guessWord);
    chosenChar = casing(chosenWord);

    %Define a 1x5 result vector containing zeroes that will update based on
    %comparison
    result = zeros(1,5);
    
    %use a for loop to iterate over each guess character entry and check to
    %see if it is the same as the chosen words letter at that position. If
    %it is, update the entry of the result vector at that index to 2 to
    %indicate green. Also if updated, set the chosen char to * to indicate
    %that letter has been used and nullify it.
    for i = 1:5
        if guessChar(i) == chosenChar(i)
           result(i) = 2;
           chosenChar(i) = '*';
        else
        end
    end
    
    %Use a for loop to iterate over each guess character entry, and use
    %another nested for loop to iterate over each entry of the chosen
    %character array and compare it to the guess character entry. If the
    %guess character is the same as the chosen character, update the entry
    %of the result vector at that index to 1 to indicate yellow. Similar to
    %above, also update the char array at that index to * to indicate that
    %letter has been used and nullify it. Also break loop to prevent
    %doubling.
    for i = 1:5
        if result(i) == 0
            for j = 1:5
                if guessChar(i) == chosenChar(j) && chosenChar(j) ~= '*'
                    result(i) = 1;
                    chosenChar(j) = '*';
                    break
                end
            end
        end
    end
end

%This program is a function which takes strings as inputs and returns thier
%lowercase character arrays

function [result] = casing(word)
    %Define an empty vector which will contain the resulting character
    %arary
    result = [];

    %Convert the guessword string into character array
    wordChar = char(word);
    
    %Use a for loop to iterate over each character entry and convert them
    %into thier ascii code. Depending on this asciicode, determine if they
    %are in upper case or lower case, and depending on that convert it by 
    % adding 32 to their ascii code if they are uppercase.
    %Store this result as the next entry in the result vector and return
    %the result vector at the end.
    for i = 1:length(wordChar)

        Oct = double(wordChar(i));

        if (Oct >=65 && Oct <= 90)

            letter = char(Oct+32);
            result = [result, letter];

        else

            result = [result, wordChar(i)];

        end

    end
end

%This program is intended to verify and check that the provided word contains no spaces or special symbols, only
%letters

%Define function which returns a binary result and takes the guess word,
%and the acceptable 14855 list of words as an input, and returns a result
%flag and an errorCodes vector as an output.
function [result,errorCodes] = checker(word,listOfWords)

    %Define the result flag to be false at begining of the function and
    %update it to true if conditions are not met
    result = false;

    %Define the error codes vector to be a 1x3 array containing zeroes
    %which will be set to 1 based on if the error condition is triggered
    errorCodes = zeros(1,3);

    %Convert the word to a character array
    wordChar = char(word);

    %Use an if condition to check that the length of the input word is 5
    %letters long. 
    if length(wordChar) ~= 5
        
        %if condition not met, set result flag to true and return the
        %function as no further checks neccessary
        result = true;
        errorCodes(1) = 1;

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
            errorCodes(2) = 1;
            return
        end
        
    end

    %Check to see if error code 1 was triggered, and if so return the
    %function as the input is not a word, and thus the dictionary check is
    %unneccessary.
    if errorCodes(1) == 1 
        return
    end

       %Convert the guess word to a character array consisting of lowercase
       %letters as to have reached this point in the function, it must have
       %passed all the above conditions. Thus, it must be a string of
       %acceptable letters and can be used with the previously defined
       %casing funciton.
       guessChar = casing(word);

       %Use an if condition and the ismember function to check if the guess
       %words character array is in the list of words character array, and
       %thus is an acceptable 5 letter word. If the result of the ismember
       %function is 0, then the guess word is not in the accepted list of
       %words, and if its 1 it is. 
       if ismember(guessChar,listOfWords) == 0
          
           %If guess word not in word list, set result to true and return
           %the function
           result = true;
           errorCodes(3) = 1;
           return

       else
       end
end


%This function is supposed to prompt the user to input a guess word which
%will be later compared with the chosen word

function [guessWord] = guesser(i,listOfWords)

    %Define the text which will be used to to prompt the user. Use the
    %num2ordinal function to determine the string to be used depending on
    %which guess this is.
    text = "Enter the "+num2Ordinal(i)+" guess: ";
    
    %prompt the user using the above text and store the input as a string
    guessWord = input(text,"s");
    
    %Use the checker function to check the word and detect any flags such 
    %as the use of spaces, special characters or the guess word not being 
    %in the 14855 word dictionary being used for the game. 
    % If the requirements are fulfilled function
    % ends and returns the guessword as an output. 
    
    %Define return values of the checker function, with result being a
    %binary output which is set to true if a condition was not fulfilled
    %and the error code represents the first condition which the result
    %flag was triggered by.
    [result, errorCodes] = checker(guessWord,listOfWords);
    
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
        fprintf("(Word must be 5 letters long, contain no spaces or symbols and be in the word dictionary.) \n")

        %Prompt the user for another word and the while fucntion repeats so
        %on.
        guessWord = input(text,"s");

        %Redefine result and code for next iteration of loop
        [result,errorCodes] = checker(guessWord,listOfWords);
    end
end

%This program is intended to use switch cases to develop a function which
%outputs the ordinal version of the word index as a string for the first 6
%numbers (6 guess max)

%Define function with input index
function [ordinal] = num2Ordinal(index)

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

%Driver for printer function

function [] =printerDriver()
    %Clear all data in memory, command window and close all open figures for a fair test
    clear all
    close all
    clc

    %Define the inputs
    inp1 = [1,2,0,0,0;2,2,2,2,2;1,0,2,1,0];
    inp2 = ["Sames","bLAMe","pleed"];
    inp3 = [1,2,3];
    
    %Use a for loop to iterate over each test case and print the output
    for i = 1:3
        printer(inp1(i,:),inp2(i),inp3(i))
        pause(1)
    end
    
    %Print the expected output for comparison
    fig2 = figure(2);
    set(fig2,"Name","Wordle Expected","WindowStyle","docked")
       
        y = [0,0,1,1,0];
        x = [-1,1,1,-1,-1];

        subplot(6,5,1)
        fill (x,y,"-y")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("s")

        subplot(6,5,2)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("a")

        subplot(6,5,3)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("m")

        subplot(6,5,4)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("e")

        subplot(6,5,5)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("s")

        subplot(6,5,6)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("b")

        subplot(6,5,7)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("l")

        subplot(6,5,8)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("a")

        subplot(6,5,9)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("m")

        subplot(6,5,10)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("e")

        subplot(6,5,11)
        fill (x,y,"-y")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("p")

        subplot(6,5,12)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("l")

        subplot(6,5,13)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("e")

        subplot(6,5,14)
        fill (x,y,"-y")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("e")

        subplot(6,5,15)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("d")

end

%Driver for comparer

%Define test words
function [] =comparerdriver()
    %Clear all data in memory and command window for a fair test
    clear all
    clc

    %Define inputs alongside expected outputs
    inp1 = ["HELoo","about","pLeed"];
    inp2 = ["Sames","bLAMe","pleed"];
    expected = [0,1,0,0,0;1,1,0,0,0;2,2,2,2,2];
    
    %Use a for loop to iterate over each input set and define a vector
    %containing the corresponding output
    for i = 1:3

        result(i,:) = comparer(inp1(i),inp2(i));
        
    end

    %Print header for test results
    fprintf("Guesses   Chosen    Expected Results           Results \n")

    %Use a for loop to iterate over each test case, and print the input
    %followed by the expected output, and lastly the actual output
    for i = 1:3

        fprintf("%-10s",inp1(i))
        fprintf("%-10s",inp2(i))

        for j = 1:size(expected,2)
            fprintf("%-3d ",expected(i,j))
        end

        fprintf("%-5s"," ")

        for j = 1:size(result,2)
            fprintf("%-3d",result(i,j))
        end

        fprintf("\n")

    end
end

%Driver for num2ordinal
function [] = num2OrdinalDriver()
    %Clear all data in memory and command window for a fair test
    clear all
    clc

    %Define inputs and expected outputs
    inp1 = [1,2,3];
    out1 = ["first","second","third"];

    %Use a for loop to iterate over each test case and define a results
    %vector containing the corresponding outputs
    for i = 1:3

        result(i) = string(num2Ordinal(inp1(i)));
        
    end
    
    %Print headers for the test results
    fprintf("Input Expected  Output \n");

    %Use a for loop to print the input followed by the expected output and
    %lastly the actual output for all 3 test cases
    for i = 1:3

        fprintf("%-7d",inp1(i))
        fprintf("%-9s",out1(i))
        fprintf("%-10s\n",result(i))

    end
end

%Driver function for checker function

function [] = checkerDriver()
    %Clear all data in memory  and command line for a fair test
    clear all
    clc
    
    %Define inputs and expected outputs, alongside the acceptable word list
    inp1 = ["HELLO","ha h#"," @fP2#"];
    out1 = [false, true, true];
    out2 = [0,0,0;0,1,0;1,1,0];
    listOfWords = wordList();

    %Use a for loop to iterate over each input and define a vector
    %containing the outputs of checker function for that input
    for i = 1:3

        [result(i),errorCodes(i,:)] = checker(inp1(i),listOfWords);
        
    end
    
    %Print headers for test results
    fprintf("Input     Expected             Output \n")
    
    %Use a for loop to print the input, followed by expected output and
    %actual output for each test case
    for i = 1:3

        fprintf("%-10s",inp1(i))
        fprintf("%-4d",out1(i))
        fprintf("[")

        %Use a nested loop to print all column entries of a row in the
        %expected output and errorcodes arrays
        for j = 1:3
            fprintf("%-2d",out2(i,j))
        end
        
        %Formatting and result output
        fprintf("]%-7s","")
        fprintf("%-4d",result(i))
        fprintf("[")

        for j = 1:3
            fprintf("%-2d",errorCodes(i,j))
        end
        fprintf("]%-10s\n","")

    end
end

%Function for determining if the user wishes to replay the game
function [] = replay(replayOption)

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

function [list] = wordList()
        
        %Defines a variable list whiuch contains 14855 words from the
        %commonly recognised words
        list = readlines("words.txt");

        %Converts the words within the list to lowercase character arrays
        %by a loop which iterates over each word entry
        for i = 1:14855
            list(i)=casing(list(i));
        end
end

%Driver function for word list function which checks first 5 and last 5
%words for the word list

%Define function
function [] = wordListDriver()
   %clear workspace and command window for a fair tes
   clear all
   clc


    %No need for inputs, however expected outputs are defined as follows
    out1 = ["rossa","jetty","wizzo","cuppa","cohoe"];
    out2 = ["dunny","decal","fungy","cadgy","jalap"];
    
    %invoke word list function which forms a list of 14855 words as strings
    list = wordList();
    
    %Define headers
    fprintf("Expected           Output \n")
    
    %Use a for loop to print the first 5 entries of the word list function
    %alongside the expected output
    for i = 1:5
        fprintf("%-20s%-10s\n",out1(i),list(i))
    end
    
    %Use a for loop to print the last 5 entries of the word list function
    %alongside the expected output
    for i = 14856:-1:14852
        fprintf("%-20s%-10s\n",out2(i-14851),list(i-1))
    end
end