
## Author: Felix Voelker s9442559
## Created: sometime


# this function implements the SOR-Algorithm
# 
function [X] = SOR (X, omega, tol, n_max, A, b)
  tic()
  L = tril(A,-1);
  R = triu(A,1);
  D = A - L - R;
  
  
  # this is just displaying the upper, lower and diagonal matrix for testing
  # the tril and triu function
  disp( A )
  disp( L )
  disp( R )
  disp( D )
endfunction
