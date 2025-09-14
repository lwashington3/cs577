%! Class = cs577notes.cls
%! Author = Len Washington III
%! Date = 9/3/25

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs577notes}[Len Washington III's Document Class]

\LoadClass[12pt]{report}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
	family=csnotes,
	prefix=csnotes@
}

\DeclareStringOption{lecture}
\DeclareStringOption{title}

\ProcessKeyvalOptions*

\renewcommand{\title}{CS 577 - Lecture \csnotes@lecture\ - \csnotes@title}

\RequirePackage[
	title={\title},
]{cs577}

\newcommand{\lecture}[2]{
	\setcounter{chapter}{#1}
	\addtocounter{chapter}{-1}
	\setcounter{section}{0}
	\chapter{#2}\label{ch:#1}
}

\RequirePackage{enumitem}
\usetikzlibrary{shapes.geometric}

\renewcommand{\maketitle}{%
	\setcounter{chapter}{\csnotes@lecture}
	\addtocounter{chapter}{-1}
	\chapter{\csnotes@title}\label{ch:\csnotes@lecture}
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

\definecolor{problempink}{HTML}{ec008c}

\setlist[problems, 1]
{label=\textcolor{problempink}{\textbf{\csnotes@lecture-\arabic{problemsi}}},
	leftmargin=30pt,}

\setlist[problems, 2]
{label=\textbf{(\alph{problemsii})},
	leftmargin=30pt,}

\setlist[problems, 3]
{label=\textbf{(\roman{problemsiii})},
	leftmargin=35pt,}

\newcounter{problem}
\setcounter{problem}{1}
\newcommand{\problem}[1][prb:\the\numexpr\value{chapter}.\the\numexpr\value{section}.\number\value{problemsi}]{%
	\pdfbookmark[3] % Level
	{Problem \csnotes@lecture-\the\numexpr\value{problemsi}+1} % Text
	{#1}% Name/Label
	\item\label{#1}}

\newcommand{\subproblem}{%
	\pdfbookmark[4]% Level
	{Problem \csnotes@lecture-\the\numexpr\value{problemsi}\makeAlph{problemsii}}% Text
	{prb:\csnotes@lecture.\number\value{problemsi}\makeAlph{problemsii}}% Name/Label
	\item\label{prb:\number\value{problemsi}\alph{problemsii}}}

\newcommand{\subsubproblem}{%
	\pdfbookmark[5]% Level
	{Problem \the\numexpr\value{problemsi}\alph{problemsii}(\makeRoman{problemsiii})}% Text
	{prb:\csnotes@lecture.\number\value{problemsi}\alph{problemsii}.\makeRoman{problemsiii}}% Name/Label
	\item\label{prb:\number\value{problemsi}\alph{problemsii}\roman{problemsiii}}}

\newcommand{\answerfile}{%
	\ifcsnotes@corrections%
	notes\csnotes@lecture_corrections%
	\else%
	notes\csnotes@lecture_answers%
	\fi%
}
\newcommand{\addanswer}[1]{% Input the section name
	\begin{answer}\ExecuteMetaData[\answerfile]{#1}\end{answer}
}

\newcommand{\file}[1]{%
	\addtocounter{chapter}{1}%
	\section{#1}\label{sec:#1}
}

\newcommand{\definition}[2]{\emph{#1} -- #2}

\definecolor{diffpink}{HTML}{FF09E4}