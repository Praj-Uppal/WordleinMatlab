%This function is intended to display the guess results

function [] = printer(results,guessWord,index)

    %Converts the guess word into a string of lower case characters with the
    %custom casing function
    guessChar = casing(guessWord);
    
    %Define coordinates to construct a square
    x = [-1,1,1,-1,-1];
    y = [0,0,1,1,0];
    
    %Gets the current figure or creates one if no figure exists
    figure = gcf;
    %Defines the properties of the figure, and makes it docked to ensure it
    %doesnt minimise
    set(figure,"Name","Wordle","WindowStyle","docked")
    
    %Use a for loop to iterate over each character in the guess word based on the results from the comparer function stored in the results.  
    %vector. Creates a square with the subplot and fills it with black, yellow
    %or green based on the results stored in the results vector. Also sets the
    %y axis and x to be empty, and sets the title of the square as the guess
    %letter.
    for i =1:5
        
        switch results(i)
            case 0 
                
                subplot(6,5,i+5*(index-1))
                fill (x,y,"-k")
                set(gca,"XTickLabel",[],"YTickLabel",[])
                title(guessChar(i))
    
            case 1
                        
                subplot(6,5,i+5*(index-1))
                fill (x,y,"-y")
                set(gca,"XTickLabel",[],"YTickLabel",[])
                title(guessChar(i))
    
            case 2
               
                subplot(6,5,i+5*(index-1))
                fill (x,y,"-g")
                set(gca,"XTickLabel",[],"YTickLabel",[])
                title(guessChar(i))
    
        end
    
    end
end
