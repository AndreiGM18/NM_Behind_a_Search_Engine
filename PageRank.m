function [R1, R2] = PageRank(name, d, eps)
	% Calculates what is required and writes the results in the output file.

  % Gets the data from the file
  [N A M val1 val2] = Read_data(name);

  % Creates the outputs file's name
  nameout = strcat(name, ".out");

  % Opens / Creates the file
  [fid, err] = fopen(nameout, 'w');

  % Checking if fopen was successful
  if fid == -1
    disp(err);
    return;
  endif

  % Prints the number of nodes
  fprintf(fid, "%d\n", N);

  % Gets and prints R from the iterative algorithm
  R1 = Iterative(name, d, eps);
  fprintf(fid, "%1.6f\n", R1);
  fprintf(fid, "\n");

  % Gets and prints R from the algebraic algorithm
  R2 = Algebraic(name, d);
  fprintf(fid, "%1.6f\n", R2);
  fprintf(fid, "\n");

  % Sorts R2 and stores its previous indexes, but sorted
  [R2_sorted, prev_index] = sort(R2, 'descend');

  % Calculates the importance factors and prints them 
  for i = 1 : N
    y = Importance(R2_sorted(i), val1, val2);
    fprintf(fid, "%d %d %1.6f\n", i, prev_index(i), y);
  endfor

  % Closes the file
  fclose(fid);
endfunction