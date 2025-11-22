function [] = printerv1(results,index)

%Define coordinates to construct a square
x = [-1,1,1,-1,-1];
y = [0,0,1,1,0];

%Use a for loop to iterate over each character in the guess word based on the results from the comparer function stored in the results.  
%vector. Creates a square with the subplot and fills it with black, yellow
%or green based on the results stored in the results vector.
for i =1:5
    switch results(i)
        case 0 
            subplot(6,5,i+5*(index-1))
            fill (x,y,"-k")
            set(gca,"XTickLabel",[],"YTickLabel",[])
        case 1
            subplot(6,5,i+5*(index-1))
            fill (x,y,"-y")
            set(gca,"XTickLabel",[],"YTickLabel",[])
        case 2
            subplot(6,5,i+5*(index-1))
            fill (x,y,"-g")
            set(gca,"XTickLabel",[],"YTickLabel",[])
    end
end
end