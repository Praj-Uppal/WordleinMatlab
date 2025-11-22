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