%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-paper
%%
%% Student Papers in (Applied) Linguistics at the University of Vienna
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
\ProvidesPackage{univie-ling-paper}[2019/01/21 v1.9 Univie Linguistic Papers (JSp)]

\RequirePackage{xkeyval}

\newif\ifbiblatex\biblatextrue
\newif\ifapa\apafalse
\newif\ifcaptionp\captionptrue
\newif\ifrefsp\refsptrue
\newif\ifcovington\covingtontrue
\newif\ifmicrotype\microtypetrue
\newif\ifmultiauthors\multiauthorsfalse

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
    \ClassWarning{univie-ling-paper}{unknown 'all' value}%
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
    \ClassWarning{univie-ling-paper}{unknown biblatex value}%
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
    \ClassWarning{univie-ling-paper}{unknown caption value}%
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
    \ClassWarning{univie-ling-paper}{unknown ref value}%
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
    \ClassWarning{univie-ling-paper}{unknown covington value}%
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
	   sectionentrydots=true
]{scrartcl}[2003/04/22]


%% ============================================================
%% LOCALIZATION:
%% ============================================================

\RequirePackage{translations}
\DeclareTranslation{German}{subm}{Abgegeben am}
\DeclareTranslation{English}{subm}{Submission date:}
\DeclareTranslation{German}{submto}{bei}
\DeclareTranslation{English}{submto}{Instructor:}
\DeclareTranslation{German}{author}{Verfasst von}
\DeclareTranslation{English}{author}{Author}
\DeclareTranslation{German}{section}{Abschnitt}
\DeclareTranslation{English}{section}{section}
\DeclareTranslation{German}{footnote}{Anm.}
\DeclareTranslation{English}{footnote}{fn.}
\DeclareTranslation{German}{example}{Beispiel}
\DeclareTranslation{English}{footnote}{example}
\DeclareTranslation{German}{matnr}{Matrikelnummer}
\DeclareTranslation{English}{matnr}{Matrikelnummer}
\DeclareTranslation{German}{stkz}{Studienkennzahl}
\DeclareTranslation{English}{stkz}{Studienkennzahl}
\DeclareTranslation{German}{erkl}{Erkl\"arung}
\DeclareTranslation{English}{erkl}{Declaration}
\DeclareTranslation{German}{selbst1s}{Hiermit versichere ich, dass ich die vorliegende Arbeit selbst\"andig verfasst
und keine anderen als die angegebenen Hilfsmittel benutzt habe.}
\DeclareTranslation{German}{selbst1p}{Hiermit versichern wir, dass wir die vorliegende Arbeit selbst\"andig verfasst
und keine anderen als die angegebenen Hilfsmittel benutzt haben.}
\DeclareTranslation{German}{selbst2}{Die Stellen der Arbeit, die anderen Quellen im Wortlaut oder dem Sinn nach entnommen wurden, sind durch Herkunftsangaben kenntlich gemacht.
Dies gilt auch f\"ur Zeichnungen, Skizzen, bildliche Darstellungen sowie f\"ur Quellen aus dem Internet.}
\DeclareTranslation{German}{selbst3s}{Ich versichere ferner, dass ich die vorliegende Arbeit weder ganz noch in Teilen bereits als
Pr\"ufungsleistung vorgelegt habe.}
\DeclareTranslation{German}{selbst3p}{Wir versichern ferner, dass wir die vorliegende Arbeit weder ganz noch in Teilen bereits als
Pr\"ufungsleistung vorgelegt haben.}
\DeclareTranslation{English}{selbst1s}{I hereby declare that this paper is entirely my own work and that I used no source material or aids other than those stipulated.}
\DeclareTranslation{English}{selbst1p}{We hereby declare that this paper is entirely our own work and that we used no source material or aids other than those stipulated.}
\DeclareTranslation{English}{selbst2}{No part of it has been copied from any work produced by any other person or copied from any other source without reference to the source.
This includes all drawings, sketches, graphics and internet sources.}
\DeclareTranslation{English}{selbst3s}{Furthermore, I declare that this paper has not been submitted as an examination already, neither as a whole nor in parts.}
\DeclareTranslation{English}{selbst3p}{Furthermore, we declare that this paper has not been submitted as an examination already, neither as a whole nor in parts.}
\DeclareTranslation{German}{wien}{Wien}
\DeclareTranslation{English}{wien}{Vienna}


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
\newkomafont{texttype}{\fontsize{24}{26pt}\bfseries\sffamily}
\setkomafont{title}{\fontsize{18}{20pt}\sffamily}
\setkomafont{author}{\fontsize{18}{20pt}\sffamily}
\setkomafont{subtitle}{\normalfont\fontsize{12}{14pt}\sffamily}
\setkomafont{date}{\normalfont\fontsize{10}{12pt}\mdseries\sffamily}
\newkomafont{course}{\normalfont\mdseries\sffamily}


%% ============================================================
%% MACROS:
%% ============================================================

\def\lectype{}
\def\lectypeverb{}
\def\@texttype{}

\define@key{lec}{lectype}{%
  \AtEndPreamble{%
    \ifcsundef{lectype@#1}{%
       \ClassError{univie-ling-paper}{Lecture type '#1' is not defined!}{%
             Please consult the package manual for instructions how to define it}{}
    }{}
    \def\lectype{\csuse{lectype@#1}}%
    \def\lectypeverb{\csuse{lectypeverb@#1}}%
    \def\@texttype{\csuse{texttype@#1}}
  }%
}

\define@key{lec}{lecsem}{%
  \AtEndPreamble{%
    \ifcsundef{lecsemshort@#1}{%
       \ClassError{univie-ling-paper}{Semester type '#1' is not defined!}{%
             Please consult the package manual for instructions how to define it}{}
    }{}
    \def\lecsemshort{\csuse{lecsemshort@#1}}%
    \def\lecsemverb{\csuse{lecsemverb@#1}}%
  }%
}

\def\@texttype{Seminararbeit}
\newcommand\texttype[1]{\def\@texttype{#1}}
\def\@course{}
\newcommand\course[2]{\setkeys{lec}{lectype=#1}\def\@course{#2}}
\def\@instructor{}
\newcommand\instructor[1]{\def\@instructor{#1}}
\def\@matrikelnr{}
\newcommand\matrikelnr[1]{\def\@matrikelnr{#1}}
\def\@studienkennzahl{}
\newcommand\studienkennzahl[1]{\def\@studienkennzahl{#1}}
\def\@semester{}
\newcommand\semester[2]{\setkeys{lec}{lecsem=#1}\def\@semester{#2}}

% Semantic markup
\newcommand\Expression[1]{\textit{#1}}
\newcommand\Concept[1]{\textsc{#1}}
\newcommand\Meaning[1]{\enquote*{#1}}


%% ============================================================
%% STRINGS:
%% ============================================================

% 1) Course types
%
% vo
\def\lectypeverb@vo{Vorlesung}
\def\lectype@vo{VO}
\def\texttype@vo{}
% ps
\def\lectypeverb@ps{Proseminar}
\def\lectype@ps{PS}
\def\texttype@ps{Proseminararbeit}
% se
\def\lectypeverb@se{Seminar}
\def\lectype@se{SE}
\def\texttype@ps{Seminararbeit}
% ue
\def\lectypeverb@ue{\"Ubung}
\def\lectype@ue{UE}
\def\texttype@ue{}
% ko
\def\lectypeverb@ko{Kolloquium}
\def\lectype@ko{KO}
\def\texttype@ko{}
% pv
\def\lectypeverb@pv{Privatissimum}
\def\lectype@pv{PV}
\def\texttype@pv{}

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

\usepackage{setspace}
\onehalfspacing

% Header and pagination:
% (scrlayer-scrpage)
\RequirePackage{scrlayer-scrpage}
\pagestyle{scrplain}

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
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
  \else
    \def\and{%
      \end{tabular}%
      \global\multiauthorstrue%
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
      \ifx\@extratitle\@empty \else
        \noindent\@extratitle\next@tdpage
      \fi
      \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
       \begin{flushright}
         \includegraphics[width=6cm]{univielogo-sw}
       \end{flushright}
         \vspace{2\baselineskip}
       \begin{center}
         \bgroup\usekomafont{texttype}{\MakeUppercase{\@texttype}\par}\egroup
       \end{center}
      \vspace{2\baselineskip}
      \begin{center}
        \ifx\@subject\@empty \else
          {\usekomafont{subject}{\@subject\par}}%
          \vskip 3em
        \fi
        {\usekomafont{title}{\enquote{\@title%
         \ifx\@subtitle\@empty\else\\\@subtitle\fi}\par}}%
        {\ifx\@course\@empty\else\vskip 2em\usekomafont{course}{\lectypeverb\par\emph{\@course}\par(\lecsemshort~\@semester)\par}\fi}%
        \vskip 2em
        {%
          \GetTranslation{author}\par
          \usekomafont{author}{%
            \lineskip 0.75em%
            \begin{tabular}[t]{c}
              \@author
            \end{tabular}\par
          }%
          \def\and{%
            \end{tabular}%
            \hskip 1em \@plus.17fil%
            \begin{tabular}[t]{c}%
             \GetTranslation{matnr}:~
          }%
          \usekomafont{date}{%
            \begin{tabular}[t]{c}
              Matrikelnummer: \@matrikelnr
            \end{tabular}\par
            \def\and{%
              \end{tabular}%
              \hskip 1em \@plus.17fil%
              \begin{tabular}[t]{c}%
              \GetTranslation{stkz}:~
            }%
            \lineskip 0.75em%
            \begin{tabular}[t]{c}
              Studienkennzahl: \@studienkennzahl
            \end{tabular}\par
          }%
        }%
        \vfill
        {\usekomafont{date}{\GetTranslation{subm} \@date \par}}%
        {\ifx\@instructor\@empty\else\usekomafont{date}{\GetTranslation{submto} \@instructor\par}\fi}%
      \end{center}\par
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
}%

\newcommand\makedeclaration{%
\def\and{%
      \end{tabular}%
      \hskip 1em \@plus.17fil%
      \begin{tabular}[t]{c}%
      \hline
    }%
\clearpage
\section*{\GetTranslation{erkl}}

\ifmultiauthors
\GetTranslation{selbst1p}
\else
\GetTranslation{selbst1s}
\fi

\GetTranslation{selbst2}

\ifmultiauthors
\GetTranslation{selbst3p}
\else
\GetTranslation{selbst3s}
\fi

\bigskip
\bgroup
\raggedleft
\GetTranslation{wien}, \today

\vspace{15mm}

\begin{tabular}[t]{c}
    \hline
    \@author
\end{tabular}\par
\egroup
\clearpage
\global\let\and\relax
}


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
\newrefformat{sec}{\GetTranslation{section}~\ref{#1}}
\newrefformat{sub}{\GetTranslation{section}~\ref{#1}}
\newrefformat{anm}{\GetTranslation{footnote}~\ref{#1}}
\newrefformat{app}{\appendixname~\vref{#1}}
\newrefformat{tab}{\tablename~\vref{#1}}
\newrefformat{fig}{\figurename~\vref{#1}}
\newrefformat{exa}{\GetTranslation{example}~\vref{#1}}

\fi

%% Finis.
