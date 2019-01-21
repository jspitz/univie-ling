%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-thesis
%%
%% BA, MA and PhD Theses in (Applied) Linguistics at the University of Vienna
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
\ProvidesPackage{univie-ling-thesis}[2019/01/21 v1.9 Univie Linguistic Theses (JSp)]

\RequirePackage{xkeyval}

\newif\ifbiblatex\biblatextrue
\newif\ifapa\apafalse
\newif\ifcaptionp\captionptrue
\newif\ifrefsp\refsptrue
\newif\ifcovington\covingtontrue
\newif\ifmicrotype\microtypetrue

% all=<true|false>
% Load all packages
\define@boolkey+{uvt}{all}[true]{%
    \ifKV@uvt@all
        \biblatextrue
        \captionptrue
        \refsptrue
        \covingtontrue
        \microtypetrue
    \else
        \biblatexfalse
        \captionpfalse
        \refspfalse
        \covingtonfalse
        \microtypefalse
    \fi
}{%
    \ClassWarning{univie-ling-thesis}{unknown 'all' value}%
}
\DeclareOptionX{all}{\setkeys{uvt}{all=#1}}

% biblatex=<true|false>
% Load biblatex
\define@boolkey+{uvt}{biblatex}[true]{%
    \ifKV@uvt@biblatex
        \biblatextrue
    \else
        \biblatexfalse
    \fi
}{%
    \ClassWarning{univie-ling-thesis}{unknown biblatex value}%
}
\DeclareOptionX{biblatex}{\setkeys{uvt}{biblatex=#1}}

% apa=<true|false>
% Load APA style
\define@boolkey+{uvt}{apa}[true]{%
    \ifKV@uvt@biblatex
        \apatrue
    \else
        \apafalse
    \fi
}{%
    \ClassWarning{univie-ling-paper}{unknown apa value}%
}
\DeclareOptionX{apa}{\setkeys{uvt}{apa=#1}}

% caption=<true|false>
% Load caption
\define@boolkey+{uvt}{caption}[true]{%
    \ifKV@uvt@caption
        \captionptrue
    \else
        \captionpfalse
    \fi
}{%
    \ClassWarning{univie-ling-thesis}{unknown caption value}%
}
\DeclareOptionX{caption}{\setkeys{uvt}{caption=#1}}

% ref=<true|false>
% Load varioref and prettyref
\define@boolkey+{uvt}{ref}[true]{%
    \ifKV@uvt@ref
        \refsptrue
    \else
        \refspfalse
    \fi
}{%
    \ClassWarning{univie-ling-thesis}{unknown ref value}%
}
\DeclareOptionX{ref}{\setkeys{uvt}{ref=#1}}

% covington=<true|false>
% Load covington
\define@boolkey+{uvt}{covington}[true]{%
    \ifKV@uvt@covington
        \covingtontrue
    \else
        \covingtonfalse
    \fi
}{%
    \ClassWarning{univie-ling-thesis}{unknown covington value}%
}
\DeclareOptionX{covington}{\setkeys{uvt}{covington=#1}}

% microtype=<true|false>
% Load microtype
\define@boolkey+{uvt}{microtype}[true]{%
    \ifKV@uvt@microtype
        \microtypetrue
    \else
        \microtypefalse
    \fi
}{%
    \ClassWarning{univie-ling-thesis}{unknown microtype value}%
}
\DeclareOptionX{microtype}{\setkeys{uvt}{microtype=#1}}

\newif\iffdegree\fdegreefalse
% fdegree=<true|false>
% Female degree forms
\define@boolkey+{uvt}{fdegree}[true]{%
    \ifKV@uvt@fdegree
        \fdegreetrue
    \else
        \fdegreefalse
    \fi
}{%
    \ClassWarning{univie-ling-thesis}{unknown fdegree value}%
}
\DeclareOptionX{fdegree}{\setkeys{uvt}{fdegree=#1}}

\newif\ifpsfonts\psfontstrue
\newif\ifotffonts\otffontsfalse
\newif\ifnofonts\nofontsfalse
% fonts=<ps|otf|none>
\define@choicekey*+{uvt}{fonts}[\val\nr]{ps,otf,none}{%
    \ifcase\nr\relax% ps: use PostScript fonts (classic LaTeX)
      \psfontstrue
      \otffontsfalse
      \nofontsfalse
    \or% otf: use OpenType fonts (fontspec)
      \psfontsfalse
      \otffontstrue
      \nofontsfalse
    \or% none: Use no font package
      \psfontsfalse
      \otffontsfalse
      \nofontstrue
    \fi
}{%
    \PackageWarning{jsdossier}{unknown fonts value '#1'}%
}
\DeclareOptionX{fonts}{\setkeys{uvt}{fonts=#1}}

\ProcessOptionsX

\LoadClass[%
	   a4paper,
	   captions=tableheading,
	   listof=totoc,
	   numbers=noenddot,
	   titlepage=true,
	   chapterentrydots=true
]{scrreprt}[2003/04/22]

\RequirePackage{array}

%% ============================================================
%% LOCALIZATION:
%% ============================================================

\RequirePackage{translations}
\DeclareTranslation{German}{section}{Abschnitt}
\DeclareTranslation{English}{section}{section}
\DeclareTranslation{German}{footnote}{Anm.}
\DeclareTranslation{English}{footnote}{fn.}
\DeclareTranslation{German}{example}{Beispiel}
\DeclareTranslation{English}{footnote}{example}
\DeclareTranslation{German}{stkz}{Studienkennzahl}
\DeclareTranslation{English}{stkz}{Studienkennzahl}


%% ============================================================
%% FONTS AND EMPHASIZING:
%% ============================================================

\ifpsfonts

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}

% Palatino
\usepackage[osf]{mathpazo}

% Arial or Helvetica
\IfFileExists{uarial.sty}{%
\RequirePackage{uarial}
}{%
\RequirePackage{helvet}
}
\fi

\ifotffonts
\RequirePackage{fontspec}
\setmainfont{Palatino}
\setsansfont{Arial}
\fi

% Hyperlinks
\RequirePackage{url}
\newcommand{\urlprefix}{}
% URLs italic
\@ifundefined{selectfont}{%
\def\UrlFont{\it}}
{\def\UrlFont{\rmfamily\itshape}
}

% Fix for \slash-Makro, by Donald Arsenau
\def\slash{/\penalty\exhyphenpenalty\hskip\z@skip}

% Font settings
\newkomafont{thesistype}{\fontsize{24}{26pt}\bfseries\sffamily}
\setkomafont{title}{\fontsize{18}{20pt}\sffamily}
\setkomafont{author}{\fontsize{18}{20pt}\large\sffamily}
\setkomafont{date}{\normalfont\fontsize{11}{13pt}\mdseries\sffamily}
\newkomafont{degree}{\fontsize{12}{14pt}\sffamily}
\newkomafont{baende}{\normalfont\fontsize{12}{14pt}\mdseries\sffamily}
\newkomafont{tpcaption}{\fontsize{11}{13pt}\sffamily}
\newkomafont{codes}{\fontsize{10}{12pt}\sffamily}


%% ============================================================
%% MACROS:
%% ============================================================

\def\@thesistype{}
\def\@thesistype@en{}
\def\@dirtype{}
\def\@dirtype@en{}

\define@key{lec}{thesistype}{%
  \AtEndPreamble{%
    \ifcsundef{thesistype@#1}{%
       \ClassError{univie-ling-thesis}{Thesis type '#1' is not defined!}{%
             Please consult the package manual for instructions how to define it}{}
    }{}
    \def\@thesistype{\csuse{thesistype@#1}}
    \def\@thesistype@en{\csuse{thesistype@#1@en}}
    \def\@dirtype{\csuse{dirtype@#1}}
    \def\@dirtype@en{\csuse{dirtype@#1@en}}
    \iffdegree
        \def\@degree{\csuse{degree@#1@f}}
    \else
        \def\@degree{\csuse{degree@#1}}
    \fi
  }%
}

\define@key{lec}{lecsem}{%
  \AtEndPreamble{%
    \ifcsundef{lecsemshort@#1}{%
       \ClassError{univie-ling-thesis}{Semester type '#1' is not defined!}{%
             Please consult the package manual for instructions how to define it}{}
    }{}
    \def\lecsemshort{\csuse{lecsemshort@#1}}%
    \def\lecsemverb{\csuse{lecsemverb@#1}}%
  }%
}

\newcommand\thesistype[1]{\setkeys{lec}{thesistype=#1}}
\def\@course{}
\def\@supervisor{}
\def\@cosupervisor{}
\newcommand\supervisor[1]{\def\@supervisor{#1}}
\newcommand\cosupervisor[1]{\def\@cosupervisor{#1}}
\def\@studienrichtung{}
\newcommand\studienrichtung[1]{\def\@studienrichtung{#1}}
\def\@studienkennzahl{}
\newcommand\studienkennzahl[1]{\def\@studienkennzahl{#1}}
\def\@volume{}
\def\@volumes{}
\newcommand\volume[2]{\def\@volume{#1}\def\@volumes{#2}}
\def\@degree{}
\newcommand\degree[1]{\AtBeginDocument{\def\@degree{#1}}}

% Semantic markup
\newcommand\Expression[1]{\textit{#1}}
\newcommand\Concept[1]{\textsc{#1}}
\newcommand\Meaning[1]{\enquote*{#1}}


%% ============================================================
%% STRINGS:
%% ============================================================

% 1) Thesis types
%
% bachelor
\def\thesistype@bachelor{Bachelorarbeit}
\def\thesistype@bachelor@en{Bachelor's Thesis}
\def\dirtype@bachelor{Studienrichtung}
\def\dirtype@bachelor@en{degree programme}
\def\degree@bachelor{Bachelor of Arts (BA)}
\def\degree@bachelor@f{\degree@bachelor}
% master
\def\thesistype@master{Masterarbeit}
\def\thesistype@master@en{Master's Thesis}
\def\dirtype@master{Studienrichtung}
\def\dirtype@master@en{degree programme}
\def\degree@master{Master of Arts (MA)}
\def\degree@master@f{\degree@master}
% magister
\def\thesistype@magister{Magisterarbeit}
\def\thesistype@magister@en{Magister Thesis}
\def\dirtype@magister{Studienrichtung}
\def\dirtype@magister@en{degree programme}
\def\degree@magister{Magister der Philosophie (Mag.\,Phil.)}
\def\degree@magister@f{Magistra der Philosophie (Mag.\,Phil.)}
% diplom
\def\thesistype@diplom{Diplomarbeit}
\def\thesistype@diplom@en{Diploma Thesis}
\def\dirtype@diplom{Studienrichtung}
\def\dirtype@diplom@en{degree programme}
\def\degree@diplom{Magister der Philosophie (Mag.\,Phil.)}
\def\degree@diplom@f{Magistra der Philosophie (Mag.\,Phil.)}
% diss
\def\thesistype@diss{Dissertation}
\def\thesistype@diss@en{Doctoral Thesis}
\def\dirtype@diss{Dissertationsgebiet}
\def\dirtype@diss@en{field of study}
\def\degree@diss{Doktor der Philosophie (Dr.\,phil.)}
\def\degree@diss@f{Doktorin der Philosophie (Dr.\,phil.)}

% 2.) Term types
%
% ss
\def\lecsemverb@ss{Sommersemester}
\def\lecsemshort@ss{SoSe}
% ws
\def\lecsemverb@ws{Wintersemester}
\def\lecsemshort@ws{WS}


%% ============================================================
%% LAYOUT
%% ============================================================

\RequirePackage{geometry}

\usepackage{setspace}
\onehalfspacing

% Header and pagination:
% (scrlayer-scrpage)
\RequirePackage{scrlayer-scrpage}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\RequirePackage{scrlayer-scrpage}
\renewcommand{\headfont}{\small\rmfamily}
\clearscrheadings
\ihead{\headmark}
\ohead{\pagemark}
\automark{chapter}
\KOMAoptions{headsepline=true}
\pagestyle{scrheadings}

% No widows and orphans
% No overfull lines
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty = 10000
\vfuzz \hfuzz
\raggedbottom

% Micro-typographic polishment
\ifmicrotype
\usepackage{microtype}
\fi

% Smart quotes
\RequirePackage[autostyle=tryonce,german=guillemets,maxlevel=3]{csquotes}


%% ============================================================
%% TITLING
%% ============================================================

% We need graphicx for the logo
\RequirePackage{graphicx}

\renewcommand*\maketitle[1][1]{%
  \newgeometry{top=2cm,bottom=2.5cm,left=2.5cm,right=2cm}
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
  \else
    \def\and{%
      \end{tabular}%
      \hskip 1em \@plus.17fil%
      \begin{tabular}[t]{c}%
    }%
  \fi
    \begin{titlepage}
      \sffamily%
      \setcounter{page}{%
        #1%
      }%
      \if@titlepageiscoverpage
        \edef\titlepage@restore{%
          \noexpand\endgroup
          \noexpand\global\noexpand\@colht\the\@colht
          \noexpand\global\noexpand\@colroom\the\@colroom
          \noexpand\global\vsize\the\vsize
          \noexpand\global\noexpand\@titlepageiscoverpagefalse
          \noexpand\let\noexpand\titlepage@restore\noexpand\relax
        }%
        \begingroup
        \topmargin=\dimexpr \coverpagetopmargin-1in\relax
        \oddsidemargin=\dimexpr \coverpageleftmargin-1in\relax
        \evensidemargin=\dimexpr \coverpageleftmargin-1in\relax
        \textwidth=\dimexpr
        \paperwidth-\coverpageleftmargin-\coverpagerightmargin\relax
        \textheight=\dimexpr
        \paperheight-\coverpagetopmargin-\coverpagebottommargin\relax
        \headheight=0pt
        \headsep=0pt
        \footskip=\baselineskip
        \@colht=\textheight
        \@colroom=\textheight
        \vsize=\textheight
        \columnwidth=\textwidth
        \hsize=\columnwidth
        \linewidth=\hsize
      \else
        \let\titlepage@restore\relax
      \fi
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
      \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
       \begin{flushright}
         \includegraphics[width=6cm]{univielogo-sw}
       \end{flushright}
         \vspace{2\baselineskip}
       \begin{center}
         \bgroup\usekomafont{thesistype}{\MakeUppercase{\@thesistype\,/\,\hskip\z@skip\mbox{\@thesistype@en}}\par}\egroup
       \end{center}
      \vspace{2\baselineskip}
      \begin{center}
	{\usekomafont{tpcaption}Titel der \@thesistype\,/\,Title of the \@thesistype@en\par}
        {\usekomafont{title}{\enquote{\@title%
         \ifx\@subtitle\@empty\else\\\@subtitle\fi}\par}}%
        {\ifx\@volume\@empty\else\vskip 1em\usekomafont{baende}{Band \@volume\ von \@volumes\ Bänden\,/\,volume \@volume\ of \@volumes\ volumes}\fi}%
        \vskip 2em
        {%
          {\usekomafont{tpcaption}verfasst von\,/\,submitted by\par}
          \usekomafont{author}{%
            \lineskip 0.75em%
            \begin{tabular}[t]{c}
              \@author
            \end{tabular}\par
          }%
        }%
        \vskip 2em
	{\usekomafont{tpcaption}angestrebter akademischer Grad\,/\,in partial fulfilment of the requirements for the degree of\par}
        \usekomafont{degree}{\@degree}
       \end{center}\par
        \vfill
        {\usekomafont{date}{Wien, \the\year\,/\,Vienna, \the\year\par}}%
        \vskip 2em
	\usekomafont{codes}{%
	\begin{tabular}[t]{@{}>{\raggedright}p{0.4\columnwidth}>{\raggedright}p{0.1\columnwidth}>{\raggedright}p{0.4\columnwidth}}
	Studienkennzahl lt. Studienblatt/\newline degree programme code as it appears on the student record sheet: & & \@studienkennzahl\tabularnewline
        \noalign{\vskip6pt}
	\@dirtype\ lt. Studienblatt\slash\newline \@dirtype@en\ as it appears on the student record sheet: & & \@studienrichtung\tabularnewline
        \noalign{\vskip6pt}
        Betreut von\,/\,Supervisor: & & \@supervisor\tabularnewline%
        \noalign{\vskip6pt}
        \ifx\@cosupervisor\@empty\else Mitbetreut von\,/\,Co-Supervisor: & & \@cosupervisor\fi
	\end{tabular}\par
	}
      \par
      \@thanks\let\@thanks\@empty
      \null
      \if@twoside
        \@tempswafalse
        \expandafter\ifnum \@nameuse{scr@v@3.12}>\scr@compatibility\relax
        \else
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
  \setcounter{footnote}{0}%
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
    \let\thanks\relax
    \let\maketitle\relax
    \let\@maketitle\relax
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
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
  \fi
  \global\let\and\relax
  \restoregeometry
}%


%% =============================================================
%% FOOTNOTES:
%% =============================================================

% Increase spacing between text and footnotes
\renewcommand\footnoterule{%
  \kern-3\p@\hrule\@width.4\columnwidth%
  \kern2.6\p@%
  \vspace{0.2em}%
}%

% Non-superscripted footnote sign
\newlength{\footnumwidth}
\newcommand*\maxfn{199}
\AtBeginDocument{%
  \settowidth{\footnumwidth}{{\normalfont\footnotesize\maxfn\space\space}}
  \deffootnote[\footnumwidth]{\footnumwidth}{1em}{\thefootnotemark\space\space}
}


%% =============================================================
%% ADJUST ENVIRONMENTS:
%% =============================================================

% Headings
% (Serifs)
\setkomafont{sectioning}{\normalfont\normalcolor\bfseries}

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

% Description (normal italic)
\setkomafont{descriptionlabel}{\normalfont\itshape}

\ifcovington
\RequirePackage{covington}
\renewcommand{\p@equation}[1]{(#1)}
\fi

%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

%% captionlabel bold
\setkomafont{captionlabel}{\bfseries}

\ifcaptionp
\RequirePackage[format=plain,
	    justification=RaggedRight,
	    singlelinecheck=false
	   ]{caption}
\fi

%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\ifbiblatex

\ifapa
% Load biblatex with apa style
\RequirePackage[%
  style=apa,
  natbib=true,
  sorting=nyvt,
  sortcites=true,
  backend=biber]
{biblatex}

% Map localization files to the apa variants
\DeclareLanguageMapping{english}{english-apa}
\DeclareLanguageMapping{german}{german-apa}
\DeclareLanguageMapping{ngerman}{ngerman-apa}
\DeclareLanguageMapping{austrian}{austrian-apa}
\DeclareLanguageMapping{naustrian}{naustrian-apa}

% Adapt to the DGPs guidelines:
% 1. Use "et al." (rather than "u.a.") in German
% 2. No comma before final and/& in German
% 3. "forthcoming a" rather than "forthcoming-a"
\DefineBibliographyStrings{german}{%
   andothers = {et al\adddot}%
}
\DefineBibliographyExtras{german}{%
   \def\finalandcomma{}%
}
\DefineBibliographyStrings{ngerman}{%
   andothers = {et al\adddot}%
}
\DefineBibliographyExtras{ngerman}{%
   \def\finalandcomma{}%
}
\DefineBibliographyStrings{austrian}{%
   andothers = {et al\adddot}%
}
\DefineBibliographyExtras{austrian}{%
   \def\finalandcomma{}%
}
\DefineBibliographyStrings{naustrian}{%
   andothers = {et al\adddot}%
}
\DefineBibliographyExtras{naustrian}{%
   \def\finalandcomma{}%
}
\renewcommand{\apashortdash}{~}

% Change cite command for integrated csquotes env.
\SetCiteCommand{\parencite}
% Map \citealp to \nptextcite
\let\citealp\nptextcite
%
\else% Unified Style for Linguistics
\RequirePackage[%
  style=univie-ling,
  sorting=nyvt,
  sortcites=true,
  backend=biber]
{biblatex}

% Change cite command for integrated csquotes env.
\SetCiteCommand{\parencite}

% End of apa condition
\fi

% End of biblatex condition
\fi

%% =============================================================
%% TOC:
%% =============================================================

\let\origtableofcontents\tableofcontents
\renewcommand*\tableofcontents{%
\thispagestyle{plain}
\origtableofcontents
\clearpage
}


%% =============================================================
%% X-REFS:
%% =============================================================

\ifrefsp

% Varioref:
\RequirePackage{varioref}
\AtBeginDocument{%
  \vref@addto\extrasnaustrian{%
    \def\reftextafter{auf der \reftextvario{folgenden}{n\"achsten} Seite}%
    \def\reftextfaceafter{auf der gegen\"uberliegenden Seite}%
    \def\reftextbefore{auf der \reftextvario{vorhergehenden}{vorangegangenen} Seite}%
    \def\reftextfacebefore{auf der gegen\"uberliegenden Seite}%
    \def\reftextfaraway[1]{auf S.~\pageref{##1}}%
    \def\reftextpagerange[2]{auf S.~\pageref{##1}--\pageref{##2}}%
  }%
}

% Prettyref:
% (varioref-Befehle mit eingebunden)
\RequirePackage{prettyref}
\newrefformat{cha}{\chaptername~\ref{#1}}
\newrefformat{sec}{\GetTranslation{section}~\ref{#1}}
\newrefformat{sub}{\GetTranslation{section}~\ref{#1}}
\newrefformat{anm}{\GetTranslation{footnote}~\ref{#1}}
\newrefformat{app}{\appendixname~\vref{#1}}
\newrefformat{tab}{\tablename~\vref{#1}}
\newrefformat{fig}{\figurename~\vref{#1}}
\newrefformat{exa}{\GetTranslation{example}~\vref{#1}}

\fi

%% Finis.
