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


\NeedsTeXFormat{LaTeX2e}[1997/06/01]
\ProvidesClass{univie-ling-handout}[2022/09/11 v.1.21dev Univie Ling handout class (JSp)]

%% ============================================================
%% CLASS OPTIONS
%% ============================================================

\RequirePackage{xkeyval}

\newif\if@uvh@biblatex\@uvh@biblatextrue
\newif\if@uvh@apa\@uvh@apafalse
\newif\if@uvh@captionp\@uvh@captionptrue
\newif\if@uvh@draftmark\@uvh@draftmarkfalse
\newif\if@uvh@draftmarkfp\@uvh@draftmarkfpfalse
\newif\if@uvh@refsp\@uvh@refsptrue
\newif\if@uvh@covington\@uvh@covingtontrue
\newif\if@uvh@microtype\@uvh@microtypetrue
\newif\if@uvh@polyglossia\@uvh@polyglossiafalse
\newif\if@uvh@psfonts\@uvh@psfontstrue
\newif\if@uvh@otffonts\@uvh@otffontsfalse

% all=<true|false>
% Load all packages
\define@boolkey+{uvh}{all}[true]{%
    \ifKV@uvh@all
        \@uvh@biblatextrue
        \@uvh@captionptrue
        \@uvh@refsptrue
        \@uvh@covingtontrue
        \@uvh@microtypetrue
    \else
        \@uvh@biblatexfalse
        \@uvh@captionpfalse
        \@uvh@refspfalse
        \@uvh@covingtonfalse
        \@uvh@microtypefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown 'all' value}%
}

% biblatex=<true|false>
% Load biblatex
\define@boolkey+{uvh}{biblatex}[true]{%
    \ifKV@uvh@biblatex
        \@uvh@biblatextrue
    \else
        \@uvh@biblatexfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown biblatex value}%
}

% apa=<true|false>
% Load APA style
\define@boolkey+{uvh}{apa}[true]{%
    \ifKV@uvh@apa
        \@uvh@apatrue
    \else
        \@uvh@apafalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown apa value}%
}

% caption=<true|false>
% Load caption
\define@boolkey+{uvh}{caption}[true]{%
    \ifKV@uvh@caption
        \@uvh@captionptrue
    \else
        \@uvh@captionpfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown caption value}%
}

% draftmark=<true|false>
% Print draftmark
\define@choicekey*+{uvh}{draftmark}[\val\nr]{true,false,firstpage}{%
    \ifcase\nr\relax% true:
        \@uvh@draftmarktrue
        \@uvh@draftmarkfpfalse
    \or% false:
        \@uvh@draftmarkfalse
        \@uvh@draftmarkfpfalse
    \or% firstpage:
        \@uvh@draftmarktrue
        \@uvh@draftmarkfptrue
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown draft value}%
}

% ref=<true|false>
% Load varioref and prettyref
\define@boolkey+{uvh}{ref}[true]{%
    \ifKV@uvh@ref
        \@uvh@refsptrue
    \else
        \@uvh@refspfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown ref value}%
}

% covington=<true|false>
% Load covington
\define@boolkey+{uvh}{covington}[true]{%
    \ifKV@uvh@covington
        \@uvh@covingtontrue
    \else
        \@uvh@covingtonfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown covington value}%
}

% microtype=<true|false>
% Load microtype
\define@boolkey+{uvh}{microtype}[true]{%
    \ifKV@uvh@microtype
        \@uvh@microtypetrue
    \else
        \@uvh@microtypefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown microtype value}%
}

% polyglossia=<true|false>
% Load polyglossia
\define@boolkey+{uvh}{polyglossia}[true]{%
    \ifKV@uvh@polyglossia
        \@uvh@polyglossiatrue
        \@uvh@psfontsfalse
        \@uvh@otffontstrue
    \else
        \@uvh@polyglossiafalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown polyglossia value}%
}

% fonts=<ps|otf|none>
\define@choicekey*+{uvh}{fonts}[\val\nr]{ps,otf,none}{%
    \ifcase\nr\relax% ps: use PostScript fonts (classic LaTeX)
      \@uvh@psfontstrue
      \@uvh@otffontsfalse
    \or% otf: use OpenType fonts (fontspec)
      \@uvh@psfontsfalse
      \@uvh@otffontstrue
    \or% none: Use no font package
      \@uvh@psfontsfalse
      \@uvh@otffontsfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown fonts value '#1'}%
}

% fontsize=<ps|otf|none>
\def\uvh@fontsize{11}
\define@key{uvh}{fontsize}{%
    \def\uvh@fontsize{#1}
}

% Paper size
\def\uvh@papersize{a4}
\define@key{uvh}{papersize}{%
    \def\uvh@papersize{#1}
}

% landscape=<true|false>
\newif\if@uvh@landscape\@uvh@landscapefalse
\define@boolkey+{uvh}{landscape}[true]{%
    \ifKV@uvh@landscape
        \@uvh@landscapetrue
    \else
        \@uvh@landscapefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown landscape value}%
}


% pplogo=<true|false>
\newif\if@uvh@nopplogo\@uvh@nopplogofalse
\define@boolkey+{uvh}{pplogo}[true]{%
    \ifKV@uvh@pplogo
        \@uvh@nopplogofalse
    \else
        \@uvh@nopplogotrue
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown pplogo value}%
}

% Colored logo (default)
\def\uvh@printlogo{\includegraphics[width=74mm]{univielogo}}
\def\uvh@printsmalllogo{\includegraphics[height=14mm]{univielogo}}

% Monochrome logo
\define@boolkey+{uvh}{bwlogo}[true]{%
    \ifKV@uvh@bwlogo
        \def\uvh@printlogo{\includegraphics[width=74mm]{univielogo-sw}}
        \def\uvh@printsmalllogo{\includegraphics[height=14mm]{univielogo-sw}}
    \else
        \def\uvh@printlogo{\includegraphics[width=74mm]{univielogo}}
        \def\uvh@printsmalllogo{\includegraphics[height=14mm]{univielogo}}
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown bwlogo value}%
}

% Swap title and event in header
\newif\if@uvh@swaphead\@uvh@swapheadfalse
\define@boolkey+{uvh}{swaphead}[true]{%
    \ifKV@uvh@swaphead
        \@uvh@swapheadtrue
    \else
        \@uvh@swapheadfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown swaphead value}%
}

% Output total page number
\newif\if@uvh@lastpage\@uvh@lastpagefalse
\define@boolkey+{uvh}{totalpages}[true]{%
    \ifKV@uvh@totalpages
        \@uvh@lastpagetrue
    \else
        \@uvh@lastpagefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown totalpages value}%
}

% Suppress pagination on first page?
\newif\if@uvh@pageonfirst\@uvh@pageonfirsttrue
\define@boolkey+{uvh}{firstpagination}[true]{%
    \ifKV@uvh@firstpagination
        \@uvh@pageonfirsttrue
    \else
        \@uvh@pageonfirstfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown firstpagination value}%
}

% Line break in heading between event and event spec (location, date etc.)
\newif\if@uvh@breakevent\@uvh@breakeventfalse
\define@boolkey+{uvh}{breakevent}[true]{%
    \ifKV@uvh@breakevent
        \@uvh@breakeventtrue
    \else
        \@uvh@breakeventfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown breakevent value}%
}

% Print subtitle over the whole text width
% (may conflict with address field)
\newif\if@uvh@widestitle\@uvh@widestitlefalse
\define@boolkey+{uvh}{widesubtitle}[true]{%
    \ifKV@uvh@breakevent
        \@uvh@widestitletrue
    \else
        \@uvh@widestitlefalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown widesubtitle value}%
}

% German CD (default)
\def\@uvh@cdgerman{
	\def\uvh@name{\uvh@name@de}
	\def\uvh@shortname{\uvh@shortname@de}
	\def\uvh@university{Universit\"at Wien}
	\def\uvh@department{\uvh@department@de}
	\def\uvh@location{\uvh@location@de}
	\def\uvh@country{\uvh@country@de}
	\def\uvh@function{\uvh@function@de}
	\def\uvh@secfunction{\uvh@secfunction@de}
	\def\uvh@phoneprefix{T}
	\def\uvh@faxprefix{F}
	\def\uvh@emailprefix{}
	\def\uvh@urlprefix{}
	\def\uvh@pageprefix{Seite}
	\def\uvh@headerdeptsep{\ $\cdot$\ }
	\def\uvh@headernamesep{,\ }
	\def\and{\\}
}
\@uvh@cdgerman

\define@choicekey*+{uvh}{cd}[\val\nr]{german,english}{%
    \ifcase\nr\relax% german
    	\@uvh@cdgerman
    \or% english
	\def\uvh@name{\uvh@name@en}
	\def\uvh@shortname{\uvh@shortname@en}
	\def\uvh@university{University of Vienna}
	\def\uvh@department{\uvh@department@en}
	\def\uvh@location{\uvh@location@en}
	\def\uvh@country{\uvh@country@en}
	\def\uvh@function{\uvh@function@en}
	\def\uvh@secfunction{\uvh@secfunction@en}
	\def\uvh@phoneprefix{T}
	\def\uvh@faxprefix{F}
	\def\uvh@emailprefix{}
	\def\uvh@urlprefix{}
	\def\uvh@pageprefix{Page}
	\def\uvh@headerdeptsep{\ $\cdot$\ }
	\def\uvh@headernamesep{,\ }
	\def\uvh@secnamesep{,\ }
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown cd value '#1'}%
}


% Output punch marks?
\newif\if@uvh@punchmark\@uvh@punchmarkfalse
\define@boolkey+{uvh}{punchmarks}[true]{%
    \ifKV@uvh@punchmarks
        \@uvh@punchmarktrue
    \else
        \@uvh@punchmarkfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown punchmarks value}%
}

% Output fold marks?
\newif\if@uvh@foldmarks\@uvh@foldmarksfalse
\define@boolkey+{uvh}{foldmarks}[true]{%
    \ifKV@uvh@foldmarks
        \@uvh@foldmarkstrue
    \else
        \@uvh@foldmarksfalse
    \fi
}{%
    \ClassWarning{univie-ling-handout}{unknown foldmarks value}%
}


% fontenc=<value|false>
% customize font encoding
\newif\ifuvh@usefontenc\uvh@usefontenctrue
\def\uvh@fontenc{T1}
\define@choicekey*+{uvh}{fontenc}[\val\nr]{none}{%
    \ifcase\nr\relax% none:
        \uvh@usefontencfalse
    \fi
}{%
    \def\uvh@fontenc{#1}%
}

% Process
\ProcessOptionsX<uvh>


%% ============================================================
%% LOAD REQUIRED BASE CLASS AND PACKAGES
%% ============================================================

% Base class: scrartcl (KOMA-Script)
\PassOptionsToClass{fontsize=\uvh@fontsize,oneside,final}{scrartcl}
\if@uvh@landscape
  \PassOptionsToClass{landscape}{scrartcl}
\fi
\LoadClass{scrartcl}[1997/04/16]

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
\if@uvh@lastpage
  \AtEndOfClass{\RequirePackage{lastpage}}
\fi

% We need graphicx for the logo
\RequirePackage{graphicx}

\if@uvh@psfonts
	\ifuvh@usefontenc
	    \RequirePackage[\uvh@fontenc]{fontenc}
	\fi
	% Source Pro fonts
	\RequirePackage[default,osf]{sourceserifpro}
	\RequirePackage[osf]{sourcesanspro}
	\RequirePackage{sourcecodepro}
\fi

\if@uvh@otffonts
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
\def\uvh@font@event{\fontsize{11}{13pt}\selectfont\mdseries\sffamily}
\def\uvh@font@title{\fontsize{18}{21pt}\selectfont\bfseries\sffamily}
\def\uvh@font@subtitle{\fontsize{13}{16pt}\selectfont\bfseries\sffamily}
\def\uvh@font@sections{\fontsize{13}{16pt}\selectfont\bfseries\sffamily}
\def\uvh@font@department{\fontsize{10}{12pt}\selectfont\bfseries\sffamily}
\def\uvh@font@header{\fontsize{8}{10pt}\selectfont\mdseries\sffamily}
\def\uvh@font@footer{\fontsize{8}{10pt}\selectfont\sffamily}
\def\uvh@font@headertitle{\fontsize{8}{10pt}\selectfont\sffamily}
\def\uvh@font@eventlocdate{\fontsize{11}{13pt}\selectfont\mdseries\sffamily}

\setkomafont{part}{\fontsize{16}{18pt}\bfseries}
\setkomafont{partnumber}{\usekomafont{part}}
\setkomafont{sectioning}{\uvh@font@sections}
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
\newsavebox{\uvh@box@logo}

% Aux linebreak macro, since \\ is redefined by beamer article
\newcommand\umbruch[1][]{\linebreak\ifx\@empty#1\else\vspace{#1}\fi}


%% ============================================================
%% 1 Personal data
%% ============================================================

% a.) department
\def\uvh@department@de{\empty}
\def\uvh@department@en{\empty}
\newcommand*\hoDept[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@department@en{#2}
  \else\def\uvh@department@en{#1}\fi
  \def\uvh@department@de{#2}
}

% b.) Name & function
\def\uvh@name@de{}
\def\uvh@name@en{}
\newcommand*\hoName[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@name@en{#2}
  \else\def\uvh@name@en{#1}\fi
  \def\uvh@name@de{#2}
}
\def\uvh@shortname@de{}
\def\uvh@shortname@en{}
\newcommand*\hoShortName[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@shortname@en{#2}
  \else\def\uvh@shortname@en{#1}\fi
  \def\uvh@shortname@de{#2}
}
%
\def\uvh@function@de{}
\def\uvh@function@en{}
\newcommand*\hoFunction[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@function@en{#2}
  \else\def\uvh@function@en{#1}\fi
  \def\uvh@function@de{#2}
}

% c.) A collaborator's name & function
\def\uvh@secname{}
\newcommand*\hoSecName[1]{\def\uvh@secname{#1}}
\def\uvh@shortsecname{}
\newcommand*\hoShortSecName[1]{\def\uvh@shortsecname{#1}}
%
\def\uvh@secfunction@de{}
\def\uvh@secfunction@en{}
\newcommand*\hoSecFunction[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@secfunction@en{#2}
  \else\def\uvh@secfunction@en{#1}\fi
  \def\uvh@secfunction@de{#2}
}

% d.) Department address
\def\uvh@street{}
\newcommand*\hoStreet[1]{\def\uvh@street{#1}}
%
\def\uvh@postcode{}
\newcommand*\hoPostCode[1]{\def\uvh@postcode{#1}}
%
\def\uvh@location@de{}
\def\uvh@location@en{}
\newcommand*\hoLoc[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@location@en{#2}
  \else\def\uvh@location@en{#1}\fi
  \def\uvh@location@de{#2}
}
%
\def\uvh@country@de{}
\def\uvh@country@en{}
\newcommand*\hoCountry[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@country@en{#2}
  \else\def\uvh@country@en{#1}\fi
  \def\uvh@country@de{#2}
}

% e.) Contact
\def\uvh@phone{}
\newcommand*\hoPhone[1]{\def\uvh@phone{#1}}
%
\def\uvh@fax{}
\newcommand*\hoFax[1]{\def\uvh@fax{#1}}
%
\def\uvh@email{}
\newcommand*\hoEMail[1]{\def\uvh@email{#1}}
%
\def\uvh@url{}
\newcommand*\hoUrl[1]{\def\uvh@url{#1}}


%% ============================================================
%% 2 Titling
%% ============================================================

% a.) Handout title
\def\uvh@title{}
\def\uvh@title@header{~}
\newcommand{\hoTitle}[2][\@empty]%
{%
  \ifx\@empty#1\def\uvh@title@header{#2}
  \else\def\uvh@title@header{#1}\fi
  \def\uvh@title{#2}
  \thispagestyle{firstpage}%
}
\def\uvh@titleprefix{}
\newcommand{\hoTitlePrefix}[1]
{%
  \def\uvh@titleprefix{#1}%
}

% b.) Handout subtitle
\def\uvh@subtitle{}
\def\uvh@widesubtitle{}
\newcommand{\hoSubtitle}{\@ifstar{\@@hoSubtitle}{\@hoSubtitle}}
% Starred version: wide subtitle
\newcommand{\@hoSubtitle}[1]
{%
  \if@uvh@widestitle
    \def\uvh@widesubtitle{#1}%
  \else
    \def\uvh@subtitle{#1}%
  \fi
}
% Unstarred version: normal (narrow) subtitle
\newcommand{\@@hoSubtitle}[1]
{%
  \def\uvh@widesubtitle{#1}%
}

% c.) Event title 
\def\uvh@event{}
\def\uvh@event@header{~}
\newcommand*{\hoEvent}[2][\@empty]{%
  \ifx\@empty#1\def\uvh@event@header{#2}
  \else\def\uvh@event@header{#1}\fi
  \def\uvh@event{#2}
}

% d.) Event location
\def\uvh@eventlocation{}
\def\uvh@eventlocation@header{}
\newcommand*{\hoEventLoc}[2][\@empty]{%
  \ifx\@empty#1\def\uvh@eventlocation@header{#2}
  \else\def\uvh@eventlocation@header{#1}\fi
  \def\uvh@eventlocation{#2}
}

% e.) Event date
\def\uvh@eventdate{}
\def\uvh@eventdate@header{}
\newcommand*{\hoEventDate}[2][\@empty]{%
  \ifx\@empty#1\def\uvh@eventdate@header{#2}
  \else\def\uvh@eventdate@header{#1}\fi
  \def\uvh@eventdate{#2}
}

% The maketitle routine
\renewcommand\maketitle{%
  \newif\ifuvh@eventline\uvh@eventlinefalse%
  \ifx\uvh@event\empty\else\uvh@eventlinetrue\fi%
  \ifx\uvh@eventdate\empty\else\uvh@eventlinetrue\fi%
  \ifx\uvh@eventlocation\empty\else\uvh@eventlinetrue\fi%
  \vspace*{\beforetitling}%
  \hspace*{\titleoffset}%
  \begin{minipage}[t]{0.63\columnwidth}%
    \raggedright%
    \ifx\uvh@event\empty%
    \else
      \vspace*{\beforeevent}\bgroup\uvh@font@event\uvh@event\egroup\ifx\uvh@eventlocation\empty\else\par\fi%
    \fi%
    \ifx\uvh@eventlocation\empty%
    \else
      \bgroup\uvh@font@eventlocdate\uvh@eventlocation\egroup%
    \fi%
    \ifx\uvh@eventdate\empty%
    \else%
      \bgroup\uvh@font@eventlocdate{} (\uvh@eventdate)\egroup%
    \fi%
    \ifuvh@eventline\par\fi
    \ifx\uvh@title\empty%
    \else
      \vspace{\beforetitle}%
      \ifx\uvh@titleprefix\empty%
        \parbox{\textwidth}{\raggedright\uvh@font@title\uvh@title}\par%
        \ifx\uvh@subtitle\empty%
        \else
           \vspace{\beforesubtitle}\noindent\bgroup\raggedright\uvh@font@subtitle\uvh@subtitle\par\egroup%
        \fi
      \else%
        \vspace{.15\baselineskip}%
        \begin{minipage}{\textwidth}
           \begin{tabularx}{\columnwidth}{@{}l@{\enskip}>{\raggedright\arraybackslash}X}
              \uvh@font@title\uvh@titleprefix & \uvh@font@title\uvh@title \tabularnewline
              \ifx\uvh@subtitle\empty%
              \else
                 \noalign{\vspace{\beforesubtitle}}%
                 & \uvh@font@subtitle\uvh@subtitle \tabularnewline
              \fi
           \end{tabularx}%
        \end{minipage}%
      \fi
      \@ifundefined{hypersetup}{}{%
          \hypersetup{pdftitle=\ifx\uvh@titleprefix\empty\else\uvh@titleprefix~\fi\uvh@title,
                      pdfauthor=\uvh@name,
                      pdfcreator={LaTeX2e via LyX}}}%
    \fi%
  \end{minipage}\par%
  \ifx\uvh@widesubtitle\empty%
  \else%
    \vspace{\beforesubtitle}\bgroup\noindent\raggedright\uvh@font@subtitle\uvh@widesubtitle\par\egroup%
  \fi%
  \vspace{\aftertitle}%
  \@afterindentfalse\@afterheading%
}

% Easy way to change bibliography heading
\def\uvh@bibheading{\refname}
\newcommand*\Bibheading[1]{\def\uvh@bibheading{#1}}

% Adjust logo positioning for landscape
\newlength\lsoffset
\if@uvh@landscape
  \setlength\lsoffset{8cm}
  \addtolength\headeroffset{\lsoffset}
\fi


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


%% ============================================================
%% Page styles
%% ============================================================

%
% First page

\def\ps@firstpage{
  \sbox{\uvh@box@logo}{\uvh@printlogo}
  \def\uvh@thelogo{\parbox{74mm}{\usebox{\uvh@box@logo}}}
  \headheight30mm\headsep2.5mm\footskip8mm
  \def\@oddhead{%
    \unitlength1mm
    \hspace*{\headeroffset}
    \begin{picture}(0,0)
       \put(84.5,19){\uvh@thelogo}
       \put(107,8){%
         \parbox[t]{51.5mm}
          {\normalsize\parbox[t]{\linewidth}{%
             \begin{flushleft}%
               \if\uvh@department\empty\else\vspace*{8pt}\uvh@font@department\uvh@department\umbruch[3pt]\umbruch\fi%
               \uvh@font@header\uvh@name%
               \if\uvh@function\empty\else\umbruch\uvh@function\fi%
               \if\uvh@street\empty\else\umbruch\uvh@street\fi%
               \if\uvh@location\empty\else\umbruch\uvh@postcode~\uvh@location\fi%
               \vspace{10pt}%
               \if\uvh@phone\empty\else\umbruch\ifx\uvh@phoneprefix\empty\else\uvh@phoneprefix\ \fi\uvh@phone\fi%
               \if\uvh@fax\empty\else\umbruch\ifx\uvh@faxprefix\empty\else\uvh@faxprefix\ \fi\uvh@fax\fi%
               \if\uvh@email\empty\else\umbruch\ifx\uvh@emailprefix\empty\else\uvh@emailprefix\ \fi\uvh@email\fi%
               \ifx\uvh@url\empty\else\umbruch\ifx\uvh@urlprefix\empty\else\uvh@urlprefix\ \fi\uvh@url\fi%
             \end{flushleft}%
           }%
         }%
      }
      \if@uvh@punchmark
        \put(-27,-112){\line(1,0){4}}
      \fi
      \if@uvh@foldmarks
        \put(-33,-56){\line(1,0){3}}
        \put(-33,-168){\line(1,0){3}}
      \fi
    \end{picture}
   \hfill%
  }
  \if@uvh@pageonfirst
    \def\@oddfoot{\hfill\uvh@font@footer\raggedright\uvh@pageprefix~\thepage\if@uvh@lastpage /\pageref{LastPage}\fi}
  \else
    \def\@oddfoot{}
  \fi
  \def\@evenhead{\@oddhead}
  \def\@evenfoot{\@oddfoot}
}

%
% Pages > 1

\newif\if@uvh@noevent\@uvh@noeventfalse

\def\heventtitlesep{}

\def\ps@headings{%
  \let\orig@and\and%
  \def\and{$\cdot$\ }%
  \if@uvh@nopplogo\else\sbox{\uvh@box@logo}{\uvh@printsmalllogo}\fi
  \def\uvh@thelogo{\parbox{90mm}{\usebox{\uvh@box@logo}}}
  \headheight30mm\headsep2.5mm\footskip8mm
  \def\titleline{\ifx\uvh@title@header\empty\else\uvh@font@headertitle%
                 \ifx\uvh@titleprefix\empty\else\uvh@titleprefix~\fi%
                 \uvh@title@header\linebreak\fi}%
  \ifx\uvh@eventlocation@header\empty\ifx\uvh@eventdate@header\empty\@uvh@noeventtrue\fi\fi%
  \def\eventline{%
      \uvh@font@header\uvh@event@header\ifx\uvh@eventdate@header\empty\else\if@uvh@breakevent\linebreak\else\ \fi%
      \if@uvh@noevent\else(\ifx\uvh@eventlocation@header\empty\else\uvh@eventlocation@header, \fi\uvh@eventdate@header)\fi\linebreak\fi%
  }
  \def\@oddhead{%
    \unitlength1mm
    \hspace{\headeroffset}
    \begin{picture}(0,0)
       \put(106.2,15){\uvh@thelogo}
       \put(-8,25){%
         \hspace*{-\lsoffset}%
         \parbox[t]{120mm}
          {\normalsize\parbox[t]{100mm}{%
            \begin{flushleft}%
              \uvh@font@header\if\hfuzz\uvh@shortname\hfuzz\uvh@name\else\uvh@shortname\fi
               \if\uvh@department\empty\else\uvh@headerdeptsep\uvh@department\fi\linebreak
              \if@uvh@swaphead
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
  \def\@oddfoot{\hfill\uvh@font@footer\raggedright\uvh@pageprefix~\thepage\if@uvh@lastpage /\pageref{LastPage}\fi}
  \def\@evenhead{\@oddhead}
  \def\@evenfoot{\@oddfoot}
  \let\and\orig@and%
}


%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

%% captionlabel bold
\setkomafont{captionlabel}{\bfseries}

\if@uvh@captionp
    \RequirePackage[format=plain,
	            justification=RaggedRight,
	            singlelinecheck=false
	           ]{caption}
\fi

%% =============================================================
%% POLYGLOSSIA:
%% =============================================================

\if@uvh@polyglossia
  \if@uvh@captionp
    \RequirePackage{ragged2e}
  \fi
  \RequirePackage{polyglossia}
\fi

%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\if@uvh@biblatex

\if@uvh@apa
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

% End of @uvh@apa condition
\fi

\DeclarePrintbibliographyDefaults{title=\uvh@bibheading}

% End of @uvh@biblatex condition
\fi

% Smaller
\renewcommand*{\bib@beginhook}{\footnotesize}

% Custom heading
\AtBeginDocument{%
  \renewcommand*\bib@heading{\section*{\uvh@bibheading}}
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
\if@uvh@microtype
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
\def\UrlFont{\rmfamily\itshape}

% Covington
\if@uvh@covington
  \RequirePackage{covington}
  \renewcommand{\p@equation}[1]{(#1)}
\fi


%% =============================================================
%% X-REFS:
%% =============================================================

\if@uvh@refsp

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

\if@uvh@draftmark

\if@uvh@draftmarkfp
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

%% ============================================================
%% Semantic markup
%% ============================================================

\newcommand\Expression[1]{\textit{#1}}
\newcommand\Concept[1]{\textsc{#1}}
\newcommand\Meaning[1]{\enquote*{#1}}

\endinput
%%
%% End of file `univie-ling-handout.cls'.
