\sectione{pp\_azdif.pro}







\noindente  test1
 
 
 




\begin{descriptione}
  \item[Examples]\hspace*{1em} \newline     Taking 1ex:
  print,pp_azdif(300d0,40d0,70d0)
  ;-100.0000000
 
 
\end{description}
















\subsection*{\allcaps{pp\_azdif}}

\marginnote{}


\noindent     Given the angle between two directions (`dphase`) with angle from vertical
     given by `dinc`, `dema`, returns the azimuth difference between them. All inputs
     and the output are in degrees. This function is vectorized, so the 3 input arguments
     can be of any dimension (must be the same for all 3), and that will be the dimension of the
     result.
     This function is complementary to `pp_phase_angle`.
 
 
 
\vspace{1.1em}


\begin{syntaxheader}
\lstinline+result = pp_azdif(dphase, dinc, dema)+
\end{syntaxheader}




\begin{description}
\item[Parameters]\hspace*{0em} \newline
\begin{description}

\item[dphase]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{required} } \newline       The angle between the two directions (phase angle), in degrees.
 
 

\item[dinc]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{required} } \newline       The angle between one of the directions and the vertical (incidence angle), in degrees.
 
 

\item[dema]\hspace*{1em} {\footnotesize \smallcaps{in} \smallcaps{required} } \newline       The angle between the other direction and the vertical (emission angle), in degrees.
 
 
 

\end{description}
\end{description}





\begin{description}
\item[Examples]\hspace*{0em} \newline     Taking incidence and emission in the same plane:
  print,pp_azdif(30d0,40d0,70d0)
  ;0.0000000
  print,pp_azdif(110d0,40d0,70d0)
  ;180.00001
     Taking incidence and emission at the horizon:
  print,pp_azdif(110d0,90d0,90d0)
  ;110.00000
 
 
\end{description}



\begin{description}

\item[Author]\hspace*{0em} \newlinePaulo Penteado (pp.penteado@gmail.com), Sep/2009









\end{description}



\begin{description}







\item[Uses]\hspace*{0em} \newline 
 









\end{description}




\vspace{0.5em}








