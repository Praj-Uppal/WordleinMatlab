%Driver function for checker function

function [] = checkerv1Driver()
    %Clear all daa in memory  and command line for a fair test
    clear all
    clc
    
    %Define inputs and expected outputs, alongside the acceptable word list
    inp1 = ["HELLO","ha h#"," @fP2#"];
    out1 = [false, true, true];

    %Use a for loop to iterate over each input and define a vector
    %containing the outputs of checker function for that input
    for i = 1:3

        result(i) = checkerv1(inp1(i));
        
    end
    
    %Print headers for test results
    fprintf("Input Expected Output \n")
    
    %Use a for loop to print the input, followed by expected output and
    %actual output for each test case
    for i = 1:3

        fprintf("%-10s",inp1(i))
        fprintf("%-7d",out1(i))
        fprintf("%-5d\n",result(i))

    end
end