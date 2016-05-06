N = [ 10];
tol = 10**(-6);
n_max = 15000;
om = 1.8;

[X,iters,t] = SOR(zeros(n**2,1),om ,tol,n_max,A,b);
disp(X)
disp(iters)
disp(t)
