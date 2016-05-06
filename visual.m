

N = 10;
tol = 10**(-6);
omega = 1.8;
X = zeros(N**2,1);
n_max=15000;
[A,b] = make_A(N);
[X, iters, t] = SOR(X,omega,tol,n_max,A,b);
u = reshape(X, int16(sqrt(size(X))), int16(sqrt(size(X))));
surf(1:N,1:N,u)