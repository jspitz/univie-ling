%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File univie-ling-wlg
%%
%% A layout suitable for the journal Wiener Linguistische Gazette (WLG)
%% (https://www.wlg.univie.ac.at/).
%%
%% This file is part of the univie-ling LaTeX bundle, consisting of:
%%  -- univie-ling-handout.cls: Class for Handouts
%%  -- univie-ling-expose.cls: Class for PhD Research Proposals
%%  -- univie-ling-paper.cls: Class for student papers
%%  -- univie-ling-poster.cls: Class for scientific posters
%%  -- univie-ling-thesis.cls: Class for BA, MA or PhD theses
%%  -- univie-ling-wlg.cls: Class for the journal Wiener Linguistische Gazette (this file)
%%  -- univielogo.pdf: University of Vienna logo (colored)
%%  -- univielogo-sw.pdf: University of Vienna logo (black/white)
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
\ProvidesPackage{univie-ling-wlg}[2025/06/13 v.2.10dev Univie WLG journal layout (JSp)]


%% ============================================================
%% CLASS OPTIONS:
%% ============================================================

\newif\if@wlg@biblatex\@wlg@biblatexfalse
\newif\if@wlg@covington\@wlg@covingtontrue
\newif\if@wlg@draftmark\@wlg@draftmarkfalse
\newif\if@wlg@draftmarkfp\@wlg@draftmarkfpfalse
\newif\if@wlg@expert\@wlg@expertfalse
\newif\if@wlg@titlepage\@wlg@titlepagefalse
\newif\if@wlg@specialprint\@wlg@specialprintfalse
\newif\if@wlg@review\@wlg@reviewfalse

% Define keys and values
\DeclareKeys[wlg]
{
    % biblatex=<true|false>
    % Load biblatex
    biblatex.legacy_if_set:n = @wlg@biblatex,
    biblatex.usage:n = preamble,
    % covington=<true|false>
    % Load covington
    covington.legacy_if_set:n = @wlg@covington,
    covington.usage:n = preamble,
    % expertfonts=<true|false>
    % Load MinionPro
    expertfonts.legacy_if_set:n = @wlg@expert,
    expertfonts.usage:n = preamble,
    % preprint=<true|false>
    preprint.legacy_if_set:n = @wlg@preprint,
    preprint.usage:n = preamble,
    % type=<paper|review>
    type .choice:,
    % paper
    type / paper .code:n = 
      { 
        \@wlg@reviewfalse
      },
    % review
    type / review .code:n = 
      { 
        \@wlg@reviewtrue
      },
    % no val equals paper
    type .default:n = {paper},
    % peerrev=<true|false>
    peerrev.legacy_if_set:n = @wlg@peerrev,
    peerrev.usage:n = preamble,
    % titlepage=<none|specialprint|issue>
    titlepage .choice:,
    % none
    titlepage / none .code:n = 
      { \@wlg@titlepagefalse
        \@wlg@specialprintfalse
      },
    % specialprint
    titlepage / specialprint .code:n = 
      { \@wlg@titlepagetrue
        \@wlg@specialprinttrue
      },
    % issue
    titlepage / issue .code:n = 
      { \@wlg@titlepagetrue
        \@wlg@specialprintfalse
      },
    % draftmark=<true|false|firstpage>
    % Print draftmark
    draftmark .choice:,
    % true
    draftmark / true .code:n = 
      { \@wlg@draftmarktrue
        \@wlg@draftmarkfpfalse
      },
    % false
    draftmark / false .code:n = 
      { \@wlg@draftmarkfalse
        \@wlg@draftmarkfpfalse
      },
    % firstpage
    draftmark / firstpage .code:n = 
      { \@wlg@draftmarktrue
        \@wlg@draftmarkfptrue
      },
    % no val equals to true
    draftmark .default:n = {true},
}

\ProcessKeyOptions[wlg]


%% ============================================================
%% BASE CLASS:
%% ============================================================

\LoadClass[12pt]{article}

%% ============================================================
%% PAGE LAYOUT:
%% ============================================================

\RequirePackage[
    footlines=2,
    paper=152mm:229mm,
    DIV=calc,
    twoside=semi
]{typearea}

\recalctypearea

% Headings and pagination:
% (scrlayer-scrpage)
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\RequirePackage[headsepline=true]{scrlayer-scrpage}
\renewcommand{\headfont}{\small\rmfamily}
\clearmainofpairofpagestyles
\ohead{\pagemark}
\automark{section}
\pagestyle{scrheadings}

%% ============================================================
%% CONFIGURATION:
%% ============================================================

% Current structure
\newcommand*\jedboard[1]{\def\wlg@jedboard{#1}}
\newcommand*\jeditors[1]{\def\wlg@jeditors{#1}}
% Old structure
\newcommand*\edboardAL[1]{\def\wlg@edboardAL{#1}}
\newcommand*\edboardGL[1]{\def\wlg@edboardGL{#1}}
\newcommand*\edboardHL[1]{\def\wlg@edboardHL{#1}}
\newcommand*\techboard[1]{\def\wlg@techboard{#1}}

\InputIfFileExists{univie-ling-wlg.cfg}

%% ============================================================
%% HELPERS:
%% ============================================================

\newif\if@wlg@inputeencloaded\@wlg@inputeencloadedfalse
\newcommand*\AfterInputencOrAtEndPreamble[1]{%
    \AddToHook{package/inputenc/after}{%
       #1%
      \@wlg@inputeencloadedtrue
    }
    \AddToHook{begindocument/before}{%
       \if@wlg@inputeencloaded\else
          #1%
       \fi%
   }%
}

%% ============================================================
%% FONTS UND MICROTYPOGRAPHY:
%% ============================================================

\if@wlg@expert
  % Roman Font: Adobe Minion (Expert)
  \RequirePackage[footnotefigures]{MinionPro}
  % Sans; Myriad
  \RequirePackage[medfamily,scale=0.925]{MyriadPro}
  % Mono: DejaVu
  \RequirePackage[scaled=0.83]{DejaVuSansMono}
\else
  % Roman Font: Crimson
  \RequirePackage[osf]{cochineal}
  % Enable bold and slanted in IPA
  \AddToHook{package/tipa/after}{%
     \DeclareFontFamilySubstitution{T3}{Cochineal-TOsF}{cmr}
  }
  % Sans: Alegreya
  \RequirePackage[osf,scaled=.9]{sourcesanspro}
  % Mono: DejaVu
  \RequirePackage[scaled=0.8]{DejaVuSansMono}
\fi

% Hyperlinks
\RequirePackage{url}
\newcommand{\urlprefix}{}
% Italic URLs
\def\UrlFont{\rmfamily\itshape}

% Format URL dates
\def\wlg@urldate{}
\newcommand*\SetURLDate[1]{\gdef\wlg@urldate{#1}}
\AddToHook{begindocument}{
  \RequirePackage[english,ngerman]{isodate}
  \numdate
  \providecommand*\urldate[1]{[\translate{urlaccess} \printdate{#1}]}
  % Convenience function
  \NewDocumentCommand\weblink{mo}{%
    \url{#1}%
    \IfNoValueTF{#2}%
        {\ifx\wlg@urldate\empty\else%
         \ \urldate{\wlg@urldate}%
        \fi}%
        {\ \urldate{#2}}%
  }
}

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
%% ACCESSIBILITY
%% ============================================================

\RequirePackage{xcolor}
\RequirePackage{graphicx}

% Tagging
\newif\if@wlg@tagging
\@wlg@taggingfalse
\AddToHook{package/tagpdf/after}{%
   \@ifpackagelater{graphicx}{2024/12/31}{
      \tagpdfsetup{page/exclude-header-footer=pagination}
      \@wlg@taggingtrue
   }{}
}

\newcommand*\wlg@license@logo{%
  \if@wlg@tagging%
    \includegraphics[alt="Logo Creative-Commons-Lizenz CC BY-NC-ND 4.0", width=8em]{\doclicenseImageFileName}%
  \else%
    \doclicenseImage%
  \fi%
}

\newcommand*\wlg@logo{%
  \if@wlg@tagging%
    \includegraphics[artifact, alt="Logo Wiener Linguistische Gazette"]{univie-ling-wlg-logo}%
  \else%
    \includegraphics{univie-ling-wlg-logo}%
  \fi%
}


%% ============================================================
%% LOCALIZATION
%% ============================================================

\RequirePackage{translator}
\languagealias{austrian}{German}
\languagealias{naustrian}{German}
\languagealias{ngerman}{German}
\deftranslation[to=German]{chapter}{Kapitel}
\deftranslation[to=English]{chapter}{chapter}
\deftranslation[to=German]{draft}{ENTWURF}
\deftranslation[to=English]{draft}{DRAFT}
\deftranslation[to=German]{section}{Abschnitt}
\deftranslation[to=English]{section}{section}
\deftranslation[to=German]{footnote}{Anm.}
\deftranslation[to=English]{footnote}{fn.}
\deftranslation[to=German]{example}{Beispiel}
\deftranslation[to=English]{example}{example}
\deftranslation[to=German]{argumentation}{Argumentation}
\deftranslation[to=English]{argumentation}{argumentation}
\deftranslation[to=German]{issue}{Ausgabe}
\deftranslation[to=English]{issue}{Issue}
\deftranslation[to=German]{review}{Rezension}
\deftranslation[to=English]{review}{Review}
\deftranslation[to=German]{reviewedby}{Besprochen von}
\deftranslation[to=English]{reviewedby}{Reviewed by}
\deftranslation[to=German]{univie}{Universit\"at Wien}
\deftranslation[to=English]{univie}{University of Vienna}
\deftranslation[to=German]{lingdep}{Institut f\"ur Sprachwissenschaft}
\deftranslation[to=English]{lingdep}{Department of Linguistics}
\deftranslation[to=German]{published}{Publiziert am}
\deftranslation[to=English]{published}{Published}
\deftranslation[to=German]{specialprint}{Sonderdruck aus:}
\deftranslation[to=English]{specialprint}{Special print from:}
\deftranslation[to=German]{peerrev}{Die Beitr\"age dieser Ausgabe wurden einer Doppelblindbegutachtung unterzogen.}
\deftranslation[to=English]{peerrev}{The papers of this issue have undergone double-blind peer review.}
\deftranslation[to=German]{preprintfrom}{Vorabdruck aus:}
\deftranslation[to=English]{preprintfrom}{Preprint from:}
\deftranslation[to=German]{preprint}{Vorabdruck}
\deftranslation[to=English]{preprint}{Preprint}
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
\deftranslation[to=German]{imp-editor}{Eigent\"umer, Herausgeber und Verleger}
\deftranslation[to=English]{imp-editor}{Owner, editor and publisher}
\deftranslation[to=German]{univie-address}{Sensengasse 3a\\1090 Wien\\\"Osterreich}
\deftranslation[to=English]{univie-address}{Sensengasse 3a\\1090 Vienna\\Austria}
\deftranslation[to=German]{edboard}{Redaktion}
\deftranslation[to=English]{edboard}{Editorial board}
\deftranslation[to=German]{jeditors}{Redaktion}
\deftranslation[to=English]{jeditors}{Editors}
\deftranslation[to=German]{jedboard}{Redaktioneller Beirat}
\deftranslation[to=English]{jedboard}{Editorial board}
\deftranslation[to=German]{techboard}{Technische Redaktion}
\deftranslation[to=English]{techboard}{Technical editor}
\deftranslation[to=German]{contact}{Kontakt}
\deftranslation[to=English]{contact}{Contact}
\deftranslation[to=German]{appform}{Die \emph{Wiener Linguistische Gazette} erscheint in loser Folge
                                     im Open-Access-Format.\\
                                     Alle Ausgaben ab Nr. 72 (2005) sind online verf\"ugbar.}
\deftranslation[to=English]{appform}{The \versal{WLG} journal is published in loose sequence and in
                                      open access format.\\
                                      All issues as of 72 (2005) are available online.}
\deftranslation[to=German]{applied}{Angewandte Sprachwissenschaft}
\deftranslation[to=English]{applied}{Applied Linguistics}
\deftranslation[to=German]{genhist}{Allgemeine Sprachwissenschaft}
\deftranslation[to=German]{general}{Allgemeine Sprachwissenschaft}
\deftranslation[to=German]{hist}{Historische Sprachwissenschaft}
\deftranslation[to=English]{genhist}{General and Historical Linguistics}
\deftranslation[to=English]{general}{General Linguistics}
\deftranslation[to=English]{hist}{Historical Linguistics}
\deftranslation[to=German]{license}{Dieses Werk unterliegt der Creative-Commons-Lizenz \doclicenseNameRef\\
                                    (Namensnennung -- Nicht kommerziell -- Keine Bearbeitungen)}
\deftranslation[to=English]{license}{This work is published under a Creative Commons \doclicenseNameRef\ license\\
                                    (Attribution-NonCommercial-NoDerivatives)}
\deftranslation[to=German]{urlaccess}{Abruf am:}
\deftranslation[to=English]{urlaccess}{last accessed:}


\AtBeginDocument{%
  \addto\captionsngerman{\renewcommand*\contentsname{Inhalt}}%
  \addto\captionsnaustrian{\renewcommand*\contentsname{Inhalt}}%
}
\AtEndPreamble{%
  % License
  \PassOptionsToPackage{%
     imagewidth=8em,
     imagedistance=1em,
     imagemodifier=-eu-88x31,
     hyphenation=RaggedRight,
     type={CC},
     modifier={by-nc-nd},
     version={4.0}}{doclicense}
  \RequirePackage{doclicense}
}

% Special description list for editorial board
\newlength{\edblength}
\newcommand*\ebdlabel[1]{\makebox[\labelwidth][r]{\normalfont\bfseries #1\hfill}}
\newenvironment{wlgedboard}[1][\translate{jedboard}:]
  {\list{}%
        {\settowidth\edblength{\textbf{#1}}
         \setlength\leftmargin{\edblength}
         \addtolength\leftmargin{\labelsep}
         \setlength\labelwidth{\edblength}
         \setlength\itemsep{0pt}
         \setlength\parsep{0pt}
         \setlength\parskip{0pt}
         \let\makelabel\ebdlabel}
  }
  {\endlist}

\newcommand\impressum{%
  \bgroup
  \scriptsize
  \noindent\textbf{\translate{imp-editor}:}\\
  \translate{univie}, \translate{lingdep}\\
  \translate{univie-address}
  \vspace*{-.5em}
  \begin{wlgedboard}
    \def\wlg@lb{}
    \ifcsname wlg@edboardAL\endcsname
      \item[\textbf{\translate{edboard}:}]
        \ifcsname wlg@edboardGL\endcsname
           \wlg@edboardGL\ (\translate{general}),%
           \def\wlg@lb{\\}%
        \fi
        \ifcsname wlg@edboardAL\endcsname
           \wlg@lb\wlg@edboardAL\ (\translate{applied}),%
           \def\wlg@lb{\\}%
        \fi
        \ifcsname wlg@edboardHL\endcsname
           \wlg@lb\wlg@edboardHL\ (\translate{hist})
        \fi
    \else
      \ifcsname wlg@jeditors\endcsname
        \item[\textbf{\translate{jeditors}:}]
            \wlg@jeditors%
      \fi
      \ifcsname wlg@jedboard\endcsname
        \item[\textbf{\translate{jedboard}:}]
           \wlg@lb\wlg@jedboard%
      \fi
    \fi
    \ifcsname wlg@techboard\endcsname
       \item[\textbf{\translate{techboard}:}] \wlg@techboard
    \fi
    \item[\textbf{\translate{contact}:}] \href{mailto:wlg@univie.ac.at}{wlg@univie.ac.at}
    \item[\textbf{Homepage:}] \expandafter\url{\wlgurl}
  \end{wlgedboard}
  \vspace*{-2em}
  \begin{wlgedboard}[\textbf{\textsc{issn}:}]
    \item[\textbf{\textsc{issn}:}] 2224-1876
    \item[\textbf{\textsc{nbn}:}] BI,078,1063
  \end{wlgedboard}
  \vspace*{-.5em}
  \if@wlg@peerrev
    \noindent\translate{peerrev}\par\vspace*{.5em}
  \fi
  \noindent\translate{appform}\par
  \setlength{\doclicense@hsize}{\textwidth-\doclicense@imagewidth-\doclicense@imagedistance}%
  \begin{center}
        \begin{minipage}{\doclicense@imagewidth}
          \wlg@license@logo%
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

\if@wlg@specialprint\else
  \RequirePackage{etoc}
  \etocstandardlines
  \etocsetstyle{part}
    {}
    {\vspace{12pt}\normalsize\bfseries\rmfamily}
    {\etocnumber. \etocname{}\par\vspace{10pt}}
    {}
  \etocsetstyle{chapter}
    {}
    {\normalsize\mdseries\rmfamily}
    {\etocname{}\dotfill\etocpage\par\vspace{10pt}}
    {}
  \setcounter{tocdepth}{0}
\fi

%% ============================================================
%% STRUCTURE
%% ============================================================

% Macrotypographic sectioning
\newif\if@wlg@mainmatter\@wlg@mainmattertrue
\newif\if@wlg@frontmatter\@wlg@frontmatterfalse
\newcommand*\frontmatter{%
  \if@twoside\cleardoubleoddpage\else\clearpage\fi
  \@wlg@mainmatterfalse\@wlg@frontmattertrue\pagenumbering{roman}%
  \def\computelastpage{\pageref{TotPages}}%
  \edef\startpageref{%
    \romannumeral\thestartpage\relax}%
}
\newcommand*\mainmatter{%
  \if@twoside\cleardoubleoddpage\else\clearpage\fi%
  \immediate\write\@auxout{\noexpand\newlabel{LastFrontPage}{{}{\arabic{page}}}}%
  \@wlg@mainmattertrue\@wlg@frontmatterfalse%
  \pagenumbering{arabic}%
  \def\computelastpage{\pageref{TotPages}}%
  \def\startpageref{\thestartpage}%
}
\newcommand*\backmatter{%
  \if@openright\cleardoubleoddpage\else\clearpage\fi\@wlg@mainmatterfalse\@wlg@frontmatterfalse%
  \def\computelastpage{\pageref{TotPages}}%
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
\AfterInputencOrAtEndPreamble{%
  \RequirePackage{csquotes}
  \ExecuteQuoteOptions{autostyle=try,german=guillemets,austrian=guillemets,maxlevel=3}
  \AfterPackage*{biblatex}{%
     % Change cite command for integrated csquotes env.
     \SetCiteCommand{\parencite}
  }
  \renewcommand{\mktextdel}[1]{[\,]}
}

% Conditional page break
\def\condbreak#1{%
\vskip 0pt plus #1\pagebreak[3]\vskip 0pt plus -#1\relax}

% sectioning
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}


%% ============================================================
%% TITLING
%% ============================================================

\RequirePackage{totpages}
\RequirePackage{refcount}
\def\computelastpage{\pageref{TotPages}}%
\def\lastpageref{\computelastpage}%
\def\startpageref{\thestartpage}%

\AtEndOfClass{%
  \RequirePackage{hyperref}
  \hypersetup{%
     bookmarksnumbered=true,
     breaklinks=true,
     colorlinks=false,
     pdfborder={0 0 0}
  }%
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
\DeclareExpandableDocumentCommand{\aff}{ s o m }
{%
  \texorpdfstring
    {\IfBooleanTF{#1}{\@@aff}{\@aff}[#2]{#3}}
    {}%
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

\def\@subtitle{}
\newcommand*\subtitle[1]{%
    \def\@subtitle{#1}
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

\newif\if@wlg@titlepageneeded\@wlg@titlepageneededtrue
\newif\if@wlg@startpageset\@wlg@startpagesetfalse

\def\ljobname{\jobname}

\renewcommand*\maketitle[1][1]{%
  \def\and{\texorpdfstring{\unskip\slash}{| }}%
  \if@wlg@review
     \ifx\@subtitle\@empty\else
        \ClassWarning{univie-ling-wlg}{subtitle is not supported with type=review}%
        \global\let\@subtitle\@empty%
     \fi%
  \fi
  \if@wlg@titlepage
    \@maketitlepage[#1]%
    \if@wlg@mainmatter
      \pagenumbering{arabic}
    \fi
  \fi
  \if@wlg@startpageset\else
   \setcounter{page}{\thestartpage}
   \global\@wlg@startpagesettrue
  \fi
  \rehead{\@@author}
  \translatelet{\@revtitle}{review}%
  \lohead{\if@wlg@review\@revtitle\ \enquote{\@@title}\else\@@title\fi}
  \if@wlg@review
        \hypersetup{pdfauthor=\@author,
                  pdftitle={\@revtitle\ \enquote{\@@title} -- WLG \@issue\ (\@pubyear)}}
  \else
      \hypersetup{pdfauthor=\@author,
                  pdftitle={\@@title\ -- WLG \@issue\ (\@pubyear)}}
  \fi
  \if@wlg@tagging
    \lofoot[\scriptsize{\ResumeTagging{foot}\tagmcend\expandafter\url{\wlgurl/fileadmin/user_upload/p_wlg/\@issue\@pubyear/\ljobname.pdf}\\
         \tagmcbegin{artifact}\SuspendTagging{foot}}\translate{published} \ifx\@subtitle\@empty\today\else\@date\fi]{}%
     \hypersetup{pdfurl=\wlgurl/fileadmin/user_upload/p_wlg/\@issue\@pubyear/\ljobname.pdf}%
  \else
    \lofoot[\scriptsize\expandafter\url{\wlgurl/fileadmin/user_upload/p_wlg/\@issue\@pubyear/\ljobname.pdf}\\
         \translate{published} \ifx\@subtitle\@empty\today\else\@date\fi]{}%
  \fi
    \par
    \@tempcnta=%
    #1%
    \relax\ifnum\@tempcnta=1\else
      \ClassWarning{univie-ling-wlg}{%
        Optional argument of \string\maketitle\space ignored
        at\MessageBreak
        notitlepage-mode%
      }%
    \fi
    \begingroup
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}
       \@maketitle
       \thispagestyle{scrplain}\@thanks
    \endgroup
  \hypersetup{pdftitle=\@title}
  \ifx\@subtitle\@empty\else
      \hypersetup{pdfsubtitle=\@subtitle}
  \fi
  \setcounter{footnote}{0}%
  \setcounter{page}{\thestartpage}%
  \global\let\@cauthor\@empty
  \global\let\@thanks\@empty
  \gdef\@ccauthor{\translate{corrauthor}}
  \let\thanks\relax
  \let\maketitle\relax
  \let\@maketitle\relax
  \let\@maketitlepage\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@subtitle\@empty
  \global\let\author\relax
  \global\let\cauthor\relax
  \global\let\title\relax
  \global\let\date\relax
  \renewcommand*\@@aff[2][]{}
  \renewcommand*\@aff[2][]{}
}%

\newcommand{\@maketitlepage}[1][1]{%
   \if@wlg@titlepageneeded%
    \begin{titlepage}
      \pagenumbering{roman}%
      \thispagestyle{empty}%
      \setcounter{page}{#1}%
      \let\footnotesize\small%
      \let\footnoterule\relax%
      \let\footnote\thanks%
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark%
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
      \noindent\begin{minipage}[t]{\textwidth}%
          \wlg@logo%
      \end{minipage}\par
       \null\vfill
      \begin{flushleft}
        \if@wlg@specialprint
        \if@wlg@review
           {\reviewfont\translate{review}\par\vskip .5em}%
        \fi
        {\if@wlg@review\reviewtitlefont\else\titlefont\fi{\@title\par}}%
        {\ifx\@subtitle\@empty\else\vskip 1em{\subtitlefont\@subtitle\par}\fi}%
        \vskip 2em
        {%
          \authorfont%
              \if@wlg@review\translate{reviewedby}: \fi\@author\par%
        }%
          \vfill
          {\datefont\if@wlg@preprint\translate{preprintfrom}%
                              \else\translate{specialprint}\fi\ \emph{Wiener Linguistische Gazette}
                              (\versal{WLG})
         \@issue\ (\@pubyear)\if@wlg@preprint\else: \startpageref--\lastpageref\fi\par}
        {\ifx\@issuetitle\@empty\else
            \vskip 1em
            {\datefont\translate{specialissue} \itshape\@issuetitle
                         \ifx\@issuesubtitle\@empty\else.\ \@issuesubtitle\fi\par}%
         \fi}%
         \ifx\@issueeditors\@empty\else
          {\datefont%
              \translate{edby}\ \@issueeditors\par
          }%
                 \fi
        \else
        {\ifx\@issuetitle\@empty
           {\titlefont\translate{issue} \@issue\ (\@pubyear)\par}
                     \etocsettocstyle{\subsubsection*{\contentsname}}{}
             \etocsetstyle{chapter}
              {}
              {\scriptsize\mdseries\rmfamily}
              {\scriptsize\etocname{}\dotfill\etocpage\par\vspace{8pt}}
              {}
                   \tableofcontents
        \else
           {\datefont\translate{issue} \@issue\ (\@pubyear)\par}
        \fi}
        {\ifx\@issuetitle\@empty\else
            \vskip 1em
            {\datefont\translate{specialissue}\par}%
            \if@wlg@review
              {\reviewfont\translate{review}\par}%
            \fi
            {\titlefont\@issuetitle\par}%
                \vskip 3pt
                {\ifx\@issuesubtitle\@empty\else{\subtitlefont\@issuesubtitle\par}\fi}%
                 \vskip 2em
                {%
                 \ifx\@issueeditors\@empty\else
                 {\datefont%
                    \translate{edby}\ \@issueeditors\par
                 }%
                         \fi
                       }%
         \fi}%
        \fi%
        \vfill
        {\publishersfont\translate{univie} $\cdot$ \translate{lingdep} $\cdot$ \@pubyear\par}%
      \end{flushleft}\par
      \@thanks\let\@thanks\@empty
      \null
    \end{titlepage}
    \clearpage
    \thispagestyle{empty}
    ~\vfill
    \impressum
    \clearpage
    \if@wlg@specialprint\else
     \ifx\@issuetitle\@empty\else
       \thispagestyle{plain}
       \tableofcontents
       \clearpage
     \fi
    \fi
    \global\@wlg@titlepageneededfalse%
   \fi%
}

\renewcommand*{\@maketitle}{%
  \if@wlg@review
     \addcontentsline{toc}{chapter}{\@author\texorpdfstring{\\[5pt]\translate{review}}{: Review}: \@title%
                           \if@wlg@review\reviewtitlefont%
                           \else\ifx\@subtitle\empty\else\texorpdfstring{\\}{. }\@subtitle\fi\fi}%
  \else
      \addcontentsline{toc}{chapter}{\@author\texorpdfstring{\\[5pt]}{: }\@title%
                           \if@wlg@review\reviewtitlefont%
                           \else\ifx\@subtitle\empty\else\texorpdfstring{\\}{. }\@subtitle\fi\fi}%
  \fi
  \global\@topnum=\z@
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
    \if@wlg@review
       {\reviewfont\translate{review}\par\vskip .5em}%
    \fi
    {\if@wlg@review\reviewtitlefont\else\titlefont\fi{\@title \par}}%
    {\ifx\@subtitle\@empty\else\vskip .5em\subtitlefont\@subtitle\par\fi}%
    \vskip 1em
    {\authorfont\if@wlg@review\translate{reviewedby}: \fi\@author\par}%
    {\color{gray}\rule{1\columnwidth}{.7pt}\par}%
  \end{flushleft}%
  \begin{flushright}
    {\footnotesize
     \emph{Wiener Linguistische Gazette} (\versal{WLG})\par
     \translate{lingdep}\par
     \translate{univie}\par
     \translate{issue} \@issue\ (\@pubyear):
        \if@wlg@preprint\translate{preprint}%
           \else\thepage--\lastpageref\fi%
    }%
    \vskip \z@ \@plus 1em
  \end{flushright}%
  \par
  \vskip 2em
  \if@wlg@mainmatter
    \pagenumbering{arabic}
  \fi
}%

% Rewrite \include for local LastPage counter
\def\@include#1 {%
  \def\ljobname{#1}%
  \def\lastpageref{\pageref{TotPages#1}}%
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
    \if@wlg@biblatex
       \newrefsection
    \fi
    \@input@{#1.tex}%
    \label{TotPages#1}%
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

\def\authorfont{\normalsize\normalfont\mdseries\itshape}
\def\titlefont{\normalfont\bfseries\Large}
\def\subtitlefont{\normalsize\normalfont\bfseries}
\def\datefont{\normalsize\normalfont\mdseries}
\def\publishersfont{\small\mdseries}
\def\reviewfont{\normalfont\mdseries}
\def\reviewtitlefont{\normalsize\normalfont\bfseries}


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

% Footnote at botton despite \raggedbottom
\RequirePackage[bottom,hang]{footmisc}

% Increase distance between text and footnotes
\renewcommand\footnoterule{%
  % Distance between text and footnote rule
  \vspace{.25\baselineskip}%
  \hrule\@width 2in%
  \kern2.6\p@%
  % Distance between footnote rule and footnotes
  \vspace{0.2em}%
}

% Adapt number width to maximum footnote count (footnotesize)
\newlength\footnumwidth
\newcommand*\maxfn{199}
\settowidth{\footnumwidth}{{\normalfont\footnotesize\maxfn\space\space}}
\setlength{\footnotemargin}{\footnumwidth}

% Footnote mark not superscripted
\renewcommand\@makefntext[1]{%
  \bgroup
      \setbox\@tempboxa\hbox{%
        \hb@xt@\footnotemargin{\hfill\normalfont\@thefnmark\hspace{.5em}}%
      }%
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \@totalleftmargin \leftmargin
      \footnotesize
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      \parskip\hangfootparskip\relax
      \parindent\hangfootparindent\relax
    \footnotelayout#1%
    \par%
  \egroup
}

% Same with tagging=on
\newlength\fnlabelwidth
\long\def\wlg@tagged@makefntext#1{%
   \bgroup
      \SuspendTagging{footmisc}%
      \setbox\@tempboxa\hbox{%
         \hb@xt@\footnotemargin{\hfill\normalfont\@thefnmark\hspace{.5em}}%
      }%
      \leftmargin\wd\@tempboxa
      \fnlabelwidth\footnotemargin
      \advance \fnlabelwidth -.8em
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \@totalleftmargin \leftmargin
      \footnotesize
      \@setpar{{\@@par}}%
      \ResumeTagging{footmisc}%
      \leavevmode
      \hspace*{-\fnlabelwidth}%
      \UseSocket{tagsupport/fntext/mark}%
                {\llap{\box\@tempboxa}}%
      \parskip\hangfootparskip\relax
      \parindent\hangfootparindent\relax
      \footnotelayout#1%
      \par
    \egroup
}

\AddToHook{begindocument}{
  \if@wlg@tagging
    \let\@makefntext\wlg@tagged@makefntext
  \fi
}


%% =============================================================
%% ADAPT ENVIRONMENTS:
%% =============================================================

% empty part pages
\AddToHook{cmd/part/before}{\cleardoublepage\thispagestyle{empty}}

% Abstract
\renewenvironment{abstract}{%
      \section*{\hspace*{2.15em}Abstract}
      \quotation\noindent\ignorespaces%
}{%
    \if@twocolumn\else\endquotation\fi%
}

% Lists
\RequirePackage{enumitem}
\setlist{itemsep=0pt}
% Itemize
\def\labelitemi{--}

% Keywords
\newlength{\kwllength}
\AtBeginDocument{\settowidth\kwllength{\textbf{\translate{keywords}:}}}
\newcommand*\wlgkwlabel[1]{\hspace\labelsep\normalfont\bfseries #1}
\newenvironment{wlgkeywords}
  {\list{}%
        {\setlength\leftmargin{\kwllength}
         \labelwidth\z@ \itemindent-\leftmargin
         \let\makelabel\wlgkwlabel}
         \RaggedRight\small}
  {\endlist}
\newcommand\keywords[1]{%
 \begin{quote}%
  \begin{wlgkeywords}
   %
   \item[\translate{keywords}:] #1%
   \end{wlgkeywords}%
  \end{quote}%
}

% Motto
\newcommand*{\mottosourceformat}[1]{(#1)}

\NewDocumentCommand\motto{ o m }
{\par%
  \begingroup
    \raggedleft\parbox{.7\textwidth}{%
      {\rmfamily{\raggedleft #2\strut\par}%
        \def\@tempa{#1}\ifx\@tempa\@empty\else%
          {\raggedleft}%
          \raggedleft\rmfamily\mottosourceformat{#1}%
          \strut\par%
        \fi%
      }%
    }\par%
  \endgroup
  \medskip%
  \@afterindentfalse%
  \@afterheading%
}

% Quote (smaller)
\let\@wlg@save@quote\quote
\renewcommand*{\quote}{\@wlg@save@quote\small}

% Quotation (smaller)
\let\@wlg@save@quotation\quotation
\renewcommand*{\quotation}{\@wlg@save@quotation\small}

% Description (KOMA) (normal italic)
\renewcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\itshape #1}

% ldots centered
\let\olddots\ldots
\renewcommand*{\ldots}{\olddots\unkern}

\if@wlg@covington
  \RequirePackage{covington}
  \renewcommand{\p@equation}[1]{(#1)}
  \setlength\reflistindent{\parindent}
  \setlength\reflistparsep{0pt}
\fi


%% =============================================================
%% TABLES AND FIGURES:
%% =============================================================

%% caption settings
\RequirePackage[%
    format=hang,
    justification=RaggedRight,
    singlelinecheck=false,
    labelfont=bf
    ]{caption}

% workaround for tagging (https://github.com/latex3/tagging-project/issues/720)
\RemoveFromHook{begindocument}[latex-lab-testphase-float]
\ExplSyntaxOn
\socket_new_plug:nnn{tagsupport/parbox/before}{caption}
  {   
   \tagpdfparaOn %restart para tagging
   \tl_if_empty:NTF\@current@float@struct
    {     
     \tag_struct_begin:n{tag=Caption,firstkid}
    }
    {
     \tag_struct_begin:n{tag=Caption,parent=\@current@float@struct,firstkid}
    } 
  }
\socket_new_plug:nnn{tagsupport/parbox/after}{caption}
  {
   \tag_struct_end:   
  }
\l@addto@macro\caption@beginex@hook{%
  \tagpdfparaOff %leavevmode in parbox should not start paragraph structure
  \AssignSocketPlug{tagsupport/parbox/before}{caption}
  \AssignSocketPlug{tagsupport/parbox/after}{caption}}
\ExplSyntaxOff

\AddToHook{begindocument/end}{
   \if@wlg@tagging
        \providecommand*\caption@anchor[1]{}%
	\renewcommand*\caption@anchor[1]{%
        \ifmeasuring@ \else
           \caption@raisedlink{\MakeLinkTarget*{#1}}%
        \fi}%
   \fi%
}

%% Nicer tables with booktabs.sty
\RequirePackage{booktabs}

%% allow multiple rows
\RequirePackage{multirow}


%% =============================================================
%% BIBLIOGRAPHY:
%% =============================================================

% Biblatex
\if@wlg@biblatex
  \AfterInputencOrAtEndPreamble{%
      \RequirePackage[%
           style=univie-ling,
           sorting=nyvt,
           autolang=hyphen]
      {biblatex}
  }
\fi
\AtBeginDocument{%
  \@ifundefined{bibhang}{}{%
    \setlength{\bibhang}{\parindent}%
  }%
  \@ifundefined{bibfont}{}{%
    \renewcommand{\bibfont}{\small}%
  }%
  \@ifundefined{bibsep}{}{%
    \setlength\bibsep{0pt}%
  }%
}

%% =============================================================
%% REFERENCES:
%% =============================================================

% Varioref:
\AtBeginDocument{%
  \RequirePackage[ngerman]{varioref}
  \vref@addto\extrasnaustrian{%
    \def\reftextafter{auf der \reftextvario{folgenden}{n\"achsten} Seite}%
    \def\reftextfaceafter{auf der gegen\"uberliegenden Seite}%
    \def\reftextbefore{auf der \reftextvario{vorhergehenden}{vorangegangenen} Seite}%
    \def\reftextfacebefore{auf der gegen\"uberliegenden Seite}%
    \def\reftextfaraway#1{auf S.~\pageref{#1}}%
    \def\reftextpagerange#1#2{auf S.~\pageref{#1}--\pageref{#2}}%
  }%
  % Prettyref:
  % (varioref included)
  \RequirePackage{prettyref}
  \newrefformat{cha}{\translate{chapter}~\vref{#1}}
  \newrefformat{sec}{\translate{section}~\vref{#1}}
  \newrefformat{sub}{\translate{section}~\vref{#1}}
  \newrefformat{anm}{\translate{footnote}~\vref{#1}}
  \newrefformat{app}{\appendixname~\vref{#1}}
  \newrefformat{tab}{\tablename~\vref{#1}}
  \newrefformat{fig}{\figurename~\vref{#1}}
  \newrefformat{exp}{\translate{argumentation}~\vref{#1}}
  \newrefformat{exa}{\translate{example}~\vref{#1}}
}

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

%% =============================================================
%% DRAFT:
%% =============================================================

\if@wlg@draftmark

\if@wlg@draftmarkfp
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
