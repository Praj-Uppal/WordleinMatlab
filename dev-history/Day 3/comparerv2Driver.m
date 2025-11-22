%Driver for comparer

%Define test words
function [] =comparerv2Driver()
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
        result(i,:) = comparerv2(inp1(i),inp2(i));
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
