function [N A M val1 val2] = Read_data(name)
  % Function that gets the data from the file and calculates the M matrix

  % Opens the file
  [fid, err] = fopen(name, 'r');

  % Checking if fopen was successful
  if fid == -1
    disp(err);
  endif

  % Gets the number of pages
  N = fscanf(fid, "%d", 1);

  % Initializations
  A = zeros(N);
  M = zeros(N);
  L = zeros(N, 1);

  % Skips to the next line
  fgetl(fid);

  % For every page:
  for i = 1 : N
    % Gets the line and converts it to a vector of integers
    buff = fgetl(fid); 
    B = sscanf(buff, "%d");

    % The first two integers represent the current page and the number
    % of links that the page possesses (how many pages can be accessed
    % *from* the current page), saved in L(i).
    
    % The rest are the pages that a user can access from the current one.
    % Builds the adjacency matrix of the graph
    A(i, B(3 : length(B))) = 1;

    % If a A(i, i) = 1, that implies a link from a page to itself.
    % Such a link is ignored in these calculations. Therefore:
    L(i) = B(2) - A(i, i);
    A(i, i) = 0;
  endfor

  % Calculates M in one of the ways as described in the homework at 
  % address [1].
  for i = 1 : N
    for j = 1 : N
       if A(j, i)
          M(i, j) = 1 / L(j);
        endif
    endfor
  endfor

  % Gets val1 and val2
  val1 = fscanf(fid, "%f", 1);
  val2 = fscanf(fid, "%f", 1);

  % Closes the file
  fclose(fid);
endfunction