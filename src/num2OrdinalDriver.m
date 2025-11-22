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
