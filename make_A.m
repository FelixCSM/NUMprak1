## Author: Felix Voelker s9442559
## Created: sometime

function [A, b] = make_A (N)
   if(N<3)
        disp("this is not the N you're looking for")
    else
        A=zeros(N**2,N**2);
        for i = 1:N**2
            for j = 1:N**2
                if(i==j)
                    A(i,j)=4;
                elseif(i==j+1 && rem (i-1,N) != 0 ||
                       i == j-1 && rem (i,N) != 0 ||
                       i==j-N || i==j+N)
                    A(i,j)=-1;
                endif
            endfor
        endfor
    endif
endfunction
