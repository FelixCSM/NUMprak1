
## Author: Felix Voelker s9442559
## Created: sometime


# this function implements the SOR-Algorithm
#
function [X, n_iter, t] = SOR (X, omega, tol, n_max, A, b)
  tic()
  [L, R, D] = getLRD(A);
  our_inverse = the_inverse(D, omega, L);
  our_summand = second_summand(omega, b, our_inverse);
  fac = the_factor(omega, D, R, our_inverse);
  n_iter = 0;
  prep_time = toc();
  tic()
  x = X;
  tol = tol * norm(b);
  while(norm(A*x -b) > tol && n_iter < n_max)
    n_iter = n_iter +1;
    x = fac * x + our_summand;
  endwhile
  calc_time = toc();
  t = calc_time + prep_time;
  X = x;
endfunction


function [L, R, D] = getLRD(A)
  L = tril(A,-1);
  R = triu(A,1);
  D = A - L - R;
endfunction

function [our_inverse] = the_inverse(D, omega, L)
  our_inverse = inverse(D + omega * L);
endfunction

function [our_summand] = second_summand(omega, b, our_inverse)
  our_summand =  our_inverse*(omega*b);
endfunction

function [fac] = the_factor(omega, D, R, our_inverse)
  fac = - (our_inverse)*((omega-1)*D + omega * R);
endfunction
