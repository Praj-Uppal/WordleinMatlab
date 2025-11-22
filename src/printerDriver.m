%Driver for printer function

function [] =printerDriver()
    %Clear all data in memory, command window and close all open figures for a fair test
    clear all
    close all
    clc

    %Define the inputs
    inp1 = [1,2,0,0,0;2,2,2,2,2;1,0,2,1,0];
    inp2 = ["Sames","bLAMe","pleed"];
    inp3 = [1,2,3];
    
    %Use a for loop to iterate over each test case and print the output
    for i = 1:3
        printer(inp1(i,:),inp2(i),inp3(i))
        pause(1)
    end
    
    %Print the expected output for comparison
    fig2 = figure(2);
    set(fig2,"Name","Wordle Expected","WindowStyle","docked")
       
        y = [0,0,1,1,0];
        x = [-1,1,1,-1,-1];

        subplot(6,5,1)
        fill (x,y,"-y")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("s")

        subplot(6,5,2)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("a")

        subplot(6,5,3)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("m")

        subplot(6,5,4)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("e")

        subplot(6,5,5)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("s")

        subplot(6,5,6)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("b")

        subplot(6,5,7)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("l")

        subplot(6,5,8)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("a")

        subplot(6,5,9)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("m")

        subplot(6,5,10)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("e")

        subplot(6,5,11)
        fill (x,y,"-y")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("p")

        subplot(6,5,12)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("l")

        subplot(6,5,13)
        fill (x,y,"-g")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("e")

        subplot(6,5,14)
        fill (x,y,"-y")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("e")

        subplot(6,5,15)
        fill (x,y,"-k")
        set(gca,"XTickLabel",[],"YTickLabel",[])
        title("d")

end