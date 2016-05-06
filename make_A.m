## Author: Felix Voelker s9442559
## Created: sometime

#function [A, b] = make_A (N)
#   if(N<3)
#        disp("this is not the N you're looking for")
#    else
#        A=zeros(N**2,N**2);
#        for i = 1:N**2
#            for j = 1:N**2
#                if(i==j)
#                    A(i,j)=4;
#                elseif(i==j+1 && rem (i-1,N) != 0 ||
#                       i == j-1 && rem (i,N) != 0 ||
#                       i==j-N || i==j+N)
#                    A(i,j)=-1;
#                endif
#            endfor
#        endfor
#    endif
#    b=get_b(N);
#endfunction


function [ A, b ] = make_A( N )
  A = zeros(N**2,N**2);
  ## zeile 1 - N (die erste Zeile mit T, -I)
  A(1,1) = 4;
  A(1,2) = -1;
  A(1,N+1)= -1;
  for i = 2:N-1
    A(i,i-1) = -1;
    A(i,i+1) = -1;
    A(i,i+N) = -1;
    A(i,i)= 4;
  endfor
  A(N,N) = 4;
  A(N,N-1) = -1;
  A(N,N+N)= -1;
  ## these were the first N lines
  ## or the first line of T and -I

  ##Now the rest exept the last line of T
  for t = 1:N-2
    T = N*t;
    A(T+1,T+1) = 4;
    A(T+1,T+1+1) = -1;
    A(T+1,T+1+N)= -1;
    A(T+1,T+1-N)= -1;
    for i = 2:N-1
      A(T+i,T+i-1) = -1;
      A(T+i,T+i+1) = -1;
      A(T+i,T+i+N) = -1;
      A(T+i,T+i-N) = -1;
      A(T+i,T+i)= 4;
    endfor
    A(T+N,T+N) = 4;
    A(T+N,T+N-1) = -1;
    A(T+N,T+N+N) = -1;
    A(T+N,T)=-1;
  endfor
  ## the were all lies of T and -I except the last

  ## now the last line of T and -I
  I = N**2-N;
  A(I+1,I+1) = 4;
  A(I+1,I+1-N) = -1;
  A(I+1,I+2) = -1;
  for i=I+2:N**2-1
    A(i,i) = 4;
    A(i,i-N) = -1;
    A(i,i-1) = -1;
    A(i,i+1) = -1;
  endfor
  sq = N**2;
  A(sq,sq) = 4;
  A(sq, sq -1) = -1;
  A(sq, sq -N) = -1;
  ## this is the matrix A now
  b = get_b(N);
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
