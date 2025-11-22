%This program contains the code for the Wordle game
function [] = wordlev1()
%Clear stored data, command line, etc to prevent any memory issues
clear all
close all
clc


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
index = 1;
correctVector = [2,2,2,2,2];

%Generate a random word
chosenWord = generateWord();

%Use a while loop which continues to prompt the player for a word while
%player is under 6 guesses and ends when the player exceeds 6 guesses or
%they have guessed the word
while index<=6

%Use the defined guesser function to prompt the user for a guess
[guessWord] = guesserv1(index);

%Compare the guess word to the chosen word, holding the results in
%letterValues vector
letterValues = comparerv1(guessWord,chosenWord);

%Print output based on the data held in the letter values vector
printer(letterValues,guessWord,index);

%Use an if condition to stop and break the while loop if the player has
%guessed the chosen word and the letter values vector matches the correct
%vector.
if letterValues == correctVector
    break
end

%Updates the index
index = index+1;
end


end

