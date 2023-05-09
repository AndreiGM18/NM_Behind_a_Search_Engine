function y = Importance(x, val1, val2)
	% Function returns f(x). It is given x, val1 and val2.
	% It is known that 0 <= x <= 1.  
  %        { 0, if 0 <= x < val1
  % f(x) = { a * x + b, if val1 <= x <= val2
  %        { 1, if val2 < x <= 1

  % f is continuous, therefore a and b can be calculated:
  % f(val1) = 0 => a * val1 + b = 0
  % f(val2) = 1 => a * val2 + b = 1
  % Finally:
  a = 1 / (val2 - val1);
  b = -val1 / (val2 - val1);

  % Calculates f(x)
  if (x < val1)
    y = 0;
    return;
  endif
  if (x > val2)
    y = 1;
    return;
  endif
  y = a * x + b;

endfunction