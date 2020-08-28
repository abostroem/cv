\LoadClassWithOptions{article}  % build on standard article class

\setcounter{secnumdepth}{0}
 
% one address
\def\address#1{{\centering #1\par}}
 
% two addresses (say, home and work).  They get printed side by side
\def\addresses#1#2{\hbox to \hsize{\@tableboxa{#1}\hfil\@tableboxb{#2}}}
 
\def\@tableboxa#1{\begin{tabular}[t]{l}#1\end{tabular}}
\def\@tableboxb#1{\begin{tabular}[t]{r}#1\end{tabular}}
\def\@tablebox#1{\begin{tabular}[t]{lr}#1\end{tabular}}
  
\newbox\@title
 
% Most of the resume goes inside a llist environment.  Within it, use
% the \sectiontitle{title} command to begin new sections.  The title
% of the section is put in the left margin.  The section text begins
% on the next line if the sectiontitle is too long.
 
\newenvironment{llist}{\begin{list}{}{\setlength
 \labelwidth{1.05in}\setlength\leftmargin{\labelwidth}\addtolength
 \leftmargin{\labelsep}\itemsep 5pt plus 2pt minus 2pt
 \parsep 10pt plus 2pt minus 2pt
 %% Set the depth of the title to 0 in case more than one line.
 %% If the title takes more lines than the body, you lose.
 \def\sectiontitle##1{\setbox\@title=\hbox{{\bf\@tablebox{##1}}}\dp\@title=0pt
   \item[\copy\@title]\ifdim\wd\@title>\labelwidth
   \leavevmode \\* \else \fi}
 \def\makelabel##1{##1\hfill}}}{\end{list}}
 
% like itemize but bullets are at the left margin
\newenvironment{items}{\begin{list}{$\bullet$}
  {\setlength\labelwidth{.5em}\setlength\leftmargin{1em}
  \def\makelabel##1{##1\hfill}}}{\end{list}}
 
% Use the \employer and \location commands to print the names and
% cities of your employers.  \employer always starts a new paragraph,
% and should be followed by \location.
%
% \employer* is like \employer but is used for additional information
% about the employer.  It does NOT start a new paragraph, must
% NOT be followed by \location, and always forces a new line after itself.
\def\employer{\@ifstar{\@semployer}{\@employer}}
\def\@employer#1{\par{\sc #1}}
\def\@semployer#1{{\sc #1}}
 
% The location is always flush right.  It is moved to the next
% line if there is not room left on this one.  
% See the TeXbook Chapter 14.
\def\location#1{{\unskip\nobreak\hfill\penalty50\hskip2em
  \hbox{}\nobreak\hfill \hbox{#1}\finalhyphendemerits=0 \\}}

\def\locationtwo#1{{\unskip\nobreak\hfill\penalty50\hskip2em
  \hbox{}\nobreak\hfill \hbox{#1}\finalhyphendemerits=0 }}
 
% This prints the date flush left.
% The major shortcoming of this file:
% There needs to be an option to print the date in the left margin,
% because many people like to do it that way.
\def\dates#1{#1\\[2pt]}
