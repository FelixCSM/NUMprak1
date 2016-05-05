
function [A,b] = make_A_sparse(N)
  [B,b]=make_A(N);
  A=sparse(B);
endfunction
