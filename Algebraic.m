function PR = Algebraic(name, d)
	% Function that calculates the R matrix using the iterative algorithm.
	% Entries:
	%	-> name: the name of the file from which the data is read;
	%	-> d: the probability that the user continues navigation to the next page
  % (d = 0.85 in most cases);
	%	-> eps: error that is used to stop the iterations.
	% Returns:
	%	-> PR: PageRank vector.

  % Gets the data from the file
  [N A M val1 val2] = Read_data(name);

  % The iterative algorithm uses the following formula:
  % PR(t + 1) = (1 - d) / N * ones(N, 1) + d * M * PR(t)
  % The result is given when convergence is assumed,
  % i.e. when PR(t + 1) = PR(t) (t -> Inf)
  % PR = (1 - d) / N * ones(N, 1) + d * M * PR
  % (eye(N) - d * M) * PR = (1 - d) / N * ones(N, 1)
  % The matrix (eye(N) - d * M) must therefore be inversed.
  % In order to simplify this, we can use a QR decomposition.

  % Utilizes the Gram–Schmidt process to get the Q and R matrixes
  % -> Q: orthogonal matrix, therefore Q^(-1) = Q'
  % -> R: upper triangular matrix
  [Q, R] = GS(eye(N) - d * M);

  % Solves R * PR = Q^(-1) * ones(N, 1) * (1 - d) / N
  % Since R is an upper triangular matrix, it utilizes the SST algorithm.
  PR = SST(R, Q' * ones(N, 1) * (1 - d) / N);

endfunction