function [X, n_iter, t] = SOR_zeilenweise (X, omega, tol, n_max, A, b)
  tic()
  n_iter=0;
  tol = tol*norm(b);
   x = X;
   n = size(A,1);
  while(norm(A*x -b) > tol && n_iter < n_max)
  siggi = 0;
    for i = 1:n
      for j=1:n
        if (j~=i)
          siggi = siggi + A(i,j)*x(j);
        endif
      endfor
      x(i) = (1-omega)*x(i) + (omega/A(i,i))*(b(i) - siggi);
    endfor
    n_iter = n_iter +1;
  endwhile
  X = x;
  t = toc();
endfunction
