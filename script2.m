N = [ 10 , 50, 100, 200 ];
tol = 10**(-6);
n_max = 15000;

for n = N
  om_n = 2/(1+sin(pi/(n+1)));
  OMEGA = [1.0 1.8 om_n];
    [A,b] = make_A(n);
  for om = OMEGA
    [X,iters,t] = SOR(zeros(n**2,1),om ,tol,n_max,A,b);
    disp(X)
    disp(iters)
    disp(t)
  endfor
endfor