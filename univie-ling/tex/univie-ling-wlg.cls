%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-wlg
%%
%% A layout suitable for the journal Wiener Linguistische Gazette (WLG)
%% (https://www.wlg.univie.ac.at/).
%%
%% This file is part of the univie-ling LaTeX bundle, consisting of:
%%  -- univie-ling-expose.cls: Class for PhD Research Proposals (this file)
%%  -- univie-ling-paper.cls: Class for student papers
%%  -- univie-ling-thesis.cls: Class for BA, MA or PhD theses
%%  -- univie-ling-wlg.cls: Class for the journal Wiener Linguistische Gazette
%%  -- univie-logo-sw.pdf: University of Vienna logo
%%  -- univie-ling-wlg-logo.pdf: Logo of the journal Wiener Linguistische Gazette
%%  -- univie-ling.bbx: Biblatex bibliography style
%%  -- univie-ling.cbx: Biblatex citation style
%%
%% Author: Juergen Spitzmueller
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%% This work has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer of this work is Juergen Spitzmueller.
%% Please report issues to https://github.com/jspitz/univie-ling/issues
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{univie-ling-wlg}[2019/01/21 v1.9 WLG journal layout (JSp)]


%% ============================================================
%% CLASS OPTIONS:
%% ============================================================

\RequirePackage{xkeyval}

\newif\ifbiblatex\biblatexfalse
\newif\ifcovington\covingtontrue
\newif\ifexpert\expertfalse

% biblatex=<true|false>
% Load biblatex
\define@boolkey+{wlg}{biblatex}[true]{%
    \ifKV@wlg@biblatex
        \biblatextrue
    \else
        \biblatexfalse
    \fi
}{%
    \ClassWarning{univie-ling-wlg}{unknown biblatex value}%
}
\DeclareOptionX{biblatex}{\setkeys{wlg}{biblatex=#1}}

% covington=<true|false>
% Load covington
\define@boolkey+{wlg}{covington}[true]{%
    \ifKV@wlg@covington
        \covingtontrue
    \else
        \covingtonfalse
    \fi
}{%
    \ClassWarning{univie-ling-wlg}{unknown covington value}%
}
\DeclareOptionX{covington}{\setkeys{wlg}{covington=#1}}


% expertfonts=<true|false>
% Load MinionPro
\define@boolkey+{wlg}{expertf}[true]{%
    \ifKV@wlg@expertf
        \experttrue
    \else
        \expertfalse
    \fi
}{%
    \ClassWarning{univie-ling-wlg}{unknown expertfonts value}%
}
\DeclareOptionX{expertfonts}{\setkeys{wlg}{expertf=#1}}

% Titlepage?
\newif\iftitlepage\titlepagefalse
\newif\ifspecialprint\specialprintfalse
\define@choicekey*+{wlg}{ttp}[\val\nr]{none,specialprint,issue}{%
    \ifcase\nr\relax% none
      \titlepagefalse
    \or% specialprint:
      \titlepagetrue
      \specialprinttrue
    \or% issue:
      \titlepagetrue
      \specialprintfalse
    \fi
}{%
    \ClassWarning{univie-ling-wlg}{unknown titlepage value '#1'}%
}
\DeclareOptionX{titlepage}{\setkeys{wlg}{ttp=#1}}

\DeclareOption*{%
\PassOptionsToClass{\CurrentOption}{scrartcl}%
}

\ProcessOptionsX


\LoadClass{scrartcl}[2003/04/22]

\KOMAoptions{%
	footlines=2,
	paper=152mm:229mm,
	DIV=calc,
	fontsize=12pt,
	footlines=2,
	headings=small,
	captions=tableheading,
	listof=totoc,
	numbers=noenddot,
	abstract=on,
	twoside=semi
}
\iftitlepage
\KOMAoptions{titlepage=true}
\fi
\recalctypearea

%% ============================================================
%% FONTS UND MICROTYPOGRAPHY:
%% ============================================================

% Roman Font:
\ifexpert
% Adobe Minion (Expert)
\RequirePackage[footnotefigures]{MinionPro}
\else
% Crimson
\RequirePackage[osf]{cochineal}
\fi

% Hyperlinks
\RequirePackage{url}
\newcommand{\urlprefix}{}
% Italic URLs
\def\UrlFont{\rmfamily\itshape}

% Microtype tweaks
\RequirePackage{microtype}

% Full capitals (slightly scaled and tracked):
\RequirePackage{scalefnt}
\RequirePackage{textcase}
\DeclareRobustCommand*\versal[1]{%
  \textls{\MakeTextUppercase{\scalefont{.92}#1}}%
}

% Fix for \slash macro, courtesy of Donald Arsenau
\def\slash{/\penalty\exhyphenpenalty\hskip\z@skip}

% Better ragged text
\RequirePackage{ragged2e}


%% ============================================================
%% l7n
%% ============================================================

\RequirePackage{translator}
\languagealias{naustrian}{German}
\deftranslation[to=German]{issue}{Ausgabe}
\deftranslation[to=English]{issue}{Issue}
\deftranslation[to=German]{univie}{Universit\"at Wien}
\deftranslation[to=English]{univie}{University of Vienna}
\deftranslation[to=German]{lingdep}{Institut f\"ur Sprachwissenschaft}
\deftranslation[to=English]{lingdep}{Department of Linguistics}
\deftranslation[to=German]{published}{Publiziert am}
\deftranslation[to=English]{published}{Published}
\deftranslation[to=German]{specialprint}{Sonderdruck aus:}
\deftranslation[to=English]{specialprint}{Special print from:}
\deftranslation[to=German]{specialissue}{Themenheft}
\deftranslation[to=English]{specialissue}{Special Issue}
\deftranslation[to=German]{keywords}{Schlagw\"orter}
\deftranslation[to=English]{keywords}{Keywords}
\deftranslation[to=German]{corrauthor}{Korrespondenzautor}
\deftranslation[to=English]{corrauthor}{Corresponding author}
\deftranslation[to=German]{corrauthorf}{Korrespondenzautorin}
\deftranslation[to=English]{corrauthorf}{Corresponding author}
\deftranslation[to=German]{corrauthors}{Korrespondenzautoren}
\deftranslation[to=English]{corrauthors}{Corresponding authors}
\deftranslation[to=German]{edby}{Hg.\,v.}
\deftranslation[to=English]{edby}{Ed.\,by}
\deftranslation[to=German]{imp-editor}{Eigentümer, Herausgeber und Verleger}
\deftranslation[to=English]{imp-editor}{Owner, editor and publisher}
\deftranslation[to=German]{univie-address}{Sensengasse 3a\\1090 Wien\\Österreich}
\deftranslation[to=English]{univie-address}{Sensengasse 3a\\1090 Vienna\\Austria}
\deftranslation[to=German]{edboard}{Redaktion}
\deftranslation[to=English]{edboard}{Editorial board}
\deftranslation[to=German]{techboard}{Technische Redaktion}
\deftranslation[to=English]{techboard}{Technical editor}
\deftranslation[to=German]{contact}{Kontakt}
\deftranslation[to=English]{contact}{Contact}
\deftranslation[to=German]{appform}{Die \emph{Wiener Linguistische Gazette} erscheint in loser Folge
                                     im Open-Access-Format.\\
                                     Alle Ausgaben ab Nr. 72 (2005) sind online verfügbar.}
\deftranslation[to=English]{appform}{The \versal{WLG} journal is published in loose sequence and in
                                      open access format.\\
                                      All issues as of 72 (2005) are available online.}
\deftranslation[to=German]{applied}{Angewandte Sprachwissenschaft}
\deftranslation[to=English]{applied}{Applied Linguistics}
\deftranslation[to=German]{genhist}{Allgemeine und Historische Sprachwissenschaft}
\deftranslation[to=English]{genhist}{General and Historical Linguistics}
\deftranslation[to=German]{license}{Dieses Werk unterliegt der Creative-Commons-Lizenz \doclicenseNameRef\\
                                    (Namensnennung -- Nicht kommerziell -- Keine Bearbeitungen)}
\deftranslation[to=English]{license}{This work is published under a Creative Commons \doclicenseNameRef\ license\\
                                    (Attribution-NonCommercial-NoDerivatives)}


\AtBeginDocument{%
\addto\captionsngerman{\renewcommand*\contentsname{Inhalt}}
\addto\captionsnaustrian{\renewcommand*\contentsname{Inhalt}}
}
\AtEndPreamble{
% License
\PassOptionsToPackage{%
   imagewidth=8em,
   imagedistance=1em,
   imagemodifier=-eu,
   hyphenation=RaggedRight,
   type={CC},
   modifier={by-nc-nd},
   version={4.0}}{doclicense}
\RequirePackage{doclicense}
}

\newcommand\impressum{%
\bgroup
\scriptsize
\noindent\textbf{\translate{imp-editor}:}\\
\translate{univie}, \translate{lingdep}\\
\translate{univie-address}
\vspace*{-.5em}
\begin{labeling}{\textbf{\translate{edboard}:}}
\setlength\itemsep{0pt}
\setlength\parsep{0pt}
\setlength{\parskip}{0pt}
\item[\textbf{\translate{edboard}:}]
    Christian Bendl,
    Mi-Cha Flubacher (\translate{applied}),\\
    Stefan Schumacher (\translate{genhist})
%\item[\textbf{\translate{techboard}:}] Markus Rheindorf
\item[\textbf{\translate{contact}:}] \href{mailto:wlg@univie.ac.at}{wlg@univie.ac.at}
\item[\textbf{Homepage:}] \expandafter\url{\wlgurl}
\end{labeling}
\vspace*{-2em}
\begin{labeling}{\textbf{\textsc{issn}:}}
\setlength\itemsep{0pt}
\setlength\parsep{0pt}
\setlength{\parskip}{0pt}
\item[\textbf{\textsc{issn}:}] 2224-1876
\item[\textbf{\textsc{nbn}:}] BI,078,1063
\end{labeling}
\vspace*{-.5em}
\noindent\translate{appform}\par
\setlength{\doclicense@hsize}{\textwidth-\doclicense@imagewidth-\doclicense@imagedistance}%
\begin{center}
      \begin{minipage}{\doclicense@imagewidth}
        \doclicenseImage%
      \end{minipage}
      \hfill
      \begin{minipage}{\doclicense@hsize}
        \ifthenelse{\isempty{\doclicense@hyphenation}}{}{%
          \@nameuse{\doclicense@hyphenation}%
        }%
        \translate{license}%
      \end{minipage}
    \end{center}
\par
\egroup
}


%% ============================================================
%% TOC
%% ============================================================

\RequirePackage{etoc}
\etocstandardlines
\etocsetstyle{chapter}
  {}
  {\normalsize\mdseries\rmfamily}
  {\etocname{}\dotfill\etocpage\par\vspace{12pt}}
  {}
\setcounter{tocdepth}{0}


%% ============================================================
%% LAYOUT
%% ============================================================

% Headings and pagination:
% (scrlayer-scrpage)
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\RequirePackage{scrlayer-scrpage}
\renewcommand{\headfont}{\small\rmfamily}
\clearscrheadings
\ohead{\pagemark}
\automark{section}
\KOMAoptions{headsepline=true}
\pagestyle{scrheadings}

% Macrotypographic sectioning
\newif\if@mainmatter\@mainmattertrue
\newif\if@frontmatter\@frontmatterfalse
\newcommand*\frontmatter{%
  \if@twoside\cleardoubleoddpage\else\clearpage\fi
  \@mainmatterfalse\@frontmattertrue\pagenumbering{roman}%
  \edef\computelastpage{%
    \romannumeral\numexpr\getpagerefnumber{LastFrontPage}-1\relax}%
  \edef\startpageref{%
    \romannumeral\thestartpage\relax}%
}
\newcommand*\mainmatter{%
  \if@twoside\cleardoubleoddpage\else\clearpage\fi%
  \immediate\write\@auxout{\noexpand\newlabel{LastFrontPage}{{}{\arabic{page}}}}%
  \@mainmattertrue\@frontmatterfalse%
  \pagenumbering{arabic}%
  \def\computelastpage{\pageref{LastPage}}%
  \def\startpageref{\thestartpage}%
}
\newcommand*\backmatter{%
  \if@openright\cleardoubleoddpage\else\clearpage\fi\@mainmatterfalse\@frontmatterfalse%
  \def\computelastpage{\pageref{LastPage}}%
  \def\startpageref{\thestartpage}%
}

% No widows and orphans
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty = 10000
\vfuzz \hfuzz
\raggedbottom

% Quotation marks
\AfterPackage*{inputenc}{%
  \RequirePackage{csquotes}
  \ExecuteQuoteOptions{autostyle=try,german=guillemets,austrian=guillemets,maxlevel=3}
  \ifbiblatex
  % Change cite command for integrated csquotes env.
  \SetCiteCommand{\parencite}
  \fi
  \renewcommand{\mktextdel}[1]{[\,]}
}

% Conditional page break
\def\condbreak#1{%
\vskip 0pt plus #1\pagebreak[3]\vskip 0pt plus -#1\relax}


%% ============================================================
%% TITLING
%% ============================================================

\RequirePackage{lastpage}
\RequirePackage{refcount}
\def\computelastpage{\pageref{LastPage}}%
\def\lastpageref{\computelastpage}%
\def\startpageref{\thestartpage}%
\RequirePackage{xcolor}
\RequirePackage{graphicx}

\RequirePackage{hyperref}
\hypersetup{%
bookmarksnumbered=true,
breaklinks=true,
colorlinks=false,
pdfborder={0 0 0}
}

\def\@author{}
\def\@@author{}
\renewcommand*\author[2][]{%
	\ifx\\#1\\%
		\def\@@author{#2}
	\else
		\def\@@author{#1}
	\fi
	\def\@author{#2}
}

% Author affiliation (starred: corresponding author)
\DeclareRobustCommand*\aff{%
  \@ifstar\@@aff\@aff
}

% Empty (will be redefined in the article title)
\newcommand*\@@aff[2][]{}
\newcommand*\@aff[2][]{}

\def\@title{}
\def\@@title{}
\renewcommand*\title[2][]{%
	\ifx\\#1\\%
		\def\@@title{#2}
	\else
		\def\@@title{#1}
	\fi
	\def\@title{#2}
}

\def\@issuetitle{}
\newcommand*\issuetitle[1]{%
	\def\@issuetitle{#1}
}
\def\@issuesubtitle{}
\newcommand*\issuesubtitle[1]{%
	\def\@issuesubtitle{#1}
}
\def\@issueeditors{}
\newcommand*\issueeditors[1]{%
	\def\@issueeditors{#1}
}

\def\@issue{}
\def\@pubyear{}
\newcommand\issue[2]{\def\@issue{#1}\def\@pubyear{#2}}

\newif\iftitlepageneeded\titlepageneededtrue
\newif\ifstartpageset\startpagesetfalse

\def\ljobname{\jobname}

\renewcommand*\maketitle[1][1]{%
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
  \else
    \def\and{\texorpdfstring{\unskip\slash}{| }}%
  \fi
  \iftitlepage
    \@maketitlepage[#1]%
  \fi
  \ifstartpageset\else
   \setcounter{page}{\thestartpage}
   \global\startpagesettrue
  \fi
  \rehead{\@@author}
  \lohead{\@@title}
  \hypersetup{pdfauthor=\@author,
              pdftitle={\@@title\ -- WLG \@issue\ (\@pubyear)}}
  \lofoot[\scriptsize\expandafter\url{\wlgurl/fileadmin/user_upload/p_wlg/\@issue\@pubyear/\ljobname.pdf}\\
         \translate{published} \today]{}
    \par
    \@tempcnta=%
    #1%
    \relax\ifnum\@tempcnta=1\else
      \ClassWarning{\KOMAClassName}{%
        Optional argument of \string\maketitle\space ignored
        at\MessageBreak
        notitlepage-mode%
      }%
    \fi
    \begingroup
      \let\titlepage@restore\relax
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}
      \next@tdpage
       \@makeextratitle
       \@maketitle
       \thispagestyle{\titlepagestyle}\@thanks
    \endgroup
  \setcounter{footnote}{0}%
  \global\let\@cauthor\@empty
  \global\let\@thanks\@empty
  \gdef\@ccauthor{\translate{corrauthor}}
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
    \let\thanks\relax
    \let\maketitle\relax
    \let\@maketitle\relax
    \let\@maketitlepage\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@subtitle\@empty
    \global\let\@extratitle\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\cauthor\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \renewcommand*\@@aff[2][]{}
    \renewcommand*\@aff[2][]{}
  \fi
}%

\newcommand{\@maketitlepage}[1][1]{%
   \iftitlepageneeded
    \begin{titlepage}
      \setcounter{page}{%
        #1%
      }%
      \let\titlepage@restore\relax
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
      \ifx\@extratitle\@empty \else
        \noindent\@extratitle\next@tdpage
      \fi
      \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
      \begin{minipage}[t]{\textwidth}%
          \usekomafont{titlehead}{\includegraphics{univie-ling-wlg-logo}}%
      \end{minipage}\par
       \null\vfill
      \begin{flushleft}
        \ifx\@subject\@empty \else
          {\usekomafont{subject}{\@subject\par}}%
          \vskip 3em
        \fi
        \ifspecialprint
		{\usekomafont{title}{\@title\par}}%
		\vskip 1em
		{\ifx\@subtitle\@empty\else\usekomafont{subtitle}{\@subtitle\par}\fi}%
		\vskip 2em
		{%
		  \usekomafont{author}{%
		      \@author\par
		  }%
		}%
		  \vfill
		  {\usekomafont{date}{\translate{specialprint} \emph{Wiener Linguistische Gazette} (\versal{WLG})
		 \@issue\ (\@pubyear): \startpageref--\lastpageref\par}}
		{\ifx\@issuetitle\@empty\else
			\vskip 1em
			\usekomafont{date}{\translate{specialissue} \itshape\@issuetitle
                         \ifx\@issuesubtitle\@empty\else.\ \@issuesubtitle\fi\par}%
		 \fi}%
		 \ifx\@issueeditors\@empty\else
		  \usekomafont{date}{%
		      \translate{edby}\ \@issueeditors\par
		  }%
                 \fi
        \else
		{\ifx\@issuetitle\@empty
		   \usekomafont{title}{\translate{issue} \@issue\ (\@pubyear)\par}
                     \etocsettocstyle{\subsubsection*{\contentsname}}{}
		     \etocsetstyle{chapter}
			  {}
			  {\scriptsize\mdseries\rmfamily}
			  {\scriptsize\etocname{}\dotfill\etocpage\par\vspace{8pt}}
			  {}
                   \tableofcontents
		\else
		   \usekomafont{date}{\translate{issue} \@issue\ (\@pubyear)\par}
		\fi}
		{\ifx\@issuetitle\@empty\else
			\vskip 1em
			\usekomafont{date}{\translate{specialissue}\par}%
			\usekomafont{title}{\@issuetitle\par}%
		        \vskip 3pt
		        {\ifx\@issuesubtitle\@empty\else\usekomafont{subtitle}{\@issuesubtitle\par}\fi}%
		         \vskip 2em
		        {%
		         \ifx\@issueeditors\@empty\else
		         \usekomafont{date}{%
		            \translate{edby}\ \@issueeditors\par
		         }%
                         \fi
                       }%
		 \fi}%
        \fi%
        \vfill
        {\usekomafont{publishers}{\translate{univie} $\cdot$ \translate{lingdep} $\cdot$ \@pubyear\par}}%
      \end{flushleft}\par
      \@thanks\let\@thanks\@empty
      \null
      \if@twoside
        \@tempswatrue
        \expandafter\ifnum \@nameuse{scr@v@3.12}>\scr@compatibility\relax
        \else
          \ifx\@uppertitleback\@empty\ifx\@lowertitleback\@empty
            \@tempswafalse
          \fi\fi
        \fi
        \if@tempswa
          \next@tpage
          \begin{minipage}[t]{\textwidth}
            \@uppertitleback
          \end{minipage}\par
          \vfill
          \begin{minipage}[b]{\textwidth}
            \@lowertitleback
          \end{minipage}\par
          \@thanks\let\@thanks\@empty
        \fi
      \fi
      \ifx\@dedication\@empty
      \else
        \next@tdpage\null\vfill
        {\centering\usekomafont{dedication}{\@dedication \par}}%
        \vskip \z@ \@plus3fill
        \@thanks\let\@thanks\@empty
        \cleardoubleemptypage
      \fi
      \ifx\titlepage@restore\relax\else\clearpage\titlepage@restore\fi
    \end{titlepage}
    \clearpage
    \thispagestyle{empty}
    ~\vfill
    \impressum
    \clearpage
    \ifspecialprint\else
     \ifx\@issuetitle\@empty\else
       \thispagestyle{plain}
       \tableofcontents
       \clearpage
     \fi
    \fi
    \global\titlepageneededfalse%
   \fi%
}

\renewcommand*{\@maketitle}{%
  \addcontentsline{toc}{chapter}{\@author\texorpdfstring{\\[5pt]}{: }\@title%
				       \ifx\@subtitle\empty\else\texorpdfstring{\\}{. }\@subtitle\fi}%
  \next@tdpage
  \global\@topnum=\z@
  \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
  \ifx\@titlehead\@empty \else
    \begin{minipage}[t]{\textwidth}
      \usekomafont{titlehead}{\@titlehead\par}%
    \end{minipage}\par
  \fi
  \null
  \vskip 2em%
  \renewcommand*\@@aff[2][]{%
	\def\@ccauthor{\translate{corrauthor}}%
	\ifx##1f%
		\def\@ccauthor{\translate{corrauthorf}}%
	\else\ifx##1p%
		\def\@ccauthor{\translate{corrauthors}}%
	\fi\fi%
	\def\@cauthor{##2}%
	\thanks{\protect\raggedright ##2 (\@ccauthor).}
  }
  \renewcommand*\@aff[2][]{%
	\thanks{\protect\raggedright ##2.}
  }
  \begin{flushleft}%
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
    \let\@ooldmakefnmark\@makefnmark
    \renewcommand*{\@makefnmark}{\rlap\@ooldmakefnmark}%
    \vskip 1em%
    \ifx\@subject\@empty \else
      {\usekomafont{subject}{\@subject \par}}%
      \vskip 1.5em
    \fi
    {\usekomafont{title}{\@title \par}}%
    \vskip .5em
    {\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}%
    \vskip 1em
    {\usekomafont{author}{\@author\par}}%
    {\color{gray}\rule{1\columnwidth}{.7pt}\par}%
  \end{flushleft}%
  \begin{flushright}
    {\footnotesize
     \emph{Wiener Linguistische Gazette} (\versal{WLG})\par
     \translate{lingdep}\par
     \translate{univie}\par
     \translate{issue} \@issue\ (\@pubyear): \thepage--\lastpageref
    }%
    \vskip \z@ \@plus 1em
    {\usekomafont{publishers}{\@publishers \par}}%
    \ifx\@dedication\@empty \else
      \vskip 2em
      {\usekomafont{dedication}{\@dedication \par}}%
    \fi
  \end{flushright}%
  \par
  \vskip 2em
}%

% Rewrite \include for local LastPage counter
\def\@include#1 {%
  \def\ljobname{#1}%
  \def\lastpageref{\pageref{LastPage#1}}%
  \clearpage
  \if@filesw
    \immediate\write\@mainaux{\string\@input{#1.aux}}%
  \fi
  \@tempswatrue
  \if@partsw
    \@tempswafalse
    \edef\reserved@b{#1}%
    \@for\reserved@a:=\@partlist\do
      {\ifx\reserved@a\reserved@b\@tempswatrue\fi}%
  \fi
  \if@tempswa
    \let\@auxout\@partaux
    \if@filesw
      \immediate\openout\@partaux #1.aux
      \immediate\write\@partaux{\relax}%
    \fi
    \ifbiblatex
       \newrefsection
    \fi
    \@input@{#1.tex}%
    \label{LastPage#1}%
    \clearpage
    \@writeckpt{#1}%
    \if@filesw
      \immediate\closeout\@partaux
    \fi
  \else
    \deadcycles\z@
    \@nameuse{cp@#1}%
  \fi
  \let\@auxout\@mainaux}

\setkomafont{author}{\normalsize\normalfont\mdseries\itshape}
\setkomafont{title}{\normalfont\bfseries\Large}
\setkomafont{subtitle}{\normalsize\normalfont\bfseries}
\setkomafont{date}{\normalsize\normalfont\mdseries}
\setkomafont{publishers}{\small\mdseries}


%% =============================================================
%% CONVENIENCE FUNCTION FOR COMPLETE ISSUES:
%% =============================================================

\RequirePackage{pdfpages}
\def\@iauthor{}
\def\@ititle{}
\def\@isubtitle{}
\define@key{wlgissue}{author}{\def\@iauthor{#1}}
\define@key{wlgissue}{title}{\def\@ititle{#1}}
\define@key{wlgissue}{subtitle}{\def\@isubtitle{#1}}
\newcommand*\makeissuetitle{\@maketitlepage}
\newcommand*\includefinalpaper[2][]{%
   \def\@iauthor{}
   \def\@ititle{}
   \def\@isubtitle{}
   \setkeys{wlgissue}{#1}
   \def\@ipaper{#2}
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\@iauthor\texorpdfstring{\\[5pt]}{: }\@ititle%
				       \ifx\@isubtitle\empty\else\texorpdfstring{\\}{. }\@isubtitle\fi}%
    \includepdf[pages=3-]{\@ipaper}
}


%% =============================================================
%% FOOTNOTES:
%% =============================================================

% Increase distance between text and footnotes
\renewcommand\footnoterule{%
% Distance between text and footnote rule (1 line)
  \kern-3\p@\hrule\@width.4\columnwidth%
  \kern2.6\p@%
% Distance between footnote rule and foot notes (0.2em)
  \vspace{0.2em}}%

% Fotenote mark not superscripted
\newlength{\footnumwidth}
% Adapt number width to maximum footnote count (footnotesize)
\newcommand*\maxfn{199}
\AtBeginDocument{%
  \settowidth{\footnumwidth}{{\normalfont\footnotesize\maxfn\space\space}}
  \deffootnote[\footnumwidth]{\footnumwidth}{1em}{\thefootnotemark\space\space}
}

% Footnote at botton despite \raggedbottom
%\RequirePackage[bottom,hang]{footmisc}
%\setlength{\footnotemargin}{1.2em}


%% =============================================================
%% ADAPT ENVIRONMENTS:
%% =============================================================

% Headings
% (serifs)
\setkomafont{sectioning}{\normalfont\normalcolor\bfseries}

% Abstract
\renewenvironment{abstract}{%
      \addsec*{\hspace*{2.4em}Abstract}
      \quotation\noindent\ignorespaces%
}{%
    \if@twocolumn\else\endquotation\fi
}

% Keywords
\newcommand\keywords[1]{%
 \begin{quote}
  \begin{labeling}{\textbf{\translate{keywords}:}}
   \RaggedRight\small%
   \item[\textbf{\translate{keywords}:}]
      #1%
   \end{labeling}
  \end{quote}
}

% Motto
\setkomafont{dictum}{\rmfamily}
\setkomafont{dictumauthor}{\rmfamily}
\renewcommand\dictumwidth{.7\textwidth}
\renewcommand\raggeddictumtext{\raggedleft}
\renewcommand*{\dictumrule}{}

\newcommand\motto[2][]{%
\dictum[#1]{#2}
\medskip
\@afterindentfalse
\@afterheading
}

% Lists
\RequirePackage{enumitem}
\setlist{itemsep=0pt}
% Itemize
\def\labelitemi{--}

% Quote (smaller)
\newcommand*{\OriginalQuote}{}
\let\OriginalQuote\quote
\renewcommand*{\quote}{\OriginalQuote\small}

% Quotation (smaller)
\newcommand*{\OriginalQuotation}{}
\let\OriginalQuotation\quotation
\renewcommand*{\quotation}{\OriginalQuotation\small}

% Description (KOMA) (normal italic)
\setkomafont{descriptionlabel}{\normalfont\itshape}

% ldots centered
\let\olddots\ldots
\renewcommand*{\ldots}{\olddots\unkern}

\ifcovington
\RequirePackage{covington}
\renewcommand{\p@equation}[1]{(#1)}
\fi


%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

%% caption label bold
\setkomafont{captionlabel}{\bfseries}
% left aligned captions
\RequirePackage[%
	format=hang,
	justification=RaggedRight,
	singlelinecheck=false
	]{caption}

%% Nicer tables with booktabs.sty
\RequirePackage{booktabs}

%% allow multiple rows
\RequirePackage{multirow}


%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\ifbiblatex
\RequirePackage[%
  style=univie-ling,
  sorting=nyvt,
  autolang=hyphen]
{biblatex}
\fi
\AtBeginDocument{%
\@ifundefined{bibhang}{}{%
  \setlength{\bibhang}{\parindent}%
  \renewcommand{\bibfont}{\small}%
}%
}

%% =============================================================
%% REFERENCES:
%% =============================================================

% Varioref:
\RequirePackage[ngerman]{varioref}
\AtBeginDocument{%
\renewcommand\reftextafter{auf der \reftextvario{folgenden}{nächsten} Seite}%
\renewcommand\reftextfaceafter{auf der \reftextvario{folgenden}{nächsten} Seite}%
\renewcommand\reftextbefore{auf der \reftextvario{vorhergehenden}{vorangegangenen} Seite}%
\renewcommand\reftextfacebefore{auf der \reftextvario{vorhergehenden}{vorangegangenen} Seite}%
\renewcommand\reftextfaraway[1]{auf S.~\pageref{#1}}%
\renewcommand\reftextpagerange[2]{auf S.~\pageref{#1}--\pageref{#2}}%
}

% Prettyref:
% (varioref included)
\RequirePackage{prettyref}
\newrefformat{cha}{Kapitel~\vref{#1}}
\newrefformat{sec}{Abschnitt~\vref{#1}}
\newrefformat{sub}{Abschnitt~\vref{#1}}
\newrefformat{anm}{Anm.~\ref{#1}}
\newrefformat{app}{Anhang~\vref{#1}}
\newrefformat{tab}{Tabelle~\vref{#1}}
\newrefformat{fig}{Abbildung~\vref{#1}}
\newrefformat{exp}{Argumentation~\vref{#1}}


%% =============================================================
%% SEMANTIC MARKUP:
%% =============================================================

\newcommand\Expression[1]{\textit{#1}}
\newcommand\Concept[1]{\textsc{#1}}
\newcommand\Meaning[1]{\enquote*{#1}}

%% =============================================================
%% EDITORIAL MACROS:
%% =============================================================

% Adapt start page number
\newcounter{startpage}
\setcounter{startpage}{1}
\newcommand*\startpage[1]{\setcounter{startpage}{#1}}

% Main url
\def\wlgurl{http://wlg.univie.ac.at}

%% Finis.
