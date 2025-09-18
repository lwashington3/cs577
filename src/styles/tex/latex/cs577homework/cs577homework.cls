%! Class = cs577homework.cls
%! Author = Len Washington III
%! Date = 2/1/25

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs577homework}[Len Washington III's Document Class]

\LoadClass[12pt]{report}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
	family=cshomework,
	prefix=cshomework@
}

\DeclareStringOption{number}
\DeclareBoolOption[true]{answers}
\DeclareBoolOption[false]{corrections}

\ProcessKeyvalOptions*

\renewcommand{\title}{CS 577 -- Fall 2025 -- Homework \cshomework@number}

\RequirePackage[
	title={\title},
]{cs577}
\RequirePackage{makecell}
\usetikzlibrary{shapes.geometric}

\hypersetup{
	linkcolor=black
}

\renewcommand{\maketitle}{%
	\begin{center}\LARGE{\title}\end{center}
	\vspace{0.5em}
}

\RequirePackage{enumitem}
\newlist{problems}{enumerate}{3}
\setlist[problems, 1]
{label=\textbf{\arabic{problemsi}.},
	leftmargin=15pt,
}

\RequirePackage{alphalph}
\RequirePackage{bookmark}
\newcommand*\makeAlph[1]{\alphalph{\the\numexpr\value{#1}+1}}
\newcommand*\makeRoman[1]{\romannumeral\the\numexpr\value{#1}+1}
%\newcommand*\makeRoman[1]{\lowercase\expandafter\@slowromancap\romannumeral\the\numexpr\value{#1}+1@}

\newcommand{\problem}[2]{%
	\pdfbookmark[3] % Level
	{Problem #1} % Text
	{\cshomework@number.#1}% Name/Label
	\noindent\textbf{Problem #1 -- [#2] point(s)}.%
}

\newcommand{\answerfile}{%
	\ifcshomework@corrections%
	washington-homework\cshomework@number_corrections%
	\else%
	washington-homework\cshomework@number_answers%
	\fi%
}
\newcommand{\addanswer}[1]{% Input the section name
	\begin{answer}\ExecuteMetaData[\answerfile]{#1}\end{answer}
}

\newcommand{\file}[1]{%
	\addtocounter{chapter}{1}%
	\section{#1}\label{sec:#1}
}

\newcommand{\pspace}{~\hspace*{0.25em}}
\newcommand{\problemline}{\pspace\hrule\pspace}