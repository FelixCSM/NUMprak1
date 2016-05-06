######
## (a)
######
N = [10 50 100 200];

######
## (V1)
######

for i = N
  [A, b] = make_A(i);
  [L, R] = lu(A);
  spy(L)
  pause
  spy(R)
  pause
endfor

######
## (V2)
######

for i = N
  [A, b] = make_A_sparse(i);
  [L, R] = lu(A);
  spy(L)
  pause
  spy(R)
  pause
endfor
