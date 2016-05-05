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
    b=get_b(N);
endfunction

function [A,b] = make_A_sparse(N)
  [B,b]=make_A(N);
  A=sparse(B);
endfunction


function [b] = get_b(N)
  h = get_h(N);
  F = zeros(N**2,1);
  XY = h*[1:N];
  for j=1:N
    for i=1:N
      F(i + (j-1)*N) = sin(pi*XY(i))*sin(pi*XY(j));
    endfor
  endfor
  b=F;
endfunction


# calculates h
# @param N
# @return h
function [h] = get_h (N)
  h = 1/(N+1);
endfunction
