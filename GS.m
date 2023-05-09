function [Q R] = GS(A)
  % Credits:
  % -> Bogdan-Costel Mocanu
  % -> Lab_3_MN_2017.pdf
  % -> https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process

  % Gets the number of rows and columns  
  [m , n] = size(A);

  % Initializes Q
  Q = [];

  % Gets Q
  for i = 1 : n
    q = A(1 : m, i);

    for j = 1 : i - 1
      S = sum(q .* Q(:, j));
      q = q - S * Q(1 : m, j);
    endfor

    q = q / norm(q);
    Q = [Q q];
  endfor

  % Gets R
  R = Q' * A;
 
endfunction