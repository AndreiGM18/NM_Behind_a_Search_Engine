**Name: Mitran Andrei-Gabriel**
**Group: 313CA**

## Behind a... Search engine - Homework 1

### Description:
-> The PageRank function is given the name of the file, the dampening factor
d, as well as the error eps (which helps determine when to stop iterating). 
-> From the input file, it determines the number of pages and all the links
between them, as well as the two values used for calculating the importance
factor.
-> It returns the PageRank vector calculated by the iterative method and the
algebraic method. It also writes them in a specific output file, alongside
the importance factors calculated for the sorted vector that resulted from
the algebraic method. 
-> For both algorithms, the adjacency matrix is first constructed, and then the
real number of neighbours (all links from a page that lead to itself are
ignored) is used to determine the M matrix used in the iterative formula.
-> The iterative method starts from an even distribution of 1 over the number
of nodes (1 / N) and applies the formula. When convergence is assumed (the norm
of the difference between the next PageRank vector and the current PageRank
vector is less than eps), the iterating stops.
-> The algebraic method solves the system of equations generated by the formula
(used in the iterative method) at the n-th iteration (when n -> Inf). The
method utilizes the Gram–Schmidt process to get a QR factorization, which makes
solving the system doable using SST (since R is an upper triangular matrix).
-> When sorting, the program keeps note of the original indexes, writing them
sorted as well. (If two pages have the exact same PageRank, the program does
not reverse their order.)
-> The importance factor is calculated using the given function. a and b are
determined using the fact that the function is continuous.

### Comments regarding the homework:
-> Since the code and comments are written in English, I found it appropriate
to write the README in English as well. If this was not something I should
have done, I do apologize.

### Resources / Credits:
-> Bogdan-Costel Mocanu
-> MN Lab Documents
-> (http://en.wikipedia.org/wiki/PageRank)
-> (http://en.wikipedia.org/wiki/Fuzzy_logic)
-> (http://www.cs.huji.ac.il/~csip/CSIP2007-intro.pdf)
