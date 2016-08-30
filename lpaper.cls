\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lpaper}
\newif\iflpaper@firstaffiliation\lpaper@firstaffiliationtrue
\newdimen\lpaper@tempdimen
\newcount\lpaper@tempcount
\def\lpaper@journalname{\relax}
\def\lpaper@shortjournalname{\relax}
\def\lpaper@title{[Put the title here using command {\tt\char`\\title\char"7B text~of~title\char"7D}.]}
\let\lpaper@shorttitle=\empty
\def\lpaper@author{[Put the names of authors here using command {\tt\char`\\author\char"7B names of authors\char"7D}.]}
\let\lpaper@shortauthor=\empty
% \def\lpaper@year{[Put the year here using command {\tt\char`\\year\char"7B YYYY\char"7D}.]}
\def\lpaper@issue{[Put the issue here using command {\tt\char`\\issue\char"7B NN\char"7D}.]}
\def\lpaper@institute{[Put the names of institutes here using command {\tt\char`\\institute\char"7B names of institutes\char"7D}.]}

\ProcessOptions
\LoadClass[%
  10pt,
  twoside,
  %pre,
  nofootinbib,
  secnumarabic,
  balancelastpage,
  superscriptaddress,
  showkeys]
    {revtex4-1}

  \pagestyle{myheadings}
  \def\contentsname{Contents}
  \def\listfigurename{List of Figures}
  \def\listtablename{List of Tables}
  \def\refname{References}
  \def\indexname{Index}
  \def\figurename{Figure}
  \def\tablename{Table}
  \def\partname{Part}
  \def\appendixname{Appendix}
  \def\abstractname{Abstract}

  \renewcommand*\email[1][E-mail: ]{\begingroup\sanitize@url\@email{#1}}%
  \chardef\*180
  \def\author#1{\expandafter\gdef\csname lpaper@author\endcsname{#1}}
  \def\shortauthor#1{\expandafter\gdef\csname lpaper@shortauthor\endcsname{#1}}
  \def\title#1{\expandafter\gdef\csname lpaper@title\endcsname{#1}}
  \def\shorttitle#1{\expandafter\gdef\csname lpaper@shorttitle\endcsname{#1}}
  % \def\year#1{\expandafter\gdef\csname lpaper@year\endcsname{#1}}
  \def\issue#1{\expandafter\gdef\csname lpaper@issue\endcsname{#1}}
  \def\institute#1{\expandafter\gdef\csname lpaper@institute\endcsname{#1}}
  \long\def\abstract#1{\expandafter\gdef\csname lpaper@abstract\endcsname{#1}}
  \def\keywords#1{\expandafter\gdef\csname lpaper@keywords\endcsname{#1}}
  \def\firstpage{\setcounter{page}}
  \def\lastpage#1{\expandafter\gdef\csname lpaper@lastpage\endcsname{#1}}
  \def\titleblock@produce{%
    \def\thefootnote{\@fnsymbol\c@footnote}%
    \begingroup
    \null
    \vskip-\baselineskip
    \vskip-12mm
      \vbox to0pt{\vskip-12mm
      }
      \vskip-\baselineskip
      \vbox to0pt{\vskip19mm \vskip\textheight
      }
    \vskip-\baselineskip
    \vskip4mm
    \leftline{\hskip-2mm\color{lpaper@color}\vrule width\paperwidth height.5pt}
    \vskip2pt
    \leftline{%
      \hskip-2mm\colorbox{lpaper@color}{%
        \hbox to\paperwidth{%
          \fontsize{11pt}{13.2pt}\selectfont\color{white}\hskip1mm\textbf{\lpaper@journalname}
          \vrule width0ptheight10ptdepth2pt\hss
        }%
      }%
    }
    \newdimen\@rulewidth
    \@rulewidth=\textwidth
    \advance\@rulewidth by4mm
    \vskip13.5mm
    \begin{flushleft}
      \sloppy\fontsize{19pt}{22.8pt}\selectfont\color{lpaper@color}\textbf{\lpaper@title}
    \end{flushleft}
    \vskip-\baselineskip
    \vskip10mm
   \vskip-\baselineskip
    \leftline{\hskip-2mm\color{lpaper@color}\vrule width\@rulewidth height.5pt}
    \vskip-1.5\baselineskip
    \vskip2mm
    \null
    \begin{flushleft}
      \def\inst##1{$^\text{##1}$}%
      \def\email##1{\footnote{E-mail: ##1}}%
      \fontsize{10pt}{12pt}\selectfont\textbf{\lpaper@author}
    \end{flushleft}
    \null
    \vskip-2.5\baselineskip
    \vskip2mm
    \null
    \begin{flushleft}
     $\null$%
     \def\inst##1{\parindent=10pt%
       \iflpaper@firstaffiliation%
         \vskip-\baselineskip
         \lpaper@firstaffiliationfalse
       \else
         \vskip2mm
       \fi%
       $\null$\llap{\hbox to\parindent{##1\hss}}\ignorespaces}%
       \fontsize{8pt}{9.5pt}\selectfont\color{grey}%
      \vskip-1\baselineskip\indent$\null$\lpaper@institute
    \end{flushleft}
    \vskip-1.5\baselineskip
    \vskip10mm
	    \vskip-\baselineskip
	    \vskip1.5mm
	    \leftline{\hskip-2mm\color{lpaper@color}\vrule width\@rulewidth height.5pt}
	    \vskip-.5pt
	    \fontsize{8pt}{10pt}\selectfont
	    \settowidth\lpaper@tempdimen{\textbf{MSC:}\kern.5em}%
	      \settowidth\lpaper@tempdimen{\textbf{Abstract:}\kern.5em}%
	      \settowidth\lpaper@tempdimen{\textbf{Keywords:}\kern.5em}%
	    \leftline{%
	      \hskip-2mm\colorbox{abs}{%
	        \hskip1mm\vbox{%
		          \vskip2.6mm\hangindent\lpaper@tempdimen
		           \fontsize{8pt}{10pt}\selectfont
		            $\null$\rlap{\textbf{Abstract:}}\kern\lpaper@tempdimen%
                    \selectfont\lpaper@abstract
		            \vskip1mm
		          \vskip1mm\hangindent\lpaper@tempdimen
		          \fontsize{8pt}{10pt}\selectfont
		            $\null$\rlap{\textbf{Keywords:}}\kern\lpaper@tempdimen%
		            \selectfont\lpaper@keywords
            \vskip2.6mm
	        }%
	      \hskip1mm}%
	    }%
    \vskip-2mm
    \leftline{\hskip-2mm\color{lpaper@color}\vrule width\@rulewidth height.5pt}
    \vskip10mm
    \endgroup
    \gdef\thefootnote{\@arabic\c@footnote}
    \global\c@footnote=0
  }%

  \def\@hangfrom@section#1#2#3{\@hangfrom{#1#2}{#3}}%
  \def\thesection{\arabic{section}}
  \def\section{\@startsection{section}{1}{\z@}{19\p@}{12\p@}
    {\noindent\fontsize{15pt}{17pt}	\bfseries \selectfont$\null$\color{lpaper@color}}}
  \def\subsection{\@startsection{subsection}{2}{\z@}{14\p@}{8\p@}
   {\noindent\fontsize{12\p@}{14\p@} \bfseries \selectfont$\null$\color{lpaper@color}}}
  \def\subsubsection{\@startsection {subsubsection}{3}{\z@}{8\p@}{4\p@}
    {\noindent\fontsize{10pt}{12pt}	\bfseries \selectfont$\null$\color{lpaper@color}}}
  \def\paragraph{\@startsection{paragraph}{4}{\z@}{12\p@}{2\p@}
    {\noindent\fontsize{9pt}{12pt}	\bfseries \itshape \selectfont$\null$\color{lpaper@color}}}
  \def\subparagraph{\@startsection{subparagraph}{5}{\z@}{6\p@}{\z@}%
    {\normalfont\normalsize\bfseries}}
  \c@tocdepth=1
  \c@secnumdepth=3

  \def\footnoterule{\kern-7.5mm {\color{lpaper@color}\hbox{\hskip-2mm\vrule width79.8mm height.5pt}}\kern2mm}
  \renewcommand\@makefntext[1]{\parindent0\p@\relax\indent%
    \rmfamily\it\fontsize{9}{10.8}\selectfont%
    \@makefnmark\enspace#1}
  \def\@fnsymbol#1{\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or
    \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
    \or \ddagger\ddagger \else\@ctrerr\fi}}
  \def\thefootnote{\@arabic\c@footnote}
  \footnotesep=2mm
  \gdef\@reinserts{%
    \ifvoid\footins\else\insert\footins{\unvbox\footins}\fi
    \ifvbox\@kludgeins\insert\@kludgeins
                        {\unvbox\@kludgeins}\fi
  }
  \def\thetable{\@arabic\c@table}
  \abovecaptionskip=5.5mm
  \belowcaptionskip2mm
  \long\def\@makecaption#1#2{%
    \par
    \vskip\abovecaptionskip
    \begingroup
    \small\rmfamily
    \sbox\@tempboxa{%
      \let\\\heading@cr
        \fontsize{9pt}{8.4pt} \bfseries \selectfont%
      \settowidth\lpaper@tempdimen{#1.\enspace}%
      \hangindent\lpaper@tempdimen{\color{lpaper@color}#1.\enspace}%
    \fontsize{7pt}{8.4pt} \selectfont%
      #2\par
    }%
    \@ifdim{\wd\@tempboxa >\hsize}{%
      \begingroup
      \samepage
      \flushing
      \let\footnote\@footnotemark@gobble
      \fontsize{9pt}{8.4pt}  \selectfont%
      \settowidth\lpaper@tempdimen{#1.\enspace}%
      \hangindent\lpaper@tempdimen{\color{lpaper@color}#1.\enspace}%
       \fontsize{7pt}{8.4pt}\selectfont%
      #2\par
      \endgroup
    }{%
      \global \@minipagefalse
      \hb@xt@\hsize{\mbox{}\hfil\unhbox\@tempboxa\hfil}%
    }%
    \endgroup
    \vskip\belowcaptionskip
  }%

  \renewenvironment{widetext@grid}{%
    \par\ignorespaces
    \setbox\widetext@top\vbox{%
    \vskip10\p@
    \hb@xt@\hsize{%
      \leaders\hrule\hfil
      \vrule\@height6\p@
    }%
    \vskip6\p@
    }%
    \setbox\widetext@bot\hb@xt@\hsize{%
      \vrule\@depth6\p@
      \leaders\hrule\hfil
    }%
    \onecolumngrid
    \dimen@\ht\widetext@top\advance\dimen@\dp\widetext@top
    \cleaders\box\widetext@top\vskip\dimen@
    \let\set@footnotewidth\set@footnotewidth@ii
  }{%
    \vskip6\p@
    \setbox\widetext@bot\vbox{%
    \hb@xt@\hsize{\hfil\box\widetext@bot}%
    \vskip10\p@
    }%
    \dimen@\ht\widetext@bot\advance\dimen@\dp\widetext@bot
    \cleaders\box\widetext@bot\vskip\dimen@
    \twocolumngrid\global\@ignoretrue
    \@endpetrue
  }%

  \def\bibfont{\normalsize}
	\def\bibsection{%
	  \def\section{\@startsection{section}{1}{\z@}{5.5mm}{5mm}
	    {\noindent\fontsize{11pt}{11pt}\selectfont$\null$\color{lpaper@color}\vskip6mm \hbox{\hskip-2mm\color{lpaper@color}\vrule width79.8mm height.5pt}\vskip-10mm }}
	  \let\@hangfroms@section\@hang@froms
	  \section*{\refname}%
    \vskip-\baselineskip
    \vskip4mm
    \null
	  \@nobreaktrue
	}

  \def\tiny{\fontsize{5pt}{6pt}\selectfont}
  \def\scriptsize{\fontsize{6pt}{7pt}\selectfont}
  \def\footnotesize{\fontsize{7pt}{8pt}\selectfont}
  \def\small{\fontsize{8pt}{10pt}\selectfont}
  \def\normalsize{\fontsize{9pt}{18pt}\selectfont}
  \def\large{\fontsize{10pt}{12pt}\selectfont}
  \def\Large{\fontsize{12pt}{14pt}\selectfont}
  \def\LARGE{\fontsize{15pt}{16pt}\selectfont}
  \def\huge{\fontsize{17pt}{20pt}\selectfont}
  \def\Huge{\fontsize{20pt}{24pt}\selectfont}
  \def\*{$\bullet$ \relax}

\RequirePackage{amsmath}
  \abovedisplayskip=16ptplus4ptminus8pt
  \abovedisplayshortskip=1ptplus4pt
  \belowdisplayskip=16ptplus4ptminus8pt
  \belowdisplayshortskip=8ptplus6ptminus5pt

\RequirePackage{amsthm}
  \newtheoremstyle{itstyle}
    {16pt plus6pt}
    {16pt plus6pt}
    {\rmfamily\it\fontsize{9}{11}\selectfont}
    {0pt}
    {\fontsize{10}{11} \bfseries \selectfont\color{lpaper@color}$\null$}
    {\newline\nobreak}
    {0pt}
    {\indent#1\hbox{ }#2\thmnote{\hbox{ }(#3)}. \ }
  \newtheoremstyle{rmstyle}
    {16pt plus6pt}
    {16pt plus6pt}
    {\rmfamily\fontsize{9}{11}\selectfont}
    {0pt}
    {\fontsize{10}{11}\bfseries \selectfont\color{lpaper@color}$\null$}
    {\newline\nobreak}
    {0pt}
    {\indent#1\hbox{ }#2\thmnote{\hbox{ }(#3)}. \ }
  \theoremstyle{itstyle}
  \newtheorem{theorem}{Theorem}[section]
  \newtheorem{lemma}{Lemma}[section]
  \newtheorem{proposition}{Proposition}[section]
  \newtheorem{claim}{Claim}[section]
  \newtheorem{fact}{Fact}[section]
  \newtheorem{corollary}{Corollary}[section]
  \newtheorem{assumption}{Assumption}[section] %???
  \newtheorem{algoritheorem}{Algoritheorem}[section] %???
  \theoremstyle{rmstyle}
  \newtheorem{remark}{Remark}[section]
  \newtheorem{example}{Example}[section]
  \newtheorem{question}{Question}[section]
  \newtheorem{problem}{Problem}[section]
  \newtheorem{definition}{Definition}[section]
  \newtheorem{axiom}{Axiom}[section] %???
  \def\proofname{{\fontsize{10}{11}\selectfont\color{lpaper@color}$\null$Proof. \ }}

\RequirePackage{graphicx}

\RequirePackage{color}
  \definecolor{grey}{rgb}{.3,.3,.3}
  \definecolor{lpaper@color}{rgb}{0.5,0.37109375,0.59765625}
  \definecolor{abs}{rgb}{0.97265625,0.96875,0.98046875}

\RequirePackage{hyperref}
\hypersetup{colorlinks=true,citecolor=blue,linkcolor=blue}
\usepackage{hypernat}

\paperwidth=210mm
\paperheight=277mm

\pdfpagewidth=\paperwidth
\pdfpageheight=\paperheight

\textwidth=159.95mm
\textheight=222.5mm

\newdimen\lpaper@textwidth
\lpaper@textwidth=\textwidth

\hoffset=-1in
\advance\hoffset by.5\paperwidth
\advance\hoffset by-.5\textwidth

\voffset=-1in
\advance\voffset by.5\paperheight
\advance\voffset by-.5\textheight
\advance\voffset by-15mm

\evensidemargin=0mm
\oddsidemargin=0mm

\topmargin=0pt

\headheight=40pt
\headsep=0pt

\marginparsep=0pt
\marginparwidth=0pt
\marginparpush=0pt

\parindent=0pt

\baselineskip=12pt

\footskip=30pt

\def\lpaper@linenumbers{}
\def\lpaper@titlehead{\vbox to40pt{\hsize=.5\lpaper@textwidth \advance\hsize by.5\columnsep
  \lpaper@linenumbers%
}}

\def\lpaper@oddhead{\vbox to40pt{%
  \hsize=\lpaper@textwidth
  \lpaper@linenumbers%
  \def\email##1{}\def\inst##1{}%
  \vbox to20pt{%
    \raggedright%
    \fontsize{7pt}{8.4pt}\selectfont\color{grey}%
    \ifx\lpaper@shortauthor\empty%
      \lpaper@author%
    \else%
      \lpaper@shortauthor%
    \fi%
    \vss%
  }%
  \hbox to\lpaper@textwidth{\hskip-2mm\color{lpaper@color}\vrule width\paperwidth height.5pt\hss}%
  \vskip1mm
  \hskip.5\lpaper@textwidth\hbox to.5\lpaper@textwidth{\hskip.5\columnsep\color{lpaper@color}\vrule width\paperwidth height2.962mm\hss}%
  \vss%
}}

\def\lpaper@evenhead{\vbox to40pt{\hsize=\lpaper@textwidth
  \lpaper@linenumbers%
  \def\email##1{}\def\inst##1{}%
  \vbox to20pt{%
    \raggedleft%
    \fontsize{7pt}{8.4pt}\selectfont\color{grey}%
    \ifx\lpaper@shorttitle\empty%
      \lpaper@title%
    \else%
      \lpaper@shorttitle%
    \fi%
    \vss%
  }%
  \hbox to\lpaper@textwidth{\hss\color{lpaper@color}\vrule width\paperwidth height.5pt\hskip-2mm}%
  \vskip1mm
  \hbox to.5\lpaper@textwidth{\hss\color{lpaper@color}\vrule width\paperwidth height2.962mm\hskip.5\columnsep}%
  \vss%
}}

\def\lpaper@oddfoot{%
    \hfill\rlap{\hskip.7cm{\colorbox{lpaper@color}{\hbox to1.7cm{%
    \hss\usefont{T1}{square721exeu}{m}{n}\fontsize{7pt}{8.4pt}\selectfont\color{white}\thepage\hss}}}}}

\def\lpaper@evenfoot{%
    \llap{{\colorbox{lpaper@color}{\hbox to1.7cm{%
    \hss\fontsize{7pt}{8.4pt}\selectfont\color{white}\thepage\hss}}%
    \hskip.7cm}}}

\def\ps@myheadings{
  \let\@oddhead=\lpaper@oddhead
  \let\@oddfoot=\lpaper@oddfoot
  \let\@evenhead=\lpaper@evenhead
  \let\@evenfoot=\lpaper@evenfoot
}

\def\ps@titlepage{
  \let\@oddhead=\lpaper@titlehead
  \let\@oddfoot=\lpaper@oddfoot
  \let\@evenhead=\lpaper@titlehead
  \let\@evenfoot=\lpaper@evenfoot
}

\ps@myheadings

\AtBeginDocument{%
  \renewcommand{\familydefault}{\rmdefault}
  \fontfamily{\familydefault}

  \thispagestyle{titlepage}
  \def\lpaper@lastpage{{\color{red}[Compile the document one more time to update number of the last page!]}}

  \newread\lpaper
  \openin\lpaper=\jobname.lpaper
  \ifeof\lpaper \else\input\jobname.lpaper \fi

  \newwrite\lpaper
  \immediate\openout\lpaper=\jobname.lpaper

  \rm\normalsize
}

\AtEndDocument{
  \immediate\write\lpaper{\string\lastpage{\thepage}}
  \immediate\closeout\lpaper
}

\newcommand{\ucm}% up comma
  {\ensuremath{{}^{,}}}

\endinput
