function R = Iterative(name, d, eps)
  % Function that calculates the R matrix using the iterative algorithm.
	% Entries:
	%	-> name: the name of the file from which the data is read;
	%	-> d: the probability that the user continues navigation to the next page
  % (d = 0.85 in most cases);
	%	-> eps: error that is used to stop the iterations.
	% Returns:
	%	-> R: PageRank vector.
  % Credits for the computation:
  % https://en.wikipedia.org/wiki/PageRank

  % Gets the data from the file
  [N A M val1 val2] = Read_data(name);
  
  % Initializes R (R at the i-th iteration)
  R = zeros(N, 1);

  % Initializes next_R (R at the (i + 1)-th interation)
  next_R = ones(N, 1) * (1 / N);

  % Calculates next_R until convergence is assumed
  do
    R = next_R;
    next_R = (1 - d) / N + d * M * R;
  until (norm(next_R - R) <= eps)

endfunction