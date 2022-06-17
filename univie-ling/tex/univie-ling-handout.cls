%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-handout
%%
%% Student Handouts in (Applied) Linguistics at the University of Vienna
%%
%% This file is part of the univie-ling LaTeX bundle, consisting of:
%%  -- univie-ling-handout.cls: Class for Handouts (this file)
%%  -- univie-ling-expose.cls: Class for PhD Research Proposals
%%  -- univie-ling-handout.cls: Class for student papers
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

\def\filedate{2022/05/30}
\def\fileversion{1.19}
\def\filename{univie-ling-handout.cls}
\NeedsTeXFormat{LaTeX2e}[1997/06/01]

\ProvidesClass{univie-ling-handout}[%
    \filedate\space v\fileversion\space Univie Ling handout class (JSp)]

\RequirePackage{xkeyval}


%% ============================================================
%% CLASS OPTIONS
%% ============================================================

\newif\ifbiblatex\biblatextrue
\newif\ifapa\apafalse
\newif\ifcaptionp\captionptrue
\newif\ifdraftmark\draftmarkfalse
\newif\ifdraftmarkfp\draftmarkfpfalse
\newif\ifrefsp\refsptrue
\newif\ifcovington\covingtontrue
\newif\ifmicrotype\microtypetrue
\newif\ifpolyglossia\polyglossiafalse
\newif\ifpsfonts\psfontstrue
\newif\ifotffonts\otffontsfalse
\newif\ifnofonts\nofontsfalse

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
    \ClassWarning{univie-ling-handout}{unknown 'all' value}%
}
\DeclareOptionX{all}[true]{\setkeys{uvt}{all=#1}}

% biblatex=<true|false>
% Load biblatex
\define@boolkey+{uvt}{biblatex}[true]{%
    \ifKV@uvt@biblatex
        \biblatextrue
    \else
        \biblatexfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown biblatex value}%
}
\DeclareOptionX{biblatex}[true]{\setkeys{uvt}{biblatex=#1}}

% apa=<true|false>
% Load APA style
\define@boolkey+{uvt}{apa}[true]{%
    \ifKV@uvt@apa
        \apatrue
    \else
        \apafalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown apa value}%
}
\DeclareOptionX{apa}[true]{\setkeys{uvt}{apa=#1}}

% caption=<true|false>
% Load caption
\define@boolkey+{uvt}{caption}[true]{%
    \ifKV@uvt@caption
        \captionptrue
    \else
        \captionpfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown caption value}%
}
\DeclareOptionX{caption}[true]{\setkeys{uvt}{caption=#1}}


% draftmark=<true|false>
% Print draftmark
\define@choicekey*+{uvt}{draftmark}[\val\nr]{true,false,firstpage}{%
    \ifcase\nr\relax% true:
        \draftmarktrue
        \draftmarkfpfalse
    \or% false:
        \draftmarkfalse
        \draftmarkfpfalse
    \or% firstpage:
        \draftmarktrue
        \draftmarkfptrue
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown draft value}%
}
\DeclareOptionX{draftmark}[true]{\setkeys{uvt}{draftmark=#1}}

% ref=<true|false>
% Load varioref and prettyref
\define@boolkey+{uvt}{ref}[true]{%
    \ifKV@uvt@ref
        \refsptrue
    \else
        \refspfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown ref value}%
}
\DeclareOptionX{ref}[true]{\setkeys{uvt}{ref=#1}}

% covington=<true|false>
% Load covington
\define@boolkey+{uvt}{covington}[true]{%
    \ifKV@uvt@covington
        \covingtontrue
    \else
        \covingtonfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown covington value}%
}
\DeclareOptionX{covington}[true]{\setkeys{uvt}{covington=#1}}

% microtype=<true|false>
% Load microtype
\define@boolkey+{uvt}{microtype}[true]{%
    \ifKV@uvt@microtype
        \microtypetrue
    \else
        \microtypefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown microtype value}%
}
\DeclareOptionX{microtype}[true]{\setkeys{uvt}{microtype=#1}}

% polyglossia=<true|false>
% Load polyglossia
\define@boolkey+{uvt}{polyglossia}[true]{%
    \ifKV@uvt@polyglossia
        \polyglossiatrue
        \psfontsfalse
        \otffontstrue
        \nofontsfalse
    \else
        \polyglossiafalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown polyglossia value}%
}
\DeclareOptionX{polyglossia}[true]{\setkeys{uvt}{polyglossia=#1}}

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
    \ClassWarning{univie-ling-handout}{unknown fonts value '#1'}%
}
\DeclareOptionX{fonts}{\setkeys{uvt}{fonts=#1}}

% fontsize=<ps|otf|none>
\def\univ@fontsize{11}
\define@key{uvt}{fontsize}{%
    \def\univ@fontsize{#1}
}
\DeclareOptionX{fontsize}{\setkeys{uvt}{fontsize=#1}}

% Paper size
\def\univ@papersize{a4}
\define@key{uvt}{papersize}{%
    \def\univ@papersize{#1}
}
\DeclareOptionX{papersize}{\setkeys{uvt}{papersize=#1}}

% landscape=<true|false>
\newif\iflandscape\landscapefalse
\define@boolkey+{uvt}{landscape}[true]{%
    \ifKV@uvt@landscape
        \landscapetrue
    \else
        \landscapefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown landscape value}%
}
\DeclareOptionX{landscape}[true]{\setkeys{uvt}{landscape=#1}}


% pplogo=<true|false>
\newif\ifnopplogo\nopplogofalse
\define@boolkey+{uvt}{pplogo}[true]{%
    \ifKV@uvt@pplogo
        \nopplogofalse
    \else
        \nopplogotrue
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown pplogo value}%
}
\DeclareOptionX{pplogo}[true]{\setkeys{uvt}{pplogo=#1}}

% Colored logo (default)
\def\univ@printlogo{\includegraphics[width=74mm]{univielogo}}
\def\univ@printsmalllogo{\includegraphics[height=14mm]{univielogo}}

% Monochrome logo
\define@boolkey+{uvt}{bwlogo}[true]{%
    \ifKV@uvt@bwlogo
        \def\univ@printlogo{\includegraphics[width=74mm]{univielogo-sw}}
        \def\univ@printsmalllogo{\includegraphics[height=14mm]{univielogo-sw}}
    \else
        \def\univ@printlogo{\includegraphics[width=74mm]{univielogo}}
        \def\univ@printsmalllogo{\includegraphics[height=14mm]{univielogo}}
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown bwlogo value}%
}
\DeclareOptionX{bwlogo}[true]{\setkeys{uvt}{bwlogo=#1}}


% Swap title and event in header
\newif\ifswaphead\swapheadfalse
\define@boolkey+{uvt}{swaphead}[true]{%
    \ifKV@uvt@swaphead
        \swapheadtrue
    \else
        \swapheadfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown swaphead value}%
}
\DeclareOptionX{swaphead}[true]{\setkeys{uvt}{swaphead=#1}}

% Output total page number
\newif\iflastpage\lastpagefalse
\define@boolkey+{uvt}{totalpages}[true]{%
    \ifKV@uvt@totalpages
        \lastpagetrue
    \else
        \lastpagefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown totalpages value}%
}
\DeclareOptionX{totalpages}[true]{\setkeys{uvt}{totalpages=#1}}

% Suppress pagination on first page?
\newif\ifpageonfirst\pageonfirsttrue
\define@boolkey+{uvt}{firstpagination}[true]{%
    \ifKV@uvt@firstpagination
        \pageonfirsttrue
    \else
        \pageonfirstfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown firstpagination value}%
}
\DeclareOptionX{firstpagination}[true]{\setkeys{uvt}{firstpagination=#1}}

% Line break in heading between event and event spec (location, date etc.)
\newif\ifbreakevent\breakeventfalse
\define@boolkey+{uvt}{breakevent}[true]{%
    \ifKV@uvt@breakevent
        \breakeventtrue
    \else
        \breakeventfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown breakevent value}%
}
\DeclareOptionX{breakevent}[true]{\setkeys{uvt}{breakevent=#1}}

% Print subtitle over the whole text width
% (may conflict with address field)
\newif\ifwidestitle\widestitlefalse
\define@boolkey+{uvt}{widesubtitle}[true]{%
    \ifKV@uvt@breakevent
        \widestitletrue
    \else
        \widestitlefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown widesubtitle value}%
}
\DeclareOptionX{widesubtitle}[true]{\setkeys{uvt}{widesubtitle=#1}}

% German CD (default)
\def\cdgerman{
	\def\univ@name{\univ@name@de}
	\def\univ@shortname{\univ@shortname@de}
	\def\univ@university{Universit\"at Wien}
	\def\univ@department{\univ@department@de}
	\def\univ@location{\univ@location@de}
	\def\univ@country{\univ@country@de}
	\def\univ@function{\univ@function@de}
	\def\univ@secfunction{\univ@secfunction@de}
	\def\univ@phoneprefix{T}
	\def\univ@faxprefix{F}
	\def\univ@emailprefix{}
	\def\univ@urlprefix{}
	\def\univ@pageprefix{Seite}
	\def\univ@headerdeptsep{\ $\cdot$\ }
	\def\univ@headernamesep{,\ }
	\def\and{\\}
}
\cdgerman

\define@choicekey*+{uvt}{cd}[\val\nr]{german,english}{%
    \ifcase\nr\relax% german
    	\cdgerman
    \or% english
	\def\univ@name{\univ@name@en}
	\def\univ@shortname{\univ@shortname@en}
	\def\univ@university{University of Vienna}
	\def\univ@department{\univ@department@en}
	\def\univ@location{\univ@location@en}
	\def\univ@country{\univ@country@en}
	\def\univ@function{\univ@function@en}
	\def\univ@secfunction{\univ@secfunction@en}
	\def\univ@phoneprefix{T}
	\def\univ@faxprefix{F}
	\def\univ@emailprefix{}
	\def\univ@urlprefix{}
	\def\univ@pageprefix{Page}
	\def\univ@headerdeptsep{\ $\cdot$\ }
	\def\univ@headernamesep{,\ }
	\def\univ@secnamesep{,\ }
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown cd value '#1'}%
}
\DeclareOptionX{cd}[german]{\setkeys{uvt}{cd=#1}}


% Output punch marks?
\newif\ifuniv@punchmark\univ@punchmarkfalse
\define@boolkey+{uvt}{punchmarks}[true]{%
    \ifKV@uvt@punchmarks
        \univ@punchmarktrue
    \else
        \univ@punchmarkfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown punchmarks value}%
}
\DeclareOptionX{punchmarks}[true]{\setkeys{uvt}{punchmarks=#1}}

% Output fold marks?
\newif\ifuniv@foldmarks\univ@foldmarksfalse
\define@boolkey+{uvt}{foldmarks}[true]{%
    \ifKV@uvt@foldmarks
        \univ@foldmarkstrue
    \else
        \univ@foldmarksfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown foldmarks value}%
}
\DeclareOptionX{foldmarks}[true]{\setkeys{uvt}{foldmarks=#1}}


% fontenc=<value|false>
% customize font encoding
\newif\ifuniv@usefontenc\univ@usefontenctrue
\def\univ@fontenc{T1}
\define@choicekey*+{uvt}{fontenc}[\val\nr]{none}{%
    \ifcase\nr\relax% none:
        \univ@usefontencfalse
    \fi
}{%
    \def\univ@fontenc{#1}%
}
\DeclareOptionX{fontenc}[T1]{\setkeys{uvt}{fontenc=#1}}


\ProcessOptionsX


%% ============================================================
%% LOAD REQUIRED BASE CLASS AND PACKAGES
%% ============================================================

% Base class: scrartcl (KOMA-Script)
\PassOptionsToClass{fontsize=\univ@fontsize,paper=\univ@papersize,oneside,final}{scrartcl}
\LoadClassWithOptions{scrartcl}[1997/04/16]

% Set page layout with geometry
\RequirePackage{geometry}
\geometry{%
  a4paper,
  top=50mm,
  left=26.5mm,
  right=15mm,
  bottom=23mm,
  headsep=3.7cm,
  footskip=10mm
}

% Use headings
\AtEndOfClass{\pagestyle{headings}}

% Use lastpage package if total pages is required
\iflastpage
  \AtEndOfClass{\RequirePackage{lastpage}}
\fi

% We need graphicx for the logo
\RequirePackage{graphicx}

\ifpsfonts
	\ifuniv@usefontenc
	    \RequirePackage[\univ@fontenc]{fontenc}
	\fi
	% Source Pro fonts
	\usepackage[default,osf]{sourceserifpro}
	\usepackage[osf]{sourcesanspro}
	\usepackage{sourcecodepro}
\fi

\ifotffonts
	\RequirePackage{fontspec}
	% Source Pro fonts
	\setmainfont{SourceSerifPro}[Numbers=OldStyle]
	\setsansfont{SourceSansPro}[Numbers=OldStyle]
	\setmonofont{SourceCodePro}
\fi


%% ============================================================
%% DEFINITION OF MACROS
%% ============================================================

%
% 0 Predefinitions

% Font settings
\def\univ@font@event{\fontsize{11}{13pt}\selectfont\mdseries\sffamily}
\def\univ@font@title{\fontsize{18}{21pt}\selectfont\bfseries\sffamily}
\def\univ@font@subtitle{\fontsize{13}{16pt}\selectfont\bfseries\sffamily}
\def\univ@font@sections{\fontsize{13}{16pt}\selectfont\bfseries\sffamily}
\def\univ@font@department{\fontsize{10}{12pt}\selectfont\bfseries\sffamily}
\def\univ@font@header{\fontsize{8}{10pt}\selectfont\mdseries\sffamily}
\def\univ@font@footer{\fontsize{8}{10pt}\selectfont\sffamily}
\def\univ@font@headertitle{\fontsize{8}{10pt}\selectfont\sffamily}
\def\univ@font@eventlocdate{\fontsize{11}{13pt}\selectfont\mdseries\sffamily}

\setkomafont{part}{\fontsize{16}{18pt}\bfseries}
\setkomafont{partnumber}{\usekomafont{part}}
\setkomafont{sectioning}{\univ@font@sections}
\setkomafont{descriptionlabel}{\normalfont\mdseries}
\setkomafont{captionlabel}{\normalfont\bfseries}

% Lengths
\newlength\headeroffset
\newlength\titleoffset
\setlength\headeroffset{7mm}
\setlength\titleoffset{-3.6mm}

\newlength\beforetitling
\newlength\beforeevent
\newlength\beforetitle
\newlength\beforesubtitle
\newlength\aftertitle
\setlength\beforetitling{18pt}
\setlength\beforeevent{6pt}
\setlength\beforesubtitle{6pt}
\setlength\beforetitle{6pt}
\setlength\aftertitle{18pt}

% Boxes
\newsavebox{\univ@box@logo}

% Aux linebreak macro, since \\ is redefined by beamer article
\newcommand\umbruch[1][]{\linebreak\ifx\@empty#1\else\vspace{#1}\fi}


%% ============================================================
%% 1 Personal data
%% ============================================================

% a.) department
\def\univ@department@de{\empty}
\def\univ@department@en{\empty}
\newcommand*\hoDept[2][\@empty]%
{%
  \ifx\@empty#1\def\univ@department@en{#2}
  \else\def\univ@department@en{#1}\fi
  \def\univ@department@de{#2}
}

% b.) Name & function
\def\univ@name@de{}
\def\univ@name@en{}
\newcommand*\hoName[2][\@empty]%
{%
  \ifx\@empty#1\def\univ@name@en{#2}
  \else\def\univ@name@en{#1}\fi
  \def\univ@name@de{#2}
}
\def\univ@shortname@de{}
\def\univ@shortname@en{}
\newcommand*\hoShortName[2][\@empty]%
{%
  \ifx\@empty#1\def\univ@shortname@en{#2}
  \else\def\univ@shortname@en{#1}\fi
  \def\univ@shortname@de{#2}
}
%
\def\univ@function@de{}
\def\univ@function@en{}
\newcommand*\hoFunction[2][\@empty]%
{%
  \ifx\@empty#1\def\univ@function@en{#2}
  \else\def\univ@function@en{#1}\fi
  \def\univ@function@de{#2}
}

% c.) A collaborator's name & function
\def\univ@secname{}
\newcommand*\hoSecName[1]{\def\univ@secname{#1}}
\def\univ@shortsecname{}
\newcommand*\hoShortSecName[1]{\def\univ@shortsecname{#1}}
%
\def\univ@secfunction@de{}
\def\univ@secfunction@en{}
\newcommand*\hoSecFunction[2][\@empty]%
{%
  \ifx\@empty#1\def\univ@secfunction@en{#2}
  \else\def\univ@secfunction@en{#1}\fi
  \def\univ@secfunction@de{#2}
}

% d.) Department address
\def\univ@street{}
\newcommand*\hoStreet[1]{\def\univ@street{#1}}
%
\def\univ@postcode{}
\newcommand*\hoPostCode[1]{\def\univ@postcode{#1}}
%
\def\univ@location@de{}
\def\univ@location@en{}
\newcommand*\hoLoc[2][\@empty]%
{%
  \ifx\@empty#1\def\univ@location@en{#2}
  \else\def\univ@location@en{#1}\fi
  \def\univ@location@de{#2}
}
%
\def\univ@country@de{}
\def\univ@country@en{}
\newcommand*\hoCountry[2][\@empty]%
{%
  \ifx\@empty#1\def\univ@country@en{#2}
  \else\def\univ@country@en{#1}\fi
  \def\univ@country@de{#2}
}

% e.) Contact
\def\univ@phone{}
\newcommand*\hoPhone[1]{\def\univ@phone{#1}}
%
\def\univ@fax{}
\newcommand*\hoFax[1]{\def\univ@fax{#1}}
%
\def\univ@email{}
\newcommand*\hoEMail[1]{\def\univ@email{#1}}
%
\def\univ@url{}
\newcommand*\hoUrl[1]{\def\univ@url{#1}}


%% ============================================================
%% 2 Titling
%% ============================================================

% a.) Handout title
\def\univ@title{}
\def\univ@title@header{~}
\newcommand{\hoTitle}[2][\@empty]%
{%
  \ifx\@empty#1\def\univ@title@header{#2}
  \else\def\univ@title@header{#1}\fi
  \def\univ@title{#2}
  \thispagestyle{firstpage}%
}
\def\univ@titleprefix{}
\newcommand{\hoTitlePrefix}[1]
{%
  \def\univ@titleprefix{#1}%
}

% b.) Handout subtitle
\def\univ@subtitle{}
\def\univ@widesubtitle{}
\newcommand{\hoSubtitle}{\@ifstar{\@@hoSubtitle}{\@hoSubtitle}}
% Starred version: wide subtitle
\newcommand{\@hoSubtitle}[1]
{%
  \ifwidestitle
    \def\univ@widesubtitle{#1}%
  \else
    \def\univ@subtitle{#1}%
  \fi
}
% Unstarred version: normal (narrow) subtitle
\newcommand{\@@hoSubtitle}[1]
{%
  \def\univ@widesubtitle{#1}%
}

% c.) Event title 
\def\univ@event{}
\def\univ@event@header{~}
\newcommand*{\hoEvent}[2][\@empty]{%
  \ifx\@empty#1\def\univ@event@header{#2}
  \else\def\univ@event@header{#1}\fi
  \def\univ@event{#2}
}

% d.) Event location
\def\univ@eventlocation{}
\def\univ@eventlocation@header{}
\newcommand*{\hoEventLoc}[2][\@empty]{%
  \ifx\@empty#1\def\univ@eventlocation@header{#2}
  \else\def\univ@eventlocation@header{#1}\fi
  \def\univ@eventlocation{#2}
}

% e.) Event date
\def\univ@eventdate{}
\def\univ@eventdate@header{}
\newcommand*{\hoEventDate}[2][\@empty]{%
  \ifx\@empty#1\def\univ@eventdate@header{#2}
  \else\def\univ@eventdate@header{#1}\fi
  \def\univ@eventdate{#2}
}

% The maketitle routine
\renewcommand\maketitle{%
  \newif\ifuniv@eventline\univ@eventlinefalse%
  \ifx\univ@event\empty\else\univ@eventlinetrue\fi%
  \ifx\univ@eventdate\empty\else\univ@eventlinetrue\fi%
  \ifx\univ@eventlocation\empty\else\univ@eventlinetrue\fi%
  \vspace*{\beforetitling}%
  \hspace*{\titleoffset}%
  \begin{minipage}[t]{0.63\columnwidth}%
    \raggedright%
    \ifx\univ@event\empty%
    \else
      \vspace*{\beforeevent}\bgroup\univ@font@event\univ@event\egroup\ifx\univ@eventlocation\empty\else\par\fi%
    \fi%
    \ifx\univ@eventlocation\empty%
    \else
      \bgroup\univ@font@eventlocdate\univ@eventlocation\egroup%
    \fi%
    \ifx\univ@eventdate\empty%
    \else%
      \bgroup\univ@font@eventlocdate{} (\univ@eventdate)\egroup%
    \fi%
    \ifuniv@eventline\par\fi
    \ifx\univ@title\empty%
    \else
      \vspace{\beforetitle}%
      \ifx\univ@titleprefix\empty%
        \parbox{\textwidth}{\raggedright\univ@font@title\univ@title}\par%
        \ifx\univ@subtitle\empty%
        \else
           \vspace{\beforesubtitle}\noindent\bgroup\raggedright\univ@font@subtitle\univ@subtitle\par\egroup%
        \fi
      \else%
        \vspace{.15\baselineskip}%
        \begin{minipage}{\textwidth}
           \begin{tabularx}{\columnwidth}{@{}l@{\enskip}>{\raggedright\arraybackslash}X}
              \univ@font@title\univ@titleprefix & \univ@font@title\univ@title \tabularnewline
              \ifx\univ@subtitle\empty%
              \else
                 \noalign{\vspace{\beforesubtitle}}%
                 & \univ@font@subtitle\univ@subtitle \tabularnewline
              \fi
           \end{tabularx}%
        \end{minipage}%
      \fi
      \@ifundefined{hypersetup}{}{%
          \hypersetup{pdftitle=\ifx\univ@titleprefix\empty\else\univ@titleprefix~\fi\univ@title,
                      pdfauthor=\univ@name,
                      pdfcreator={LaTeX2e via LyX}}}%
    \fi%
  \end{minipage}\par%
  \ifx\univ@widesubtitle\empty%
  \else%
    \vspace{\beforesubtitle}\bgroup\noindent\raggedright\univ@font@subtitle\univ@widesubtitle\par\egroup%
  \fi%
  \vspace{\aftertitle}%
  \@afterindentfalse\@afterheading%
}

% Easy way to change bibliography heading
\def\univ@bibheading{\refname}
\newcommand*\Bibheading[1]{\def\univ@bibheading{#1}}

% Adjust logo positioning for landscape
\newlength\lsoffset
\iflandscape
\setlength\lsoffset{8cm}
\addtolength\headeroffset{\lsoffset}
\fi


%% ============================================================
%% LOCALIZATION:
%% ============================================================

\RequirePackage{translations}
\DeclareTranslation{German}{draft}{ENTWURF}
\DeclareTranslation{English}{draft}{DRAFT}
\DeclareTranslation{German}{section}{Abschnitt}
\DeclareTranslation{English}{section}{section}
\DeclareTranslation{German}{footnote}{Anm.}
\DeclareTranslation{English}{footnote}{fn.}
\DeclareTranslation{German}{example}{Beispiel}
\DeclareTranslation{English}{example}{example}


%% ============================================================
%% Page styles
%% ============================================================

%
% First page

\def\ps@firstpage{
  \sbox{\univ@box@logo}{\univ@printlogo}
  \def\univ@thelogo{\parbox{74mm}{\usebox{\univ@box@logo}}}
  \headheight30mm\headsep2.5mm\footskip8mm
  \def\@oddhead{%
    \unitlength1mm
    \hspace*{\headeroffset}
    \begin{picture}(0,0)
       \put(84.5,19){\univ@thelogo}
       \put(107,8){%
         \parbox[t]{51.5mm}
          {\normalsize\parbox[t]{\linewidth}{%
             \begin{flushleft}%
               \if\univ@department\empty\else\vspace*{8pt}\univ@font@department\univ@department\umbruch[3pt]\umbruch\fi%
               \univ@font@header\univ@name%
               \if\univ@function\empty\else\umbruch\univ@function\fi%
               \if\univ@street\empty\else\umbruch\univ@street\fi%
               \if\univ@location\empty\else\umbruch\univ@postcode~\univ@location\fi%
               \vspace{10pt}%
               \if\univ@phone\empty\else\umbruch\ifx\univ@phoneprefix\empty\else\univ@phoneprefix\ \fi\univ@phone\fi%
               \if\univ@fax\empty\else\umbruch\ifx\univ@faxprefix\empty\else\univ@faxprefix\ \fi\univ@fax\fi%
               \if\univ@email\empty\else\umbruch\ifx\univ@emailprefix\empty\else\univ@emailprefix\ \fi\univ@email\fi%
               \ifx\univ@url\empty\else\umbruch\ifx\univ@urlprefix\empty\else\univ@urlprefix\ \fi\univ@url\fi%
             \end{flushleft}%
           }%
         }%
      }
      \ifuniv@punchmark
        \put(-27,-112){\line(1,0){4}}
      \fi
      \ifuniv@foldmarks
        \put(-33,-56){\line(1,0){3}}
        \put(-33,-168){\line(1,0){3}}
      \fi
    \end{picture}
   \hfill%
  }
  \ifpageonfirst
    \def\@oddfoot{\hfill\univ@font@footer\raggedright\univ@pageprefix~\thepage\iflastpage /\pageref{LastPage}\fi}
  \else
    \def\@oddfoot{}
  \fi
  \def\@evenhead{\@oddhead}
  \def\@evenfoot{\@oddfoot}
}

%
% Pages > 1

\newif\ifnoevent\noeventfalse

\def\heventtitlesep{}

\def\ps@headings{%
  \let\orig@and\and%
  \def\and{$\cdot$\ }%
  \ifnopplogo\else\sbox{\univ@box@logo}{\univ@printsmalllogo}\fi
  \def\univ@thelogo{\parbox{90mm}{\usebox{\univ@box@logo}}}
  \headheight30mm\headsep2.5mm\footskip8mm
  \def\titleline{\ifx\univ@title@header\empty\else\univ@font@headertitle%
                 \ifx\univ@titleprefix\empty\else\univ@titleprefix~\fi%
                 \univ@title@header\linebreak\fi}%
  \ifx\univ@eventlocation@header\empty\ifx\univ@eventdate@header\empty\noeventtrue\fi\fi%
  \def\eventline{%
      \univ@font@header\univ@event@header\ifx\univ@eventdate@header\empty\else\ifbreakevent\linebreak\else\ \fi%
      \ifnoevent\else(\ifx\univ@eventlocation@header\empty\else\univ@eventlocation@header, \fi\univ@eventdate@header)\fi\linebreak\fi%
  }
  \def\@oddhead{%
    \unitlength1mm
    \hspace{\headeroffset}
    \begin{picture}(0,0)
       \put(106.2,15){\univ@thelogo}
       \put(-8,25){%
         \hspace*{-\lsoffset}%
         \parbox[t]{120mm}
          {\normalsize\parbox[t]{100mm}{%
            \begin{flushleft}%
              \univ@font@header\if\hfuzz\univ@shortname\hfuzz\univ@name\else\univ@shortname\fi
               \if\univ@department\empty\else\univ@headerdeptsep\univ@department\fi\linebreak
              \ifswaphead
                \eventline%
                \heventtitlesep%
                \titleline%
              \else
                \titleline%
                \eventline%
              \fi
            \end{flushleft}%
           }%
         }%
      }
    \end{picture}
    \hfill%
  }
  \def\@oddfoot{\hfill\univ@font@footer\raggedright\univ@pageprefix~\thepage\iflastpage /\pageref{LastPage}\fi}
  \def\@evenhead{\@oddhead}
  \def\@evenfoot{\@oddfoot}
  \let\and\orig@and%
}


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
%% POLYGLOSSIA:
%% =============================================================

\ifpolyglossia
  \ifcaptionp
    \RequirePackage{ragged2e}
  \fi
  \RequirePackage{polyglossia}
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
\AfterPackage*{csquotes}{\SetCiteCommand{\parencite}}
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
\AfterPackage*{csquotes}{\SetCiteCommand{\parencite}}

% End of apa condition
\fi

\DeclarePrintbibliographyDefaults{title=\univ@bibheading}

% End of biblatex condition
\fi

% Smaller
\renewcommand*{\bib@beginhook}{\footnotesize}

% Custom heading
\AtBeginDocument{%
  \renewcommand*\bib@heading{\section*{\univ@bibheading}}
}


%% ============================================================
%% MISC.
%% ============================================================

% Allow hyphenation after \slash
\def\slash{/\penalty\exhyphenpenalty\hskip\z@skip}

%
% FURTHER PACKAGES
%
\RequirePackage{array}
\RequirePackage{ifthen}
\RequirePackage{babel}[1997/01/23]

% Micro-typographic polishment
\ifmicrotype
   \RequirePackage{microtype}
\fi

% Smart quotes
\RequirePackage{csquotes}
\ExecuteQuoteOptions{autostyle=tryonce,german=guillemets,austrian=guillemets,maxlevel=3}
% Add quotation marks on displayed quotations
% a.) for commands "\blockquote" and related:
\renewcommand{\mkblockquote}[4]{\openautoquote#1\closeautoquote#2#4#3}
% b.) for environments "displayquote" and related:
\renewcommand{\mkbegdispquote}[2]{\textooquote\advance\csq@qlevel\@ne}
\renewcommand{\mkenddispquote}[2]{\textcoquote\csq@qlevel\@ne#1#2}

% Hyperlinks
\RequirePackage{url}
\newcommand{\urlprefix}{}

% URLs italic
\@ifundefined{selectfont}{%
\def\UrlFont{\it}}
{\def\UrlFont{\rmfamily\itshape}%
}

% Covington
\ifcovington
\RequirePackage{covington}
\renewcommand{\p@equation}[1]{(#1)}
\fi


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


%% =============================================================
%% DRAFT:
%% =============================================================

\ifdraftmark

\ifdraftmarkfp
  \RequirePackage[firstpageonly]{draftwatermark}
\else
  \RequirePackage{draftwatermark}
\fi

\DraftwatermarkOptions{%
  angle=0,
  vpos=10pt,
  anchor=ct,
  fontsize=14pt,
  text={\GetTranslation{draft} (\today)}
}

\fi

%% ============================================================
%% Semantic markup
%% ============================================================

\newcommand\Expression[1]{\textit{#1}}
\newcommand\Concept[1]{\textsc{#1}}
\newcommand\Meaning[1]{\enquote*{#1}}

\endinput
%%
%% End of file `univie-ling-handout.cls'.
