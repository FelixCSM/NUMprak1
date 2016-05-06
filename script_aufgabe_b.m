###### Konstantin Wehrwein und Felix Völker
###### Numerik Praktische Aufgabe 1 SS2016
######

#####
## Teilaufgabe (a)
######
script1
#######

######
## Teilaufgabe (b)
######


tol = 10**(-6);
n_max = 15000;


#V1/W2
Ns = [10 50];
for N = Ns
  omega = 2/(1+sin(pi/(N+1)));
  [A,b] = make_A(N);
  X = zeros(N**2,1);
  [result, iters, time] = SOR_zeilenweise(X,omega,tol,n_max,A,b);
  disp('sor zeilenweise, mit zeilerweisen matrix benötigtes Iterationen für N=')
  disp(N)
  disp(' und omega=')
  disp(omega)
  disp('ist')
  disp(iters)
  disp('benötigte Zeit ist')
  disp(time)
endfor

#V2/W1
for N = Ns
  omega = 2/(1+sin(pi/(N+1)));
  [A,b] = make_A_sparse(N);
  X = zeros(N**2,1);
  [result, iters, time] = SOR(X,omega,tol,n_max,A,b);
  disp('sor mit build-in-functions und sparse matrix benötigtes Iterationen für N=')
  disp(N)
  disp(' und omega=')
  disp(omega)
  disp('ist')
  disp(iters)
  disp('benötigte Zeit ist')
  disp(time)
endfor



#V2/W2
Nss = [10 50 100 200];

for N = Nss
  omega = 2/(1+sin(pi/(N+1)));
  X = zeros(N**2,1);
  [A, b] = make_A_sparse(N);
  oms = [1.0 1.8 omega];
  for om = oms
    [result, iters, time] = SOR_zeilenweise(X,om,tol,n_max,A,b);
    disp('zeilenweise SOR mit sparsematrix, benötigtes Iterationen für N=')
    disp(N)
    disp(' und omega=')
    disp(om)
    disp('ist')
    disp(iters)
    disp('benötigte Zeit ist')
    disp(time)
  endfor
endfor

