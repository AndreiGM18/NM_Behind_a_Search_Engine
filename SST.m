function x = SST(U,b)
  % Credits:
  % -> Bogdan-Costel Mocanu
  % -> lab_mn_02.pdf

  % Gets the number of equations and initializes the result vector
  n = length(U);
  x = zeros(n, 1);

  % Solves for every x
  for i = n : -1 : 1
    x(i) = (b(i) - U(i, (i + 1) : n) * x((i + 1) : n)) / U(i, i);
  endfor
endfunction