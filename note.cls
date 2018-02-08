% Class for typesetting lecture notes, the text is offset to the left to make
% room for many notes in the margin. Footer is updated to include course name.

% This should possibly be updated to place the margin on the correct page in
% multi page documents, currently the margin is always to the left.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{note}[2016/08/29 For typesetting lecture notes]

% This is for key value argument parsing
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=note, prefix=note@}

\DeclareStringOption[TAEN33]{course}
\newcommand{\rawcourse}{\note@course}
\newcommand{\course}{\expandafter\uppercase\expandafter{\note@course}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*

\LoadClass[a4paper]{article}

% Moves body to the left, to give room for more comments in the margin
\RequirePackage%
	[marginparwidth=5.5cm, inner=2cm, outer=7.5cm, bottom=3cm, top=3cm]
	{geometry}

% Move title up and allow for acces to author and date in document
\RequirePackage{titling}

% These are used foor the footer
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}

% This should possibly be in the document intsead of in the class
\RequirePackage{keyword}
\RequirePackage{graphicx}
\RequirePackage{marginnote}
\renewcommand{\keywordstyle}[1]{%
	\reversemarginpar%
	\marginnote{\rotatebox{90}{#1}}
	\normalmarginpar%
}

% redefining plain seems to be the best way to apply it to all pages
% Note that this dissalows for a fancy header, since the title is in the way
\fancypagestyle{plain}{%
	\renewcommand{\headrulewidth}{0pt}
	\fancyhf{}
	\fancyfoot[COE]{%
		\begin{minipage}{\textwidth}
			\newgeometry{inner=2cm, outer=2cm}
			\theauthor\hfill\thepage{}~or~\pageref{LastPage}\hfill\course{}
			\restoregeometry{}
		\end{minipage}
	}
}
\pagestyle{plain}


\setlength{\droptitle}{-8em}

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{%
	\wlog{1 [title]: \@title}
	\wlog{0 [course]: \rawcourse}
	\let\oldtitle\@title
	\renewcommand{\@title}{\course{} --- \oldtitle}
	\begin{minipage}{\textwidth}
		\newgeometry{inner=2cm, outer=2cm}
		\oldmaketitle{}
		\restoregeometry{}
	\end{minipage}
	\listofkeywordCounter{}
}
