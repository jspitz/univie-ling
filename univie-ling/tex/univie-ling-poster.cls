%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-handout
%%
%% Scientific Posters in (Applied) Linguistics at the University of Vienna
%%
%% This file is part of the univie-ling LaTeX bundle, consisting of:
%%  -- univie-ling-handout.cls: Class for Handouts (this file)
%%  -- univie-ling-expose.cls: Class for PhD Research Proposals
%%  -- univie-ling-handout.cls: Class for student papers
%%  -- univie-ling-poster.cls: Class for posters
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
\ProvidesClass{univie-ling-poster}[2022/12/06 v.2.2 Univie Ling poster class (JSp)]

%% ============================================================
%% CLASS OPTIONS
%% ============================================================

\newif\if@uvpt@apa\@uvpt@apafalse
\newif\if@uvpt@biblatex\@uvpt@biblatextrue
\newif\if@uvpt@captionp\@uvpt@captionptrue
\newif\if@uvpt@covington\@uvpt@covingtontrue
\newif\if@uvpt@draftmark\@uvpt@draftmarkfalse
\newif\if@uvpt@portrait\@uvpt@portraitfalse
\newif\if@uvpt@microtype\@uvpt@microtypetrue
\newif\if@uvpt@otffonts\@uvpt@otffontsfalse
\newif\if@uvpt@polyglossia\@uvpt@polyglossiafalse
\newif\if@uvpt@pplogo\@uvpt@pplogotrue
\newif\if@uvpt@psfonts\@uvpt@psfontstrue
\newif\if@uvpt@refsp\@uvpt@refsptrue
\newif\if@uvpt@tcolorbox\@uvpt@tcolorboxtrue
\newif\if@uvpt@usefontenc\@uvpt@usefontenctrue
\def\uvpt@fontenc{T1}
\def\uvpt@fontsize{11}
\def\uvpt@papersize{a0}
\def\uvpt@scale{1.4}
\def\uvpt@logoscale{3.42}
\def\uvpt@department@de{Institut f\"ur Sprachwissenschaft}
\def\uvpt@department@en{Department of Linguistics}
\def\uvpt@logo@event@sep{\\[.5em]}
\def\uvpt@event@location@sep{\\[.5em]}
\def\uvpt@location@date@sep{ $\cdot$ }

% German CD (default)
\def\uvpt@cd@german{
    \def\uvpt@university{Universit\"at Wien}
    \def\uvpt@department{\uvpt@department@de}
}
\def\uvpt@cd@english{%
    \def\uvpt@university{University of Vienna}
    \def\uvpt@department{\uvpt@department@en}
}
\uvpt@cd@german

% We use l3keys here since (1) LaTeX2e keys are rather
% new and (2) do not provide for choice keys yet.
\ExplSyntaxOn
\keys_define:nn { uvpt }
{
    % all=<true|false>
    % Load all (most) packages
    all.code:n = 
      { \str_if_eq:NNTF { #1 } { true }
         {
            \@uvpt@biblatextrue
            \@uvpt@captionptrue
            \@uvpt@refsptrue
            \@uvpt@covingtontrue
            \@uvpt@microtypetrue
            \@uvpt@tcolorboxtrue
         }{
            \@uvpt@biblatexfalse
            \@uvpt@captionpfalse
            \@uvpt@refspfalse
            \@uvpt@covingtonfalse
            \@uvpt@microtypefalse
            \@uvpt@tcolorboxfalse
         }
      },
    all.default:n = { true },
    all.usage:n = preamble,
    % apa=<true|false>
    % Load APA style
    apa.legacy_if_set:n = @uvpt@apa,
    apa.usage:n = preamble,
    % biblatex=<true|false>
    % Load biblatex
    biblatex.legacy_if_set:n = @uvpt@biblatex,
    biblatex.usage:n = preamble,
    % caption=<true|false>
    % Load caption
    caption.legacy_if_set:n = @uvpt@captionp,
    caption.usage:n = preamble,
    % covington=<true|false>
    % Load covington
    covington.legacy_if_set:n = @uvpt@covington,
    covington.usage:n = preamble,
    % fontenc=<value|none>
    % customize font encoding
    fontenc.code:n = 
      { \str_if_eq:NNTF { #1 } { none }
         {
           \@uvpt@usefontencfalse
         }{
           \def\uvpt@fontenc{#1}
         }
      },
    fontenc.usage:n = preamble,
    % fontsize=<size>
    % Set base font size
    fontsize.tl_set:N = \uvpt@fontsize,
    fontsize.usage:n = preamble,
    % portrait=<true|false>
    % Set portrait
    portrait.legacy_if_set:n = @uvpt@portrait,
    portrait.usage:n = preamble,
    % microtype=<true|false>
    % Load microtype
    microtype.legacy_if_set:n = @uvpt@microtype,
    microtype.usage:n = preamble,
    % papersize=<size>
    % Set paper size
    papersize .choice:,
    % A0
    papersize / a0 .code:n = { \def\uvpt@papersize{#1} },
    % A1
    papersize / a1 .code:n = { 
       \def\uvpt@papersize{#1}
       \def\uvpt@logoscale{2.42}
    },
    % A2
    papersize / a2 .code:n = {
       \def\uvpt@papersize{#1}
       \def\uvpt@logoscale{1.72}
    },
    % A3
    papersize / a3 .code:n = {
       \def\uvpt@papersize{#1}
       \def\uvpt@logoscale{1.16}
    },
    % A4
    papersize / a4 .code:n = {
       \def\uvpt@papersize{#1}
       \def\uvpt@logoscale{.79}
    },
    papersize.usage:n = preamble,
    % scale=<double>
    scale.code:n = { \def\uvpt@scale{#1} },
    scale.usage:n = preamble,
    % polyglossia=<true|false>
    % Load polyglossia
    polyglossia.code:n = 
      { \str_if_eq:NNTF { #1 } { true }
        {
           \@uvpt@psfontsfalse
           \@uvpt@otffontstrue
           \@uvpt@polyglossiatrue
        }{
           \@uvpt@polyglossiafalse
        }
      },
    polyglossia.default:n = { true },
    polyglossia.usage:n = preamble,
    % ref=<true|false>
    % Load varioref and prettyref
    ref.legacy_if_set:n = @uvpt@refsp,
    ref.usage:n = preamble,
    % cd=<german|english>
    % CD Language
    cd .choice:,
    % german
    cd / german .code:n = { \uvpt@cd@german },
    % english
    cd / english .code:n = { \uvpt@cd@english },
    % draftmark=<true|false>
    % Print draftmark
    draftmark.legacy_if_set:n = @uvpt@draftmark,
    draftmark.usage:n = preamble,
    % tcolorbox=<true|false>
    % Load tcolorbox
    tcolorbox.legacy_if_set:n = @uvpt@tcolorbox,
    tcolorbox.usage:n = preamble,
    % fonts=<ps|otf|none>
    % Select font scheme
    fonts .choice:,
    % ps: use PostScript fonts (classic LaTeX)
    fonts / ps .code:n = 
      { \@uvpt@psfontstrue
        \@uvpt@otffontsfalse
      },
    % otf: use OpenType fonts (fontspec)
    fonts / otf .code:n = 
      { \@uvpt@psfontsfalse
        \@uvpt@otffontstrue
      },
    % none: Use no font package
    fonts / none .code:n = 
      { \@uvpt@psfontsfalse
        \@uvpt@otffontsfalse
      },
}
\ExplSyntaxOff

% Process

\IfFormatAtLeastTF{2022-06-01}
{
  \ProcessKeyOptions[uvpt]
}{
  \RequirePackage{l3keys2e}
  \ProcessKeysOptions{uvpt}
}


%% ============================================================
%% LOAD REQUIRED BASE CLASS AND PACKAGES
%% ============================================================

% Base class: beamer
\PassOptionsToClass{fontsize=\uvpt@fontsize,oneside}{beamer}
\if@uvpt@portrait
  \PassOptionsToPackage{orientation=portrait}{beamerposter}
\fi
\PassOptionsToPackage{size=\uvpt@papersize,scale=\uvpt@scale}{beamerposter}

\LoadClass{beamer}[1997/04/16]

\mode<presentation>

% plus beamerposter
\RequirePackage{etoolbox}
\AtEndPreamble{%
  \RequirePackage{beamerposter}
}

\RequirePackage{amssymb}

\if@uvpt@psfonts
  \if@uvpt@usefontenc
    \RequirePackage[\uvpt@fontenc]{fontenc}
  \fi
  % Source Pro fonts
  \RequirePackage[default,osf]{sourceserifpro}
  \RequirePackage[osf]{sourcesanspro}
  \RequirePackage{sourcecodepro}
\fi

\if@uvpt@otffonts
  \RequirePackage{fontspec}
  % Source Pro fonts
  \setmainfont{SourceSerifPro}[Numbers=OldStyle]
  \setsansfont{SourceSansPro}[Numbers=OldStyle]
  \setmonofont{SourceCodePro}
\fi


%% ============================================================
%% FONTS
%% ============================================================

\setbeamerfont{title in headline}{size=\veryHuge,parent=structure,series=\bfseries,family=\sffamily}
\setbeamerfont{subtitle in headline}{size=\Large,parent=structure,series=\bfseries,family=\sffamily}
\setbeamerfont{author in headline}{size=\large,series=\mdseries,family=\sffamily}
\setbeamerfont{event title}{size=\large,series=\bfseries,family=\sffamily}
\setbeamerfont{event location}{size=\large,series=\mdseries,family=\sffamily}
\setbeamerfont{event date}{size=\large,series=\mdseries,family=\sffamily}
\setbeamerfont{footline}{size=\small,family=\sffamily}
\setbeamerfont{univieunit}{size=\large,series=\bfseries,family=\sffamily}
\setbeamerfont{block title}{family=\sffamily,size=\large}
\setbeamerfont{block example title}{family=\sffamily,size=\large}
\setbeamerfont{block title alerted}{family=\sffamily,size=\large}

\RequirePackage{url}
\def\UrlFont{\rmfamily\itshape\color{black}}

%% ============================================================
%% COLORS
%% ============================================================

\usecolortheme{default}
\definecolor{univie@blue}{RGB}{0,102,153}
\definecolor{univie@grey}{RGB}{102,102,102}
\definecolor{univie@red}{RGB}{179,7,56}
\definecolor{univie@green}{RGB}{17,137,122}
\setbeamercolor{structure}{fg=univie@blue}
\setbeamercolor{univieunit}{fg=univie@grey}
\setbeamercolor{titlelike}{fg=black}
\setbeamercolor{title}{fg=univie@blue}
\setbeamercolor{frametitlelike}{fg=univie@blue}
\setbeamercolor{frametitle}{parent=frametitlelike}
\setbeamercolor{framesubtitle}{parent=frametitle}
\setbeamercolor{mini frame}{parent=structure}
\setbeamercolor{sepline}{fg=univie@grey,bg=univie@grey}
\setbeamercolor{titlebox}{fg=white,bg=univie@blue}
\setbeamercolor{footline}{fg=black}
\setbeamercolor{itemize item}{fg=univie@blue}
\setbeamercolor*{block body}{bg=white,fg=black}
\setbeamercolor*{block title}{fg=white,bg=univie@blue}
\setbeamercolor*{block example body}{bg=white,fg=black}
\setbeamercolor*{block example title}{fg=white,bg=univie@green}
\setbeamercolor*{block body alerted}{bg=white,fg=black}
\setbeamercolor*{block title alerted}{fg=white,bg=univie@red}
\setbeamercolor*{item projected}{fg=white,bg=univie@grey}


%% ============================================================
%% LENGTHS
%% ============================================================

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

% Aux linebreak macro, since \\ is redefined by beamer article
\newcommand*\umbruch[1][]{\linebreak\ifx\@empty#1\else\vspace{#1}\fi}


%% ============================================================
% LOGO
%% ============================================================

% Construct matching logo/institute entity
% (size of institute string should equal logo width)
\newsavebox{\uvpt@box@logoplain}
\pgfdeclareimage[width=73mm]{univielogo}{univielogo}
\pgfdeclareimage[width=73mm]{univielogo-bw}{univielogo-sw}
\savebox{\uvpt@box@logoplain}{%
  \parbox[t]{100mm}{\pgfuseimage{univielogo}}%
}

% Scale logo/institute entity for default paper size (A0)
\newsavebox{\uvpt@box@logo}
\sbox{\uvpt@box@logo}{\scalebox{\uvpt@logoscale}{\usebox{\uvpt@box@logoplain}}}

% Adjust logo positioning for landscape
\newlength\lsoffset
\if@uvpt@portrait\else
  \setlength\lsoffset{8cm}
  \addtolength\headeroffset{\lsoffset}
\fi


%% ============================================================
%% BASE THEMES
%% ============================================================

% Load base inner theme
\useinnertheme{default}

% Load base outer theme
\useoutertheme{default}


%% ============================================================
%% HEADER & FOOTER
%% ============================================================

% Headline
\newlength\titleindent
\newlength\restwidth
\newlength\univieposter@leftmargin
\defbeamertemplate*{headline}{univie}
{%
  \if@uvpt@portrait
    \setlength\titleindent{.09\paperwidth}
    \setlength\restwidth{.991\paperwidth}
  \else
    \setlength\titleindent{.065\paperwidth}
    \setlength\restwidth{.935\paperwidth}
  \fi
  \begin{columns}
    \begin{column}{\titleindent}
    \end{column}
    \begin{column}{0.475\textwidth}
      \begin{beamercolorbox}[wd=\columnwidth,sep=.028\textwidth]{univieunit}
        \usebox{\uvpt@box@logo}\par
        \vspace*{.7em}\hspace*{\titleindent}\usebeamerfont{univieunit}\usebeamercolor[fg]{univieunit}\uvpt@department
     \end{beamercolorbox}
    \end{column}
    \begin{column}{0.48\textwidth}
      \begin{beamercolorbox}[wd=\columnwidth,right,sep=\beamer@rightmargin]{}
         % Event information
         \ifx\inserlogo\@empty\else%
            \insertlogo
            \ifx\uvpt@eventtitle\@empty\else%
              \uvpt@logo@event@sep
            \fi
         \fi%
         \ifx\uvpt@eventtitle\@empty\else%
           {\usebeamerfont{event title}\uvpt@eventtitle%
           \ifx\uvpt@eventlocation\@empty\else%
             \uvpt@event@location@sep
           \fi}
        \fi%
        \ifx\uvpt@eventlocation\@empty\else%
           {\usebeamerfont{event location}\uvpt@eventlocation%
           \ifx\uvpt@eventdate\@empty\else%
              \uvpt@location@date@sep
           \fi}
        \fi
        \ifx\uvpt@eventdate\@empty\else%
           {\usebeamerfont{event date}\uvpt@eventdate}
        \fi
      \end{beamercolorbox}
    \end{column}
  \end{columns}
  \vspace*{-1.8mm}
  \begin{beamercolorbox}[sep=.014\textwidth]{titlebox}
     \hspace*{\titleindent}\hspace{.013\textwidth}%
     \begin{minipage}{.8\textwidth}%
        \usebeamerfont{title in headline}\inserttitle\par%
        \ifx\insertsubtitle\@empty%
        \else%
           \vskip.2em%
           {\usebeamerfont{subtitle in headline}\insertsubtitle\par}%
        \fi%
        \ifx\insertauthor\@empty%
        \else%
          \vskip.4em%
          {\usebeamerfont{author in headline}\insertauthor\par}
        \fi
      \end{minipage}
  \end{beamercolorbox}
}

% Footline
\defbeamertemplate*{footline}{univie}
{%
  \begin{beamercolorbox}[wd=\textwidth,ht=.2mm]{sepline}
  \end{beamercolorbox}
  \vspace*{.25\footheight}
  \hspace{\beamer@leftmargin}%
  \usebeamerfont{footline}%
  \ifx\beamer@shortdate\@empty%
  \else
    \hspace*{-\univieposter@leftmargin}\hspace{\beamer@rightmargin}\insertshortdate%
  \fi
  \hfill
  \insertshortauthor\hspace*{\beamer@rightmargin}
  \vskip2ex
}


%% ============================================================
%% BLOCKS
%% ============================================================

% Standard block
\setbeamertemplate{block begin}{%
  \vskip.75ex
  \begin{beamercolorbox}[rounded=true,colsep=.75ex,leftskip=1cm]{block title}%
    \usebeamerfont*{block title}\insertblocktitle
  \end{beamercolorbox}%
  {\ifbeamercolorempty[bg]{block body}{}{\nointerlineskip\vskip-0.5pt}}%
  \usebeamerfont{block body}%
  \begin{beamercolorbox}[rounded=true,colsep=.75ex,sep=1ex,leftskip=.3em,vmode]{block body}%
    \ifbeamercolorempty[bg]{block body}{\vskip-.25ex}{\vskip-.75ex}\vbox{}%
}
\setbeamertemplate{block end}{%
  \end{beamercolorbox}
}

% Example block
\setbeamertemplate{block example begin}{%
  \vskip.75ex
  \begin{beamercolorbox}[rounded=true,colsep=.75ex,leftskip=1cm]{block example title}%
    \usebeamerfont*{block example title}\insertblocktitle
  \end{beamercolorbox}%
  {\ifbeamercolorempty[bg]{block example body}{}{\nointerlineskip\vskip-0.5pt}}%
  \usebeamerfont{block example body}%
  \begin{beamercolorbox}[rounded=true,colsep=.75ex,sep=1ex,leftskip=.3em,vmode]{block example body}%
    \ifbeamercolorempty[bg]{block example body}{\vskip-.25ex}{\vskip-.75ex}\vbox{}%
}
\setbeamertemplate{block example end}{%
  \end{beamercolorbox}
}

% Alert block
\setbeamertemplate{block alerted begin}{%
  \vskip.75ex
  \begin{beamercolorbox}[rounded=true,colsep=.75ex,leftskip=1cm]{block title alerted}%
    \usebeamerfont*{block title alerted}\insertblocktitle
  \end{beamercolorbox}%
  {\ifbeamercolorempty[bg]{block body alerted}{}{\nointerlineskip\vskip-0.5pt}}%
  \usebeamerfont{block body alerted}%
  \begin{beamercolorbox}[rounded=true,sep=1ex,colsep=.75ex,leftskip=.3em,vmode]{block body alerted}%
    \ifbeamercolorempty[bg]{block body alerted}{\vskip-.25ex}{\vskip-.75ex}\vbox{}%
}
\setbeamertemplate{block alerted end}{%
  \end{beamercolorbox}
}

% Aliases

\newenvironment{bluebox}[1]
   {\begin{block}{#1}%
    \setbeamercolor{itemize item}{fg=univie@blue}%
    \setbeamercolor{item projected}{bg=univie@blue,fg=white}}
   {\end{block}}

\newenvironment{redbox}[1]
   {\begin{alertblock}{#1}%
    \setbeamercolor{itemize item}{fg=univie@red}%
    \setbeamercolor{item projected}{bg=univie@red,fg=white}}
   {\end{alertblock}}

\newenvironment{greenbox}[1]
   {\begin{exampleblock}{#1}%
    \setbeamercolor{itemize item}{fg=univie@green}%
    \setbeamercolor{item projected}{bg=univie@green,fg=white}}
   {\end{exampleblock}}
   
\if@uvpt@tcolorbox

\newenvironment{blueframedbox}[1]
   {\begin{tcolorbox}[title={#1}]%
    \setbeamercolor{itemize item}{fg=univie@blue}%
    \setbeamercolor{item projected}{bg=univie@blue,fg=white}}
   {\end{tcolorbox}}

\newenvironment{redframedbox}[1]
   {\begin{tcolorbox}[title={#1},colback=univie@red!5!white,colframe=univie@red]%
    \setbeamercolor{itemize item}{fg=univie@red}%
    \setbeamercolor{item projected}{bg=univie@red,fg=white}}
   {\end{tcolorbox}}

\newenvironment{greenframedbox}[1]
   {\begin{tcolorbox}[title={#1},colback=univie@green!5!white,colframe=univie@green]%
    \setbeamercolor{itemize item}{fg=univie@green}%
    \setbeamercolor{item projected}{bg=univie@green,fg=white}}
   {\end{tcolorbox}}

\fi


%% ============================================================
%% LISTS
%% ============================================================

% Increase general list indentation
\setlength\leftmargini{3.5em}

% Itemize items
\defbeamertemplate*{itemize item}{univie}{%
  \raise1.25pt\hbox{\donotcoloroutermaths$\blacktriangleright$}%
}
\defbeamertemplate*{itemize subitem}{univie}{%
  \small\raise1.5pt\hbox{\donotcoloroutermaths$\blacktriangleright$}%
}
\defbeamertemplate*{itemize subsubitem}{univie}{%
  \small\raise1.5pt\hbox{\donotcoloroutermaths$\blacktriangleright$}%
}

% Enumerate items
\defbeamertemplate*{enumerate item}{univie}
{%
  \raisebox{.2ex}{%
    \usebeamerfont*{item projected}%
    \usebeamercolor[bg]{item projected}%
    \vrule width2.7ex height2ex depth.6ex%
    \hskip-2.7ex%
    \hbox to2.7ex{%
      \hfil%
      \color{fg}\insertenumlabel%
      \hfil}%
  }%
}
[action]
{\setbeamerfont{item projected}{size=\scriptsize}}

\setbeamercolor{item projected}{bg=univie@blue,fg=white}
\setbeamerfont{item projected}{family=\sffamily}

% Bibliography
\setbeamertemplate{bibliography item}[triangle]
\renewcommand{\@cite}[2]{\textcolor{structure}{#1\if@tempswa :\,#2\fi}}
\setbeamertemplate{bibliography entry title}{ }
\setbeamertemplate{bibliography entry location}{ }
\setbeamertemplate{bibliography entry note}{ }
\setbeamercolor{bibliography entry author}{use=structure,fg=structure.fg}
\setbeamercolor{bibliography entry title}{use=normal text,fg=normal text.fg}
\setbeamercolor{bibliography entry location}{use=normal text,fg=normal text.fg}
\setbeamercolor{bibliography entry note}{use=normal text,fg=normal text.fg}


%% ============================================================
%% MARGIN
%% ============================================================

% Adjust left margin to logo/title indentation
\AtEndPreamble{%
  \setlength\univieposter@leftmargin\beamer@leftmargin
  \addtolength\univieposter@leftmargin{.0155\paperwidth}
  \if@uvpt@portrait
    \addtolength\univieposter@leftmargin{.091\paperwidth}
  \else
    \addtolength\univieposter@leftmargin{.065\paperwidth}
  \fi
  \setbeamersize{text margin left=\univieposter@leftmargin}
}


%% ============================================================
%% MISC.
%% ============================================================

% Date: use leading zeros in month/day (e.g. 01/01/2015)
\newcommand{\leadingzero}[1]{\ifnum #1<10 0\the#1\else\the#1\fi}
\AtBeginDocument{%
  \@ifundefined{addto}{}{%
    \addto\captionsngerman{\def\datengerman{\def\today{\leadingzero{\day}.\leadingzero{\month}.\the\year}}}
    \addto\captionsenglish{\def\dateenglish{\def\today{\leadingzero{\day}/\leadingzero{\month}/\the\year}}}
  }%
}

% Disable beamer navigation symbols
\setbeamertemplate{navigation symbols}{}

% Numbered sections in toc
\setbeamertemplate{sections in toc}[sections numbered]

\mode
<all>


%% ============================================================
%% 1 Personal data
%% ============================================================

% a.) Department
\newcommand*\department[1]%
{%
  \def\uvpt@department{#1}
}

% b.) Event title 
\def\uvpt@eventtitle{}
\newcommand*{\eventtitle}[1]{%
  \def\uvpt@eventtitle{#1}%
}

% c.) Event location
\def\uvpt@eventlocation{}
\newcommand*{\eventlocation}[1]{%
  \def\uvpt@eventlocation{#1}%
}

% d.) Event date
\def\uvpt@eventdate{}
\newcommand*{\eventdate}[1]{%
  \def\uvpt@eventdate{#1}%
}

% e.) Event logo. We re-use beamer's \logo here
\let\eventlogo\logo

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


%% =============================================================
%% BOXES:
%% =============================================================

\if@uvpt@tcolorbox

\RequirePackage{tcolorbox}
% TColorbox settings
\tcbset{%
  colback=univie@blue!5!white,
  colframe=univie@blue,
  fontlower=\small\raggedleft,
  fonttitle=\sffamily\large,
  width=\textwidth,
  boxsep=.75ex,
  left=1cm%
}

\fi


%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

\if@uvpt@captionp
    \RequirePackage[format=plain,
                justification=RaggedRight,
                singlelinecheck=false
               ]{caption}
\fi

%% =============================================================
%% POLYGLOSSIA:
%% =============================================================

\if@uvpt@polyglossia
  \if@uvpt@captionp
    \RequirePackage{ragged2e}
  \fi
  \RequirePackage{polyglossia}
\else
  \RequirePackage{babel}[1997/01/23]
\fi

%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\if@uvpt@biblatex

\if@uvpt@apa
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

% End of @uvpt@apa condition
\fi

\DeclarePrintbibliographyDefaults{title=\uvpt@bibheading}

% End of @uvpt@biblatex condition
\fi

% Add indentation to bibliography
\long\def\beamer@biblabeltemplate#1{%
  \hspace*{1.1em}\def\insertbiblabel{#1}\usebeamertemplate*{bibliography item}\hfil%
}
\bibhang2em


%% ============================================================
%% MISC.
%% ============================================================

% Allow hyphenation after \slash
\def\slash{/\penalty\exhyphenpenalty\hskip\z@skip}

% Easy way to change bibliography heading
\def\uvpt@bibheading{\refname}
\newcommand*\Bibheading[1]{\def\uvpt@bibheading{#1}}


%% ============================================================
%% FURTHER PACKAGES
%% ============================================================

\RequirePackage{array}
\RequirePackage{ifthen}

% Micro-typographic polishment
\if@uvpt@microtype
   \RequirePackage{microtype}
\fi

% Quote (smaller)
\let\@uvpt@save@quote\quote
\renewcommand*{\quote}{\@uvpt@save@quote\small}

% Quotation (smaller)
\let\@uvpt@save@quotation\quotation
\renewcommand*{\quotation}{\@uvpt@save@quotation\small}

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
\if@uvpt@covington
  % Rename the beamer example(s) environment
  % to avoid warning
  \let\example\beamerexample
  \let\endexample\endbeamerexample
  \let\examples\beamerexamples
  \let\endexamples\endbeamerexamples
  \let\example\relax
  \let\examples\relax
  \RequirePackage{covington}
  \renewcommand{\p@equation}[1]{(#1)}
\fi


%% =============================================================
%% X-REFS:
%% =============================================================

\if@uvpt@refsp

\AtBeginDocument{%
  % Prettyref:
  \RequirePackage{prettyref}
  \newrefformat{sec}{\translate{section}~\ref{#1}}
  \newrefformat{sub}{\translate{section}~\ref{#1}}
  \newrefformat{anm}{\translate{footnote}~\ref{#1}}
  \newrefformat{app}{\appendixname~\ref{#1}}
  \newrefformat{tab}{\tablename~\ref{#1}}
  \newrefformat{fig}{\figurename~\ref{#1}}
  \newrefformat{exa}{\translate{example}~\ref{#1}}
}

\fi


%% =============================================================
%% DRAFT:
%% =============================================================

\if@uvpt@draftmark

\RequirePackage{draftwatermark}

\DraftwatermarkOptions{%
  angle=0,
  vpos=10pt,
  anchor=lt,
  fontsize=4ex,
  text={\translate{draft} (\today)}
}

\setbeamercolor{background canvas}{bg=}%transparent canvas

\fi

%% ============================================================
%% Semantic markup
%% ============================================================

\newcommand\Expression[1]{\textit{#1}}
\newcommand\Concept[1]{\textsc{#1}}
\newcommand\Meaning[1]{\enquote*{#1}}

\endinput
%%
%% End of file `univie-ling-poster.cls'.
