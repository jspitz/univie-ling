%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-thesis
%%
%% BA, MA and PhD Theses in (Applied) Linguistics at the University of Vienna
%%
%% This file is part of the univie-ling LaTeX bundle, consisting of:
%%  -- univie-ling-handout.cls: Class for Handouts
%%  -- univie-ling-expose.cls: Class for PhD Research Proposals (this file)
%%  -- univie-ling-thesis.cls: Class for student papers
%%  -- univie-ling-poster.cls: Class for scientific posters
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

\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesPackage{univie-ling-thesis}[2023/03/31 v.2.4 Univie Linguistic Theses (JSp)]


%% ============================================================
%% CLASS OPTIONS
%% ============================================================

\newif\if@uvt@apa\@uvt@apafalse
\newif\if@uvt@biblatex\@uvt@biblatextrue
\newif\if@uvt@captionp\@uvt@captionptrue
\newif\if@uvt@covington\@uvt@covingtontrue
\newif\if@uvt@draftmark\@uvt@draftmarkfalse
\newif\if@uvt@draftmarkfp\@uvt@draftmarkfpfalse
\newif\if@uvt@fdegree\@uvt@fdegreefalse
\newif\if@uvt@microtype\@uvt@microtypetrue
\newif\if@uvt@multiauthors\@uvt@multiauthorsfalse
\newif\if@uvt@otffonts\@uvt@otffontsfalse
\newif\if@uvt@pdfa\@uvt@pdfafalse
\newif\if@uvt@polyglossia\@uvt@polyglossiafalse
\newif\if@uvt@psfonts\@uvt@psfontstrue
\newif\if@uvt@refsp\@uvt@refsptrue
\newif\if@uvt@usefontenc\@uvt@usefontenctrue
\def\uvt@fontenc{T1}

% Define keys and values
\DeclareKeys[uvt]
{
    % all=<true|false>
    % Load all (most) packages
    all.code:n = 
      { \str_if_eq:NNTF { #1 } { true }
         {
            \@uvt@biblatextrue
            \@uvt@captionptrue
            \@uvt@refsptrue
            \@uvt@covingtontrue
            \@uvt@microtypetrue
         }{
            \@uvt@biblatexfalse
            \@uvt@captionpfalse
            \@uvt@refspfalse
            \@uvt@covingtonfalse
            \@uvt@microtypefalse
         }
      },
    all.default:n = { true },
    all.usage:n = preamble,
    % apa=<true|false>
    % Load APA style
    apa.legacy_if_set:n = @uvt@apa,
    apa.usage:n = preamble,
    % biblatex=<true|false>
    % Load biblatex
    biblatex.legacy_if_set:n = @uvt@biblatex,
    biblatex.usage:n = preamble,
    % caption=<true|false>
    % Load caption
    caption.legacy_if_set:n = @uvt@captionp,
    caption.usage:n = preamble,
    % covington=<true|false>
    % Load covington
    covington.legacy_if_set:n = @uvt@covington,
    covington.usage:n = preamble,
    % fdegree=<true|false>
    % Female degree forms
    fdegree.legacy_if_set:n = @uvt@fdegree,
    fdegree.usage:n = preamble,
    % fontenc=<value|none>
    % customize font encoding
    fontenc.code:n = 
      { \str_if_eq:NNTF { #1 } { none }
         {
           \@uvt@usefontencfalse
         }{
           \def\uvt@fontenc{#1}
         }
      },
    fontenc.usage:n = preamble,
    % microtype=<true|false>
    % Load microtype
    microtype.legacy_if_set:n = @uvt@microtype,
    microtype.usage:n = preamble,
    % pdfa=<true|false>
    % PDF/A
    pdfa.legacy_if_set:n = @uvt@pdfa,
    pdfa.usage:n = preamble,
    % polyglossia=<true|false>
    % Load polyglossia
    polyglossia.code:n = 
      { \str_if_eq:NNTF { #1 } { true }
        {
           \@uvt@psfontsfalse
           \@uvt@otffontstrue
           \@uvt@polyglossiatrue
        }{
           \@uvt@polyglossiafalse
        }
      },
    polyglossia.default:n = { true },
    polyglossia.usage:n = preamble,
    % ref=<true|false>
    % Load varioref and prettyref
    ref.legacy_if_set:n = @uvt@refsp,
    ref.usage:n = preamble,
    % draftmark=<true|false|firstpage>
    % Print draftmark
    draftmark .choice:,
    % true
    draftmark / true .code:n = 
      { \@uvt@draftmarktrue
        \@uvt@draftmarkfpfalse
      },
    % false
    draftmark / false .code:n = 
      { \@uvt@draftmarkfalse
            \@uvt@draftmarkfpfalse
      },
    % firstpage
    draftmark / firstpage .code:n = 
      { \@uvt@draftmarktrue
        \@uvt@draftmarkfptrue
      },
    % no val equals to true
    draftmark .default:n = {true},
    % fonts=<ps|otf|none>
    % Select font scheme
    fonts .choice:,
    % ps: use PostScript fonts (classic LaTeX)
    fonts / ps .code:n = 
      { \@uvt@psfontstrue
        \@uvt@otffontsfalse
      },
    % otf: use OpenType fonts (fontspec)
    fonts / otf .code:n = 
      { \@uvt@psfontsfalse
        \@uvt@otffontstrue
      },
    % none: Use no font package
    fonts / none .code:n = 
      { \@uvt@psfontsfalse
        \@uvt@otffontsfalse
      },
}

% Process
\ProcessKeyOptions[uvt]


%% ============================================================
%% BASE CLASS:
%% ============================================================

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

\RequirePackage{translator}
\languagealias{naustrian}{German}
\deftranslation[to=German]{draft}{ENTWURF}
\deftranslation[to=English]{draft}{DRAFT}
\deftranslation[to=German]{chapter}{Kapitel}
\deftranslation[to=English]{chapter}{chapter}
\deftranslation[to=German]{section}{Abschnitt}
\deftranslation[to=English]{section}{section}
\deftranslation[to=German]{footnote}{Anm.}
\deftranslation[to=English]{footnote}{fn.}
\deftranslation[to=German]{example}{Beispiel}
\deftranslation[to=English]{example}{example}
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

\if@uvt@psfonts
  \RequirePackage[T1]{fontenc}
  \if@uvt@usefontenc
    \RequirePackage[\uvt@fontenc]{fontenc}
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

\if@uvt@otffonts
  \RequirePackage{fontspec}
  \setmainfont{Palatino}
  \setsansfont{Arial}
  \setmonofont{SourceCodePro}
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
    \if@uvt@fdegree
        \def\@degree{\csuse{degree@#1@f}}
    \else
        \def\@degree{\csuse{degree@#1}}
    \fi
    \Ifstr{#1}{bachelor}{%
      \KOMAoptions{fontsize=12pt}%
      \RequirePackage{geometry}
      \geometry{tmargin=3cm, bmargin=3cm, lmargin=3cm, rmargin=3cm, footskip=1.5cm}
    }{}
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

\RequirePackage{setspace}
\onehalfspacing

% Header and pagination:
% (scrlayer-scrpage)
\RequirePackage{scrlayer-scrpage}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\RequirePackage{scrlayer-scrpage}
\renewcommand{\headfont}{\small\rmfamily}
\clearmainofpairofpagestyles
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
\if@uvt@microtype
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
  \newgeometry{top=2cm,bottom=2.5cm,left=2.5cm,right=2cm}
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
  \else
    \def\and{%
      \end{tabular}%
      \global\@uvt@multiauthorstrue%
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
         {\usekomafont{thesistype}\MakeUppercase{\@thesistype\,/\,\hskip\z@skip\mbox{\@thesistype@en}}\par}
       \end{center}
      \vspace{2\baselineskip}
      \begin{center}
    {\usekomafont{tpcaption}Titel der \@thesistype\,/\,Title of the \@thesistype@en\par}
    {\ifx\@title\@empty\else
           \usekomafont{title}{\enquote{\@title%
            \ifx\@subtitle\@empty\else\linebreak\@subtitle\fi}\par}%
         \fi
        }%
        {\ifx\@volume\@empty\else%
            \vskip 1em\usekomafont{baende}{Band \@volume\ von \@volumes\ B\"anden\,/\,volume \@volume\ of \@volumes\ volumes}%
         \fi%
        }%
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

\newcommand\makedeclaration{%
\def\and{%
      \end{tabular}%
      \hskip 1em \@plus.17fil%
      \begin{tabular}[t]{c}%
      \hline
    }%
\clearpage
\thispagestyle{plain}%
\section*{\translate{erkl}}

\if@uvt@multiauthors
  \translate{selbst1p}
\else
  \translate{selbst1s}
\fi

\translate{selbst2}

\if@uvt@multiauthors
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
\let\@uvt@save@quote\quote
\renewcommand*{\quote}{\@uvt@save@quote\small}

% Quotation (smaller)
\let\@uvt@save@quotation\quotation
\renewcommand*{\quotation}{\@uvt@save@quotation\small}

% Description (normal italic)
\setkomafont{descriptionlabel}{\normalfont\itshape}

\if@uvt@covington
  \RequirePackage{covington}
  \renewcommand{\p@equation}[1]{(#1)}
\fi

%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

%% captionlabel bold
\setkomafont{captionlabel}{\bfseries}

\if@uvt@captionp
   \RequirePackage[format=plain,
               justification=RaggedRight,
               singlelinecheck=false
              ]{caption}
\fi


%% =============================================================
%% PDF-A:
%% =============================================================

\if@uvt@pdfa
  \RequirePackage[a-1b]{pdfx}
  \hypersetup{pdfborder={0 0 0}}
\fi

%% =============================================================
%% POLYGLOSSIA:
%% =============================================================

\if@uvt@polyglossia
  \if@uvt@captionp
    \RequirePackage{ragged2e}
  \fi
  \RequirePackage{polyglossia}
\fi

%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\if@uvt@biblatex

\if@uvt@apa
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

% End of @uvt@apa condition
\fi

% End of @uvt@biblatex condition
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

\if@uvt@refsp

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
  \newrefformat{cha}{\translate{chapter}~\vref{#1}}
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

\if@uvt@draftmark

  \if@uvt@draftmarkfp
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
