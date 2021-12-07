% Coursework template

% Irfanuddin Syed, H00389591      <--- confirm who you are 
% F28PL Coursework 3, Prolog    <--- confirm what you're submitting 

% Due: Wednesday 8th December 2021, 3:30pm
% Submit (this file) via GitLab as usual.

% You may assume variables, procedures, and functions defined in
% earlier questions in your answers to later questions, though you
% should add comments in code explaining this if any clarification
% might help read your code.

% For all questions, include testing in comments, so your marker can
% load this file as a database then cut-and-paste any testing into the
% command line.

% Testing on GitLab will NOT be provided for Prolog. Your own test
% will in this case be marked - note this is unlike the Python and
% OCaml coursework.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1   <--- Yes, so we know what question you think you're answering

% The complex numbers are explained here (and elsewhere):
%
%   http://www.mathsisfun.com/algebra/complex-number-multiply.html
%
% Represent a complex integer as a two-element list of integers, so
% [4,5] represents 4+5i.  Write Prolog predicates
%
%   cadd/3
%   cmult/3
%
% representing complex integer addition and multiplication. Thus for
% instance, cadd([X1,X2],[Y1,Y2],[Z1,Z2]) succeeds if and only if
% Z1=X1+Y1 and Z2=X2+Y2. Note that complex number multiplication is
% not just like complex number addition. Check the link and read the
% definition.
%
%   <--- always have the question under your nose

/* Add corresponding elements of the complex number, i.e., real + real and imaginary + imaginary */

cadd([X1,X2], [Y1, Y2], [Z1, Z2]) :- Z1 is X1 + Y1, Z2 is X2 + Y2.

/*Testing: 
run "cadd([a, b], [a1, b1], [a2, b2])" and it will return a2 and b2 as a sum of a,a1 and b,b1
Example: cadd([1, 2], [3, 4], [Z1, Z2])
        This will return Z1 = 4 , Z2 = 6; where Z1 is the sum of 1,3 and Z2 is the sum of 2,4
*/


/* in complex numbers, for 2 numbers a + bj and c + dj; the multiplication takes place as follows
% product = (ac - bd) + (ad + bc)j */

cmult([X1,X2], [Y1, Y2], [Z1, Z2]) :- Z1 is X1*Y1 - X2*Y2, Z2 is X1*Y2 + X2*Y1.
/*Testing: 
run "cmult([a, b], [a1, b1], [a2, b2])" and it will return the complex number a2 + b2j as a
product of complex numbers a +bj and a1 + b1j
Example: cmult([1, 2], [3, 4], [Z1, Z2])
        This will return Z1 = -5 , Z2 = 10;  where a2 + b2j as the product of complex numbers 
        1 +2j and 3 + 4sj
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2

% An integer sequence is a list of integers. Write a Prolog predicate
%
%   seqadd/3
%
% such that seqadd(Xs,Yy,Zs) succeeds when Xs and Ys are lists of
% integers of the same length and Zs is their sequence sum.

/* Using pattern matching, we add the first 2 elements of the lists X and Y and set it to the list Z
 then we recusively call the rest of the lists stored in X2 and Y2 and store it to Z2*/

seqadd([],[],[]).
seqadd([X1|X2], [Y1|Y2], [Z1|Z2]):- Z1 is X1 + Y1, seqadd(X2, Y2, Z2).

/*Testing:
run "seqadd([Xs], [Ys], [Zs])" and it will returns the Zs as the sum of the Xs and the Ys.

Example: seqadd([1, 2, 3, 4], [5, 6, 7, 8], [Z1, Z2, Z3, Z4]) 
        This will return: Z1 = 6, Z2= 8, Z3 = 10, Z4 = 12
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3

% Please consult the supplied Prolog database file stations.pl
% and answer the following questions. 

% 3a. Explain what backtracking has to do with Prolog. You might find
% this webpage helpful:
%
%   https://www.doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/search.html
%
% Explain your answer in terms of any differences you may observe between answer(s)
% to queries of the form ‘journey(...,leuchars)’ and ‘longjourney(...,leuchars)’
% where ‘...’ can be either a logic variable or one of the stations mentioned.  
%
% 3b. What is Cut in prolog and what does it have to do with
% backtracking? Explain your answer by giving examples of Cut used in
% at least one prolog rule, and explain how it affects the
% execution/resolution process.
% 
% Illustrate your answer in terms of the ‘stations’ database. 


/* 
3a. Backtracking :-

3b. Cut :-
*/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 4

% Write a database for a predicate cycleoflife/1 such that the query
%
%   cycleoflife(X)
%
% returns the instantiations
%
%   X = eat
%   X = sleep
%   X = code
%   X = eat
%   X = sleep
%   X = code
%   ...
%
% in an endless cycle.
%
% (This question has a beautiful and simple answer. If you find
% yourself writing lines and lines of complex code, there’s probably
% something amiss.)


/* Create the instances for the loop (eat, sleep, repeat) */

cycleoflife(eat).
cycleoflife(sleep).
cycleoflife(code).

/* Creating an infinite loop to cycle through all the instances of the loop repeatedly */

cycleoflife(X) :- cycleoflife(X).

/*Testing: 
run "cycleoflife(X)" and it will return X = eat. Press tab to continue through the cycle and enter to end the loop"
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
