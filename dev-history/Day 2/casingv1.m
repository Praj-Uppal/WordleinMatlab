function [result] = casingv1(word)
    %Define an empty vector which will contain the resulting character
    %arary
    result = [];

    %Convert the guessword string into character array
    wordChar = char(word);
    
    %Use a for loop to iterate over each character entry and convert them
    %into thier ascii code. Depending on this asciicode, determine if they
    %are in upper case or lower case, and depending on that convert it.
    %Store this result as the next entry in the result vector and return
    %the result vector at the end.
    for i = 1:length(wordChar)
        Oct = double(wordChar(i));
        if (Oct >=100 && Oct <= 132)
        letter = char(Oct+40);
        result = [result, letter];
    else
        result = [result, wordChar(i)];
    end
end
end