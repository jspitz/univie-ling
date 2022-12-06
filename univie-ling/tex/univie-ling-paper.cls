%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-paper
%%
%% Student Papers in (Applied) Linguistics at the University of Vienna
%%
%% This file is part of the univie-ling LaTeX bundle, consisting of:
%%  -- univie-ling-handout.cls: Class for Handouts
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
\ProvidesPackage{univie-ling-paper}[2022/10/21 v.2.1 Univie Linguistic Papers (JSp)]


%% ============================================================
%% CLASS OPTIONS
%% ============================================================

\newif\if@uvp@biblatex\@uvp@biblatextrue
\newif\if@uvp@apa\@uvp@apafalse
\newif\if@uvp@captionp\@uvp@captionptrue
\newif\if@uvp@draftmark\@uvp@draftmarkfalse
\newif\if@uvp@draftmarkfp\@uvp@draftmarkfpfalse
\newif\if@uvp@refsp\@uvp@refsptrue
\newif\if@uvp@covington\@uvp@covingtontrue
\newif\if@uvp@microtype\@uvp@microtypetrue
\newif\if@uvp@multiauthors\@uvp@multiauthorsfalse
\newif\if@uvp@polyglossia\@uvp@polyglossiafalse
\newif\if@uvp@psfonts\@uvp@psfontstrue
\newif\if@uvp@otffonts\@uvp@otffontsfalse
\newif\if@uvp@usefontenc\@uvp@usefontenctrue
\def\uvp@fontenc{T1}

% We use l3keys here since (1) LaTeX2e keys are rather
% new and (2) do not provide for choice keys yet.
\ExplSyntaxOn
\keys_define:nn { uvp }
{
    % all=<true|false>
    % Load all (most) packages
    all.code:n = 
      { \str_if_eq:NNTF { #1 } { true }
         {
            \@uvp@biblatextrue
            \@uvp@captionptrue
            \@uvp@refsptrue
            \@uvp@covingtontrue
            \@uvp@microtypetrue
         }{
            \@uvp@biblatexfalse
            \@uvp@captionpfalse
            \@uvp@refspfalse
            \@uvp@covingtonfalse
            \@uvp@microtypefalse
         }
      },
    all.usage:n = preamble,
    % apa=<true|false>
    % Load APA style
    apa.legacy_if_set:n = @uvp@apa,
    apa.usage:n = preamble,
    % biblatex=<true|false>
    % Load biblatex
    biblatex.legacy_if_set:n = @uvp@biblatex,
    biblatex.usage:n = preamble,
    % caption=<true|false>
    % Load caption
    caption.legacy_if_set:n = @uvp@captionp,
    caption.usage:n = preamble,
    % covington=<true|false>
    % Load covington
    covington.legacy_if_set:n = @uvp@covington,
    covington.usage:n = preamble,
    % fontenc=<value|none>
    % customize font encoding
    fontenc.code:n = 
      { \str_if_eq:NNTF { #1 } { none }
         {
           \@uvp@usefontencfalse
         }{
           \def\uvp@fontenc{#1}
         }
      },
    fontenc.usage:n = preamble,
    % microtype=<true|false>
    % Load microtype
    microtype.legacy_if_set:n = @uvp@microtype,
    microtype.usage:n = preamble,
    % polyglossia=<true|false>
    % Load polyglossia
    polyglossia.code:n = 
      { \str_if_eq:NNTF { #1 } { true }
        {
           \@uvp@psfontsfalse
           \@uvp@otffontstrue
           \@uvp@polyglossiatrue
        }{
           \@uvp@polyglossiafalse
        }
      },
    polyglossia.usage:n = preamble,
    % ref=<true|false>
    % Load varioref and prettyref
    ref.legacy_if_set:n = @uvp@refsp,
    ref.usage:n = preamble,
    % draftmark=<true|false|firstpage>
    % Print draftmark
    draftmark .choice:,
    % true
    draftmark / true .code:n = 
      { \@uvp@draftmarktrue
        \@uvp@draftmarkfpfalse
      },
    % false
    draftmark / false .code:n = 
      { \@uvp@draftmarkfalse
        \@uvp@draftmarkfpfalse
      },
    % firstpage
    draftmark / firstpage .code:n = 
      { \@uvp@draftmarktrue
        \@uvp@draftmarkfptrue
      },
    % no val equals to true
    draftmark .default:n = {true},
    % fonts=<ps|otf|none>
    % Select font scheme
    fonts .choice:,
    % ps: use PostScript fonts (classic LaTeX)
    fonts / ps .code:n = 
      { \@uvp@psfontstrue
        \@uvp@otffontsfalse
      },
    % otf: use OpenType fonts (fontspec)
    fonts / otf .code:n = 
      { \@uvp@psfontsfalse
        \@uvp@otffontstrue
      },
    % none: Use no font package
    fonts / none .code:n = 
      { \@uvp@psfontsfalse
        \@uvp@otffontsfalse
      },
}
\ExplSyntaxOff

% Process

\IfFormatAtLeastTF{2022-06-01}
{
  \ProcessKeyOptions[uvp]
}{
  \RequirePackage{l3keys2e}
  \ProcessKeysOptions{uvp}
}


%% ============================================================
%% BASE CLASS:
%% ============================================================

\LoadClass[%
       a4paper,
       fontsize=12pt,
       BCOR=0mm,
       captions=tableheading,
       listof=totoc,
       numbers=noenddot,
       titlepage=true,
       sectionentrydots=true
]{scrartcl}[2003/04/22]


%% ============================================================
%% LOCALIZATION:
%% ============================================================

\RequirePackage{translator}
\languagealias{naustrian}{German}
\deftranslation[to=German]{draft}{ENTWURF}
\deftranslation[to=English]{draft}{DRAFT}
\deftranslation[to=German]{subm}{Abgegeben am}
\deftranslation[to=English]{subm}{Submission date:}
\deftranslation[to=German]{submto}{bei}
\deftranslation[to=English]{submto}{Instructor:}
\deftranslation[to=German]{author}{Verfasst von}
\deftranslation[to=English]{author}{Author}
\deftranslation[to=German]{section}{Abschnitt}
\deftranslation[to=English]{section}{section}
\deftranslation[to=German]{footnote}{Anm.}
\deftranslation[to=English]{footnote}{fn.}
\deftranslation[to=German]{example}{Beispiel}
\deftranslation[to=English]{example}{example}
\deftranslation[to=German]{matnr}{Matrikelnummer}
\deftranslation[to=English]{matnr}{Matrikelnummer}
\deftranslation[to=German]{stkz}{Studienkennzahl}
\deftranslation[to=English]{stkz}{Studienkennzahl}
\deftranslation[to=German]{erkl}{Erkl\"arung}
\deftranslation[to=English]{erkl}{Declaration}
\deftranslation[to=German]{selbst1s}{Hiermit versichere ich, dass ich die vorliegende Arbeit selbst\"andig verfasst
und keine anderen als die angegebenen Hilfsmittel benutzt habe.}
\deftranslation[to=German]{selbst1p}{Hiermit versichern wir, dass wir die vorliegende Arbeit selbst\"andig verfasst
und keine anderen als die angegebenen Hilfsmittel benutzt haben.}
\deftranslation[to=German]{selbst2}{Die Stellen der Arbeit, die anderen Quellen im Wortlaut oder dem Sinn nach entnommen wurden, sind durch Herkunftsangaben kenntlich gemacht.
Dies gilt auch f\"ur Zeichnungen, Skizzen, bildliche Darstellungen sowie f\"ur Quellen aus dem Internet.}
\deftranslation[to=German]{selbst3s}{Ich versichere ferner, dass ich die vorliegende Arbeit weder ganz noch in Teilen bereits als
Pr\"ufungsleistung vorgelegt habe.}
\deftranslation[to=German]{selbst3p}{Wir versichern ferner, dass wir die vorliegende Arbeit weder ganz noch in Teilen bereits als
Pr\"ufungsleistung vorgelegt haben.}
\deftranslation[to=English]{selbst1s}{I hereby declare that this paper is entirely my own work and that I used no source material or aids other than those stipulated.}
\deftranslation[to=English]{selbst1p}{We hereby declare that this paper is entirely our own work and that we used no source material or aids other than those stipulated.}
\deftranslation[to=English]{selbst2}{No part of it has been copied from any work produced by any other person or copied from any other source without reference to the source.
This includes all drawings, sketches, graphics and internet sources.}
\deftranslation[to=English]{selbst3s}{Furthermore, I declare that this paper has not been submitted as an examination already, neither as a whole nor in parts.}
\deftranslation[to=English]{selbst3p}{Furthermore, we declare that this paper has not been submitted as an examination already, neither as a whole nor in parts.}
\deftranslation[to=German]{wien}{Wien}
\deftranslation[to=English]{wien}{Vienna}


%% ============================================================
%% FONTS AND EMPHASIZING:
%% ============================================================

\if@uvp@psfonts

  \if@uvp@usefontenc
    \RequirePackage[\uvp@fontenc]{fontenc}
  \fi

  % Palatino
  \RequirePackage[osf]{mathpazo}

  % Arial or Helvetica
  \IfFileExists{uarial.sty}{%
    \RequirePackage{uarial}
  }{%
    \RequirePackage{helvet}
  }

  % Source Code Pro (Courier)
  \RequirePackage[scale=.93]{sourcecodepro}

\fi

\if@uvp@otffonts
  \RequirePackage{fontspec}
  \setmainfont{Palatino}
  \setsansfont{Arial}
  \setmonofont{SourceCodePro}
\fi

% Hyperlinks
\RequirePackage{url}
\newcommand{\urlprefix}{}
% URLs italic
\def\UrlFont{\rmfamily\itshape}

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
    \if@uvp@customtexttype\else\def\@texttype{\csuse{texttype@#1}}\fi%
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
\newif\if@uvp@customtexttype\@uvp@customtexttypefalse
\newcommand\texttype[1]{\def\@texttype{#1}\@uvp@customtexttypetrue}
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

\RequirePackage{setspace}
\onehalfspacing

% Header and pagination:
% (scrlayer-scrpage)
\RequirePackage{scrlayer-scrpage}
\pagestyle{scrplain}

% Margins
\RequirePackage{geometry}
\geometry{tmargin=3cm, bmargin=3cm, lmargin=3cm, rmargin=3cm, footskip=1.5cm}

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
\if@uvp@microtype
   \RequirePackage{microtype}
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
      \global\@uvp@multiauthorstrue%
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
         {\usekomafont{texttype}\MakeUppercase{\@texttype}\par}
       \end{center}
      \vspace{2\baselineskip}
      \begin{center}
        \ifx\@subject\@empty \else
          {\usekomafont{subject}{\@subject\par}}%
          \vskip 3em
        \fi
        {\ifx\@title\@empty\else
           \usekomafont{title}{\enquote{\@title%
            \ifx\@subtitle\@empty\else\linebreak\@subtitle\fi}\par}%
         \fi
        }%
        {\ifx\@course\@empty\else\vskip 2em%
            \usekomafont{course}{\lectypeverb\par\emph{\@course}\par(\lecsemshort~\@semester)\par}%
         \fi%
        }%
        \vskip 2em
        {%
          \translate{author}\par
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
             \translate{matnr}:~
          }%
          \usekomafont{date}{%
            \begin{tabular}[t]{c}
              Matrikelnummer: \@matrikelnr
            \end{tabular}\par
            \def\and{%
              \end{tabular}%
              \hskip 1em \@plus.17fil%
              \begin{tabular}[t]{c}%
              \translate{stkz}:~
            }%
            \lineskip 0.75em%
            \begin{tabular}[t]{c}
              Studienkennzahl: \@studienkennzahl
            \end{tabular}\par
          }%
        }%
        \vfill
        {\usekomafont{date}{\translate{subm} \@date \par}}%
        {\ifx\@instructor\@empty\else\usekomafont{date}{\translate{submto} \@instructor\par}\fi}%
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
\section*{\translate{erkl}}

\if@uvp@multiauthors
  \translate{selbst1p}
\else
  \translate{selbst1s}
\fi

\translate{selbst2}

\if@uvp@multiauthors
  \translate{selbst3p}
\else
  \translate{selbst3s}
\fi

\bigskip
\bgroup
\raggedleft
\translate{wien}, \today

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
\let\@uvp@save@quote\quote
\renewcommand*{\quote}{\@uvp@save@quote\small}

% Quotation (smaller)
\let\@uvp@save@quotation\quotation
\renewcommand*{\quotation}{\@uvp@save@quotation\small}

% Description (normal italic)
\setkomafont{descriptionlabel}{\normalfont\itshape}

\if@uvp@covington
  \RequirePackage{covington}
  \renewcommand{\p@equation}[1]{(#1)}
\fi

%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

%% captionlabel bold
\setkomafont{captionlabel}{\bfseries}

\if@uvp@captionp
    \RequirePackage[format=plain,
                justification=RaggedRight,
                singlelinecheck=false
               ]{caption}
\fi

%% =============================================================
%% POLYGLOSSIA:
%% =============================================================

\if@uvp@polyglossia
  \if@uvp@captionp
    \RequirePackage{ragged2e}
  \fi
  \RequirePackage{polyglossia}
\fi

%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\if@uvp@biblatex

\if@uvp@apa
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

% End of @uvp@apa condition
\fi

% End of @uvp@biblatex condition
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

\if@uvp@refsp

\AtBeginDocument{%
 % Varioref:
 \RequirePackage{varioref}
  \vref@addto\extrasnaustrian{%
    \def\reftextafter{auf der \reftextvario{folgenden}{n\"achsten} Seite}%
    \def\reftextfaceafter{auf der gegen\"uberliegenden Seite}%
    \def\reftextbefore{auf der \reftextvario{vorhergehenden}{vorangegangenen} Seite}%
    \def\reftextfacebefore{auf der gegen\"uberliegenden Seite}%
    \def\reftextfaraway#1{auf S.~\pageref{#1}}%
    \def\reftextpagerange#1#2{auf S.~\pageref{#1}--\pageref{#2}}%
  }%
  % Prettyref:
  % (varioref-Befehle mit eingebunden)
  \RequirePackage{prettyref}
  \newrefformat{sec}{\translate{section}~\ref{#1}}
  \newrefformat{sub}{\translate{section}~\ref{#1}}
  \newrefformat{anm}{\translate{footnote}~\ref{#1}}
  \newrefformat{app}{\appendixname~\vref{#1}}
  \newrefformat{tab}{\tablename~\vref{#1}}
  \newrefformat{fig}{\figurename~\vref{#1}}
  \newrefformat{exa}{\translate{example}~\vref{#1}}
}

\fi


%% =============================================================
%% DRAFT:
%% =============================================================

\if@uvp@draftmark

\if@uvp@draftmarkfp
  \RequirePackage[firstpageonly]{draftwatermark}
\else
  \RequirePackage{draftwatermark}
\fi

\DraftwatermarkOptions{%
  angle=0,
  vpos=10pt,
  anchor=ct,
  fontsize=14pt,
  text={\translate{draft} (\today)}
}

\fi

%% Finis.
