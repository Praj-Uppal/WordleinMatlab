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