%Driver function for casing

function [] = casingDriver()
    %Clears all previous data and command line for a fair test
    clear all
    clc
    
    %Define input and expected output vectors
    inp1 = ["HEllo","MOred","baker"];
    out = ['h','e','l','l','o';'m','o','r','e','d';'b','a','k','e','r'];
    
    %Use a for loop to iterate over each input and define a vector containing the outputs
        for i = 1:3
            result(i,:) = casing(inp1(i));
        end
    
        %Print headers for the test results
    fprintf("Input     Expected    Output \n")
    
    %Use a for loop to print the input followed by the expected output and
    %actual output for all 3 test cases
    
    for i = 1:3
        fprintf("%s     ",inp1(i));

        for j = 1:5
            fprintf("%c",out(i,j))
        end

        fprintf("       ")

        for j = 1:5
            fprintf("%c",result(i,j))
        end

        fprintf("\n")

    end
end

