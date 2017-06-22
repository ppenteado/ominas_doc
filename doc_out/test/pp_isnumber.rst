\sectione{pp\_isnumber.pro}

























\subsection*{\allcaps{pp\_isnumber}}

\marginnote{}


\noindent    Tests a string to determine if it can be converted to a floating point number.
    All tests are case-insensitive. String must be trimmed on both sides:
    if it contains leading or trailing blanks, it is not considered a number.
 
 
 
\vspace{1.1em}


\begin{syntaxheader}
\lstinline+result = pp_isnumber(istr [, nan=nan] [, infinity=infinity] [, trim=trim] [, integer=integer] [, blank=blank] [, all=all])+
\end{syntaxheader}


\begin{description}
\item[Returns]\hspace*{0em} \newline    True if str is a floating point number, or (optionally), NaN or Infinity.
 
    False otherwise, including if str is undefined or is blank (unless the
    keyword blank is set).
 
 
 
\end{description}



\begin{description}
\item[Parameters]\hspace*{0em} \newline
\begin{description}

\item[istr]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{required} } \newline       String or string array to test.
 
 
 

\end{description}
\end{description}



\begin{description}
\item[Keywords]\hspace*{0em} \newline
\begin{description}

\item[nan]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{optional} \smallcaps{default=}1} \newline       If set, NaN is allowed as a number.
 
 

\item[infinity]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{optional} \smallcaps{default=}1} \newline       If set, Infinity is allowed as a number
       (any of inf,infi,infin,infini,infinit,infinity).
 
 

\item[trim]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{optional} \smallcaps{default=}1} \newline       If set, blanks on the string (on both sides) are ignored (a call is made
       to strtrim).
 
 

\item[integer]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{optional} \smallcaps{default=}0} \newline       If set, will test for integer numbers, instead of real numbers.
 
 

\item[blank]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{optional} \smallcaps{default=}0} \newline       If set, blanks are allowed as numbers
 
 

\item[all]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{optional} \smallcaps{default=}0} \newline       If set and the input is an array, pp_isnumber will return a single 0 or 1,
       indicating whether every element in the array passed the test.
 
 
 

\end{description}
\end{description}



\begin{description}
\item[Examples]\hspace*{0em} \newline  Test some simple cases:
  print,pp_isnumber(['a','12','-1','1.8','.9','-.8e-3','NaN','infinity','a12'])
  ;   0   1   1   1   1   1   1   1   0
  ;print,pp_isnumber(['a','12','-1','1.8','.9','-.8e-3','NaN','infinity','a12'],nan=0,infinity=0)
  ;   0   1   1   1   1   1   0   0   0
  print,pp_isnumber(['a','12','-1','1.8','.9','-.8e-3','NaN','infinity','a12'],/integer)
  ;   0   1   1   0   0   0   0   0   0
 
 
 
\end{description}



\begin{description}

\item[Author]\hspace*{0em} \newlinePaulo Penteado (pp.penteado@gmail.com), Aug/2009









\end{description}



\begin{description}







\item[Uses]\hspace*{0em} \newline 
 









\end{description}




\vspace{0.5em}








