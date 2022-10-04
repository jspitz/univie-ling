%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-expose
%%
%% PhD Research Proposals in (Applied) Linguistics at the University of Vienna
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
\ProvidesPackage{univie-ling-expose}[2022/10/04 v.2.1dev Univie Linguistic Exposes (JSp)]


%% ============================================================
%% CLASS OPTIONS
%% ============================================================

\newif\if@uve@biblatex\@uve@biblatextrue
\newif\if@uve@apa\@uve@apafalse
\newif\if@uve@captionp\@uve@captionptrue
\newif\if@uve@draftmark\@uve@draftmarkfalse
\newif\if@uve@draftmarkfp\@uve@draftmarkfpfalse
\newif\if@uve@refsp\@uve@refsptrue
\newif\if@uve@covington\@uve@covingtontrue
\newif\if@uve@microtype\@uve@microtypetrue
\newif\if@uve@polyglossia\@uve@polyglossiafalse
\newif\if@uve@psfonts\@uve@psfontstrue
\newif\if@uve@otffonts\@uve@otffontsfalse
\newif\if@uve@usefontenc\@uve@usefontenctrue
\def\uve@fontenc{T1}

% We use l3keys here since (1) LaTeX2e keys are rather
% new and (2) do not provide for choice keys yet.
\ExplSyntaxOn
\keys_define:nn { uve }
{
	% all=<true|false>
	% Load all (most) packages
	all.code:n = 
	  { \bool_if:nTF {#1} {
	        \@uve@biblatextrue
                \@uve@captionptrue
                \@uve@refsptrue
                \@uve@covingtontrue
                \@uve@microtypetrue
             }{
                \@uve@biblatexfalse
                \@uve@captionpfalse
                \@uve@refspfalse
                \@uve@covingtonfalse
                \@uve@microtypefalse
             }
          },
	all.usage:n = preamble,
	% apa=<true|false>
	% Load APA style
	apa.legacy_if_set:n = @uve@apa,
	apa.usage:n = preamble,
	% biblatex=<true|false>
	% Load biblatex
	biblatex.legacy_if_set:n = @uve@biblatex,
	biblatex.usage:n = preamble,
	% caption=<true|false>
	% Load caption
	caption.legacy_if_set:n = @uve@captionp,
	caption.usage:n = preamble,
	% covington=<true|false>
	% Load covington
	covington.legacy_if_set:n = @uve@covington,
	covington.usage:n = preamble,
	% fontenc=<value|none>
	% customize font encoding
	fontenc.code:n = 
	  { \str_if_eq:NNTF { #1 } { none } {
	       \@uve@usefontencfalse
             }{
               \def\uve@fontenc{#1}
             }
          },
	fontenc.usage:n = preamble,
	% microtype=<true|false>
	% Load microtype
	microtype.legacy_if_set:n = @uve@microtype,
	microtype.usage:n = preamble,
	% polyglossia=<true|false>
	% Load polyglossia
	polyglossia.legacy_if_set:n = @uve@polyglossia,
	polyglossia.code:n = 
	  { \bool_if:nT {#1} {
	       \@uve@psfontsfalse
               \@uve@otffontstrue
             }
          },
	polyglossia.usage:n = preamble,
	% ref=<true|false>
	% Load varioref and prettyref
	ref.legacy_if_set:n = @uve@refsp,
	ref.usage:n = preamble,
	% draftmark=<true|false|firstpage>
	% Print draftmark
	draftmark .choice:,
	% true
	draftmark / true .code:n = 
	  { \@uve@draftmarktrue
            \@uve@draftmarkfpfalse
          },
        % false
	draftmark / false .code:n = 
	  { \@uve@draftmarkfalse
            \@uve@draftmarkfpfalse
          },
        % firstpage
	draftmark / firstpage .code:n = 
	  { \@uve@draftmarktrue
            \@uve@draftmarkfptrue
          },
        % no val equals to true
        draftmark .default:n = {true},
        % fonts=<ps|otf|none>
        % Select font scheme
	fonts .choice:,
	% ps: use PostScript fonts (classic LaTeX)
	fonts / ps .code:n = 
	  { \@uve@psfontstrue
            \@uve@otffontsfalse
          },
        % otf: use OpenType fonts (fontspec)
	fonts / otf .code:n = 
	  { \@uve@psfontsfalse
            \@uve@otffontstrue
          },
        % none: Use no font package
	fonts / none .code:n = 
	  { \@uve@psfontsfalse
            \@uve@otffontsfalse
          },
}
\ExplSyntaxOff

% Process

\IfFormatAtLeastTF{2022-06-01}
{
  \ProcessKeyOptions[uve]
}{
  \RequirePackage{l3keys2e}
  \ProcessKeysOptions{uve}
}


%% ============================================================
%% BASE CLASS:
%% ============================================================

\LoadClass[%
	   a4paper,
	   fontsize=12pt,
	   captions=tableheading,
	   listof=totoc,
	   numbers=noenddot,
	   titlepage=true,
	   sectionentrydots=true
]{scrartcl}[2003/04/22]

\RequirePackage{array}

%% ============================================================
%% LOCALIZATION:
%% ============================================================

\RequirePackage{translator}
\languagealias{naustrian}{German}
\deftranslation[to=German]{draft}{ENTWURF}
\deftranslation[to=English]{draft}{DRAFT}
\deftranslation[to=German]{section}{Abschnitt}
\deftranslation[to=English]{section}{section}
\deftranslation[to=German]{footnote}{Anm.}
\deftranslation[to=English]{footnote}{fn.}
\deftranslation[to=German]{example}{Beispiel}
\deftranslation[to=English]{example}{example}
\deftranslation[to=German]{stkz}{Studienkennzahl lt. Studienblatt}
\deftranslation[to=English]{stkz}{Degree programme code as it appears on the student record sheet}
\deftranslation[to=German]{strt}{Studienrichtung lt. Studienblatt}
\deftranslation[to=English]{strt}{Degree programme as it appears on the student record sheet}
\deftranslation[to=German]{expo}{Expos\'e zum Dissertationsprojekt}
\deftranslation[to=English]{expo}{Research Proposal}
\deftranslation[to=German]{tpcaption}{Titel des Dissertationsprojekts}
\deftranslation[to=English]{tpcaption}{Title of the Dissertation Project}
\deftranslation[to=German]{author}{Verfasst von}
\deftranslation[to=English]{author}{Submitted by}
\deftranslation[to=German]{vienna}{Wien}
\deftranslation[to=English]{vienna}{Vienna}
\deftranslation[to=German]{supervisor}{Betreut von}
\deftranslation[to=English]{supervisor}{Supervisor}
\deftranslation[to=German]{cosupervisor}{Mitbetreut von}
\deftranslation[to=English]{cosupervisor}{Co-Supervisor}
\deftranslation[to=German]{beirat}{Beirat}
\deftranslation[to=English]{beirat}{Advisory board}


%% ============================================================
%% FONTS AND EMPHASIZING:
%% ============================================================

\if@uve@psfonts

\if@uve@usefontenc
  \RequirePackage[\uve@fontenc]{fontenc}
\fi

% Times
\RequirePackage{mathptmx}

% Arial or Helvetica
\IfFileExists{uarial.sty}{%
\RequirePackage{uarial}
}{%
\RequirePackage{helvet}
}

% Source Code Pro (Courier)
\RequirePackage[scale=.93]{sourcecodepro}

\fi

\if@uve@otffonts
  \RequirePackage{fontspec}
  \setmainfont{Times New Roman}
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
\newkomafont{thesistype}{\fontsize{18}{20pt}\bfseries\sffamily}
\setkomafont{title}{\fontsize{18}{20pt}\sffamily}
\setkomafont{author}{\fontsize{18}{20pt}\large\sffamily}
\setkomafont{date}{\normalfont\fontsize{11}{13pt}\mdseries\sffamily}
\newkomafont{tpcaption}{\fontsize{11}{13pt}\sffamily}
\newkomafont{codes}{\fontsize{10}{12pt}\sffamily}
\setkomafont{sectionentry}{\normalsize}


%% ============================================================
%% MACROS:
%% ============================================================

\def\@dirtype{}
\def\@dirtype@en{}

\define@key{lec}{lecsem}{%
  \AtEndPreamble{%
    \ifcsundef{lecsemshort@#1}{%
       \ClassError{univie-ling-expose}{Semester type '#1' is not defined!}{%
             Please consult the package manual for instructions how to define it}{}
    }{}
    \def\lecsemshort{\csuse{lecsemshort@#1}}%
    \def\lecsemverb{\csuse{lecsemverb@#1}}%
  }%
}

\def\@course{}
\def\@supervisor{}
\def\@cosupervisor{}
\def\@beirat{}
\newcommand\supervisor[1]{\def\@supervisor{#1}}
\newcommand\cosupervisor[1]{\def\@cosupervisor{#1}}
\newcommand\advisor[1]{\def\@beirat{#1}}
\def\@studienrichtung{}
\newcommand\studienrichtung[1]{\def\@studienrichtung{#1}}
\def\@studienkennzahl{}
\newcommand\studienkennzahl[1]{\def\@studienkennzahl{#1}}

% Semantic markup
\newcommand\Expression[1]{\textit{#1}}
\newcommand\Concept[1]{\textsc{#1}}
\newcommand\Meaning[1]{\enquote*{#1}}


%% ============================================================
%% STRINGS:
%% ============================================================

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
\automark{section}
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
\if@uve@microtype
  \RequirePackage{microtype}
\fi

% Smart quotes
\RequirePackage[autostyle=tryonce,german=guillemets,maxlevel=3]{csquotes}


%% ============================================================
%% TITLING
%% ============================================================

% We need graphicx for the logo
\RequirePackage{graphicx}

% Month name
\RequirePackage[ngerman,english]{datetime2}
\deftranslation[to=German]{monthyear}{\DTMgermanmonthname{\@dtm@month} \@dtm@year}
\deftranslation[to=English]{monthyear}{\DTMenglishmonthname{\@dtm@month} \@dtm@year}

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
         {\usekomafont{thesistype}\translate{expo}}
       \end{center}
      \vspace{2\baselineskip}
      \begin{center}
	{\usekomafont{tpcaption}\translate{tpcaption}\par}
	{\ifx\@title\@empty\else
           \usekomafont{title}{\enquote{\@title%
            \ifx\@subtitle\@empty\else\linebreak\@subtitle\fi}\par}%
         \fi
        }
        \vskip 2em
        {%
          {\usekomafont{tpcaption}\translate{author}\par}
          \usekomafont{author}{%
            \lineskip 0.75em%
            \begin{tabular}[t]{c}
              \@author
            \end{tabular}\par
          }%
        }%
       \end{center}\par
        \vfill
        {\usekomafont{date}{\translate{vienna}, \translate{monthyear}\par}}%
        \vskip 2em
	\usekomafont{codes}{%
	\begin{tabular}[t]{@{}>{\raggedright}p{0.4\columnwidth}>{\raggedright}p{0.1\columnwidth}>{\raggedright}p{0.4\columnwidth}}
	\translate{stkz}: & & \@studienkennzahl\tabularnewline
        \noalign{\vskip6pt}
	\translate{strt}: & & \@studienrichtung\tabularnewline
        \noalign{\vskip6pt}
        \translate{supervisor}: & & \@supervisor\tabularnewline%
        \noalign{\vskip6pt}
        \ifx\@cosupervisor\@empty\else\translate{cosupervisor}: & & \@cosupervisor\tabularnewline\fi
	\noalign{\vskip6pt}
        \ifx\@beirat\@empty\else\translate{beirat}: & & \@beirat\fi
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
\let\@uve@save@quote\quote
\renewcommand*{\quote}{\@uve@save@quote\small}

% Quotation (smaller)
\let\@uve@save@quotation\quotation
\renewcommand*{\quotation}{\@uve@save@quotation\small}

% Description (normal italic)
\setkomafont{descriptionlabel}{\normalfont\itshape}

\if@uve@covington
  \RequirePackage{covington}
  \renewcommand{\p@equation}[1]{(#1)}
\fi

%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

%% captionlabel bold
\setkomafont{captionlabel}{\bfseries}

\if@uve@captionp
   \RequirePackage[format=plain,
	           justification=RaggedRight,
	           singlelinecheck=false
	          ]{caption}
\fi

%% =============================================================
%% POLYGLOSSIA:
%% =============================================================

\if@uve@polyglossia
  \if@uve@captionp
    \RequirePackage{ragged2e}
  \fi
  \RequirePackage{polyglossia}
\fi

%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\if@uve@biblatex

\if@uve@apa
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

% End of @uve@apa condition
\fi

% End of @uve@biblatex condition
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

\if@uve@refsp

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

\if@uve@draftmark

\if@uve@draftmarkfp
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
