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
listOfWords= wordListv1();

%Use a while loop which continues to prompt the player for a word while
%player is under 6 guesses and ends when the player exceeds 6 guesses or
%they have guessed the word
while index<6

%Updates the index
index = index+1;

%Use the defined guesser function to prompt the user for a guess
[guessWord] = guesserv4(index,listOfWords);

%Compare the guess word to the chosen word, holding the results in
%letterValues vector
letterValues = comparerv2(guessWord,chosenWord);

%Print output based on the data held in the letter values vector
printerv2(letterValues,guessWord,index);

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
replayv1(replayOption)

end

