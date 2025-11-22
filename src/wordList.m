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