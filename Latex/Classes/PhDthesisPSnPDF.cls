%---------------------------------------------------------------
% PhDthesis
% version 3 by Igor Ruiz-Agundez 2011
% version 2 by Jakob Suckale 2007
% version 1 by Harish Bhanderi 2002
%---------------------------------------------------------------

%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Latex/Classes/PhDthesisPSnPDF}[2010/11/26 v3 PhD thesis class]


%:-------------------------- report or book -----------------------

%If you want to use a Report style document then uncomment the following 3 lines and comment the below 8 book style lines:
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%\ProcessOptions\relax
%%\LoadClass[a4paper]{report}
%\ifx\pdfoutput\undefined
%   \LoadClass[dvips, a4paper]{report}
%\else
%   \LoadClass[pdftex, a4paper]{report}
%\fi

%%Bibliography
%%uncomment next line to change bibliography name to references for Report document class
%\renewcommand{\refname}{References}
%\renewcommand{\bibname}{References}


%If you want to use a Book style document then uncomment the following 3 lines and comment the above 8 report style lines:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
  \LoadClass[dvips, a4paper]{book}
\else
  \LoadClass[pdftex, a4paper]{book}
\fi




%---------------------------------------------------------------
% Packages
%---------------------------------------------------------------


%:-------------------------- packages for fancy things -----------------------

% Juan's thesis packages

% Defined in original template

\usepackage{amssymb}
\usepackage{float}
\usepackage{graphics} % for improved inclusion of graphics
%\usepackage{wrapfig} % to include figure with text wrapping around it
\usepackage[margin=10pt,font=small,labelfont=bf]{caption} % for improved layout of figure captions with extra margin, smaller font than text
\usepackage{fancyhdr} % for better header layout
\usepackage{eucal}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}

% 20180324 LED: add color to rows in a table
\usepackage[table]{xcolor}    % loads also »colortbl«
% 20180417 LED: usar símbolo del euro
\usepackage[official]{eurosym}

%\usepackage[round, sort, numbers, authoryear]{natbib}
%\usepackage[sort, numbers, authoryear]{natbib}
%\usepackage[numbers]{natbib}

% 20180901 LED: Al final, comentando pagebackref para quitar las referencias a páginas de las citas, puedo comprimir las citas múltiples.
\usepackage[sort&compress, numbers]{natbib}
%\usepackage[round, sort, numbers]{natbib}
%\bibpunct{[}{]}{,}{n}{}{;}

% 20180625 LED: paquete hacer subfiguras, es decir, array de figuras
\usepackage[caption=false,font=footnotesize]{subfig}
% 20180723 LED: paquete para los \degree 
\usepackage{gensymb}
% 20180726 LED: paquete para forzar que se rellene la página antes de poner el contenido landscape
\usepackage{afterpage}
% 20180723 LED: paquete para que permite hacer unos clines mejores, que no se quedan por debajo del relleno de la celda
\usepackage{hhline}

\usepackage{ifthen}
\usepackage{multicol} % for pages with multiple text columns, e.g. References
\setlength{\columnsep}{20pt} % space between columns; default 10pt quite narrow
\usepackage[nottoc]{tocbibind} % correct page numbers for bib in TOC, nottoc suppresses an entry for TOC itself
%\usepackage{nextpage}


\usepackage{xifthen}% provides \isempty test

% How to change LaTeX’s “fixed names”
% The names that are defined in the standard LaTeX classes (and the makeidx package) are listed below
\usepackage{makeidx}



%:-------------------------- packages for use more than a language and fixing inputtenc -----------------------


% To use more than a language and fixing inputtenc
\usepackage[utf8x]{inputenc}
\usepackage{ucs}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}




%\usepackage[spanish,british,basque,activeacute]{babel}
\usepackage[spanish,english,activeacute]{babel}





%:-------------------------- Glossary/Abbrev./Symbols -----------------------

%\usepackage{nomencl}
\usepackage[intoc]{nomencl} % load nomencl extension; include in TOC
%\nomrefpage % to include page numbers after abbrevations


%\renewcommand{\nomname}{Glossary} % rename nomenclature

% As we are using the glossary to list the acronyms we change the label of the section
\renewcommand{\nomname}{Acronyms} % rename nomenclature


\renewcommand{\nomlabel}[1]{\textbf{#1}} % make abbreviations bold
\makenomenclature % used to be \makeglossary
\newcommand{\g}{\footnote{For all abbreviations see the glossary on page \pageref{nom}.}} % type "\g" to refer to glossary

% used to be for sorting into categories:
%\renewcommand\nomgroup[1]{%
%  \ifthenelse{\equal{#1}{A}}{%
%   \item[\textbf{Roman Symbols}] }{%             A - Roman
%    \ifthenelse{\equal{#1}{G}}{%
%     \item[\textbf{Greek Symbols}]}{%             G - Greek
%      \ifthenelse{\equal{#1}{R}}{%
%        \item[\textbf{Superscripts}]}{%              R - Superscripts
%          \ifthenelse{\equal{#1}{S}}{%
%           \item[\textbf{Subscripts}]}{{%             S - Subscripts
%	    \ifthenelse{\equal{#1}{X}}{%
%	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
%	    \ifthenelse{\equal{#1}{Z}}{%
%	     \item[\textbf{Acronyms}]}%              Z - Acronyms
%              			{{}}}}}}}}}}



%:-------------------------- PDF/PS setup -----------------------

%if you use a macTeX 2008 or later, use the ifpdf package
\usepackage{ifpdf}

%if you use an older version, uncomment these lines:
%\newif \ifpdf
%    \ifx \pdfoutput \undefined
% for running latex
%        \pdffalse
%    \else
% for running pdflatex
%        \pdfoutput = 1    % positive value for a PDF output
% otherwise a DVI
%        \pdftrue
%\fi

\ifpdf
  %-->
  %--> Google.com search "hyperref options"
  %--> 
  %--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
  %--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
  %--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
  %--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
  %-->
  \usepackage[ pdftex, plainpages = false, pdfpagelabels,
    pdfpagelayout = useoutlines,
    bookmarks,
    bookmarksopen = true,
    bookmarksnumbered = true,
    breaklinks = true,
    linktocpage,
    % LED Comento pagebackref para quitar las referencias a páginas de las citas. Así puede comprimir las citas múltiples.
    %pagebackref,
    colorlinks = false,  % was true
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = red,
    anchorcolor = green,
    hyperindex = true,
    hyperfigures
  ]{hyperref}

  \DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf, .gif} %GIF doesn't work??
  \usepackage[pdftex]{graphicx}
  \pdfcompresslevel=9
  \graphicspath{{0_frontmatter/figures/PNG/}{0_frontmatter/figures/PDF/}{0_frontmatter/figures/}}
\else
  \usepackage[ dvips,
    bookmarks,
    bookmarksopen = true,
    bookmarksnumbered = true,
    breaklinks = true,
    linktocpage,
    pagebackref,
    colorlinks = true,
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = red,
    anchorcolor = green,
    hyperindex = true,
    hyperfigures
  ]{hyperref}

  \DeclareGraphicsExtensions{.eps, .ps}
  \usepackage{epsfig}
  \usepackage{graphicx}
  \graphicspath{{0_frontmatter/figures/EPS/}{0_frontmatter/figures/}}
\fi



%:-------------------------- extra packages -----------------------

% Extra added
%\usepackage[authoryear]{natbib}
\usepackage{times}
\usepackage{quotchap}
\usepackage{titlesec}
\usepackage{fancybox}

\usepackage{listings}
\usepackage{rotating}


%\usepackage[options]{natbib}

% landscape package. Used to rotate tables, for instance
\usepackage{lscape}
\usepackage{pdflscape}


\usepackage{array}
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{tabularx}
\usepackage{multirow}

% Introduce slash \
%\usepackage{slashbox}


% Watermarks
% Introduce a watermark in each page heading with the desired content
\usepackage{watermark}

% date and time
\usepackage{datetime}

% avoid hyphenation locally
\usepackage{hyphenat}


% Line break directly after paragraph title
% http://www.latex-community.org/forum/viewtopic.php?f=5&t=1383
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}

%---------------------------------------------------------------
% Layout
%---------------------------------------------------------------


%:-------------------------- page layout -----------------------

%A4 settings
\ifpdf
  \pdfpageheight=297mm
  \pdfpagewidth=210mm
\else
  \setlength{\paperheight}{297mm}
  \setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

%: Uncomment this secion for two-sided printing
% ------------------------------
\setlength{\oddsidemargin}{1.5cm}
\setlength{\evensidemargin}{0.5cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.84cm}
\setlength{\textwidth}{13.9cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}


%\setlength{\oddsidemargin}{1.5cm}
%\setlength{\evensidemargin}{0cm}
%\setlength{\topmargin}{1mm}
%\setlength{\headheight}{1.36cm}
%\setlength{\headsep}{1.00cm}
%\setlength{\textheight}{20.84cm}
%\setlength{\textwidth}{14.5cm}
%\setlength{\marginparsep}{1mm}
%\setlength{\marginparwidth}{3cm}
%\setlength{\footskip}{2.36cm}

%: Uncomment this secion for one-sided printing
% taken from the original file, but with the first two lanes modified
% ------------------------------
%\setlength{\evensidemargin}{1.9cm} % was 1.96cm in original
%\setlength{\oddsidemargin}{-0.001cm} % was -0.54cm in original file
%\setlength{\topmargin}{1mm}
%\setlength{\headheight}{1.36cm}
%\setlength{\headsep}{1.00cm}
%\setlength{\textheight}{20.84cm}
%\setlength{\textwidth}{14.5cm}
%\setlength{\marginparsep}{1mm}
%\setlength{\marginparwidth}{3cm}
%\setlength{\footskip}{2.36cm}




%: section below defines fancy page layout options
% ------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
%\renewcommand{\chaptermark}[1]{\markboth{{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\color{gray} \fontsize{9}{10}\bfseries\rightmark}
\fancyhead[LE]{\color{gray}\fontsize{9}{10}\bfseries\leftmark}
\fancyfoot[C]{\thepage}

\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.3pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}


%
%%:-------------------------- title page layout -----------------------

% starts roman page numbering until chapter 1
% important to avoid two pages numbered 1 and 2 which may cause bad links
% bug: cover i + back side ii and then numbering restarts with i; should be iii
\renewcommand{\thepage}{\roman{page}}

% DECLARATIONS
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

% The name of your University
\def\university#1{\gdef\@university{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}

% Text advisor
\def\textadvisor#1{\gdef\@textadvisor{#1}}

% Advisor
\def\advisor#1{\gdef\@advisor{#1}}

% Advisor two
% 20180315 LED: removing \advisortwo
%\def\advisortwo#1{\gdef\@advisortwo{#1}}

% Text signature candidate
\def\textsignaturecandidate#1{\gdef\@textsignaturecandidate{#1}}

% Text signature advisor
\def\textsignatureadvisor#1{\gdef\@textsignatureadvisor{#1}}

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}

% Stating the city of birth for title page where needed; uncommented for use
\def\cityofbirth#1{\gdef\@cityofbirth{#1}}

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \else\newpage\fi}
{\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout
\renewcommand{\maketitle}{%
  \pagestyle{empty}
  %
  %
  % 20180315 LED: modification of the cover
  % First cover front (external)
  \begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
    \begin{center}
      { \Large {\bfseries {\@crest}}}
      {\vspace*{0.5ex}
        {{\textsc{\@university}}}}
      % Title style
      {\huge \vspace*{15mm} { \par} \textsc{\@title}\vspace*{10mm}\par}
      {\normalsize
        \vspace*{1ex}
        {by \par}
        \vspace*{1ex}
        {\@author \par}
        \vspace*{10mm}
        {\@degree \par}
        %\vspace*{0.5ex}
        %{\@collegeordept \par}
        \vspace*{4ex}
        {\@textadvisor \@advisor \par}
        %{\@textadvisor \@advisortwo \par}
        % 20180315 LED: removing \advisortwo
        %{\@advisortwo \par}
        \vspace*{4ex}
      }%end large
    \end{center}
    \null\vfill
  \end{alwayssingle}
  % Blank page
  \cleardoublepage
  % Second cover front (internal)
  \begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
    \begin{center}
      { \Large {\bfseries {\@crest}} \par}
      {\vspace*{0.5ex}
        {{\textsc{\@university}} \par}}
      % Title style
      {\huge \vspace*{15mm} { \par} \textsc{\@title}\vspace*{10mm}\par}
      {\normalsize
        \vspace*{1ex}
        {by \par}
        \vspace*{1ex}
        {\@author \par}
        \vspace*{10mm}
        {\@degree \par}
        %\vspace*{0.5ex}
        %{\@collegeordept \par}
        \vspace*{4ex}
        {\@textadvisor \@advisor \par}
        %{\@textadvisor \@advisortwo \par}
        % 20180315 LED: removing \advisortwo
        %{\@advisortwo \par}
        \vspace*{4ex}
        % 20180315 LED: removing \advisortwo
        %{\@textsignaturecandidate \hspace*{15ex}\@textsignatureadvisor \hspace*{15ex}\@textsignatureadvisor \par}
        {\@textsignaturecandidate \hspace*{45ex}\@textsignatureadvisor \par}
        \vspace*{15ex}
        {\@cityofbirth, \@degreedate}
      }%end large
    \end{center}
    \null\vfill
  \end{alwayssingle}
  %
  %
}

% page number for cover back side should have page number blanked


%:-------------------------- front matter layout -----------------------


%:-------------------------- dedication -----------------------

%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
    \pagestyle{empty}
    \begin{center}
      \vspace*{1.5cm}
      {\LARGE }
    \end{center}
    \vspace{0.5cm}
    \begin{quote} \begin{flushright}}
        {\end{flushright} \end{quote} \end{alwayssingle}}

\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
      \hbox{}
      \vspace*{\fill}
      \thispagestyle{empty}
      \newpage
      \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother


%:-------------------------- acknowledgements -----------------------

%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\pagestyle{empty}
  \begin{alwayssingle}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries Acknowledgements}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
      {\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\pagestyle{empty}
  \begin{alwayssingle}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries Acknowledgements}
    \end{center}
    \vspace{0.5cm}\begin{quote}}
      {\end{quote}\end{alwayssingle}}


%:-------------------------- abstract -----------------------

%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{laburpena} {\begin{alwayssingle} \pagestyle{empty}
    \cleardoublepage
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Laburpena}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
      {\end{quote}\end{alwayssingle}}

\newenvironment{resumen} {\begin{alwayssingle} \pagestyle{empty}
    \cleardoublepage
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Resumen}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
      {\end{quote}\end{alwayssingle}}

\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Abstract}
    \end{center}
    \vspace{0.5cm}}
      {end{alwayssingle}}
\newenvironment{summary} {\begin{alwayssingle} \pagestyle{empty}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Summary}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
      {\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
    \begin{center}
      \cleardoublepage
      \vspace*{1.5cm}
      {\Large \bfseries  Abstract}
    \end{center}
    \vspace{0.5cm} \begin{quote}}
      {\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
    \vspace*{-1in}
    \cleardoublepage
    \begin{center}
      { \Large {\bfseries {\@title}} \par}
      {{\large \vspace*{1ex} \@author} \par}
      {\large \vspace*{1ex}
        {{\@collegeordept} \par}
        {{\@university} \par}
        \vspace*{1ex}
        {{\it \submittedtext} \par}
        {\it {\@degree} \par}
        \vspace*{2ex}
        {\@degreedate}}
    \end{center}}
    {\end{alwayssingle}}


%:-------------------------- declaration -----------------------


%Statement of originality if required

\newenvironment{declaration} {\begin{alwayssingle} \pagestyle{empty}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Declaration}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
      {\end{quote}\end{alwayssingle}}

%:-------------------------- chapter number-----------------------

\renewcommand{\frontmatter}{%
  % \cleardoublepage
  \pagestyle{fancy}
  \pagenumbering{roman}

  % \chapter format
  \titleformat{\chapter}[display]%		
  % Label and title options
  {\filleft}%
  % Label format and text
  {\color{Gray}{\filleft\small{\bfseries CHAPTER}} {\linebreak\fontsize{90}{90}\selectfont\selectfont {\bfseries \thechapter}}}
  % Label and title distance
  {1ex}
  % Title format
  {\vspace{2ex}\bfseries \fontsize{30}{30}\selectfont}%
  % Space between title and text
  \titlespacing{\chapter}{3mm}{*0}{10mm}[3mm] %

  % \section format
  \titleformat{\section}[block]{\normalfont\Large}{\thesection}{.5em}{\bfseries}
  \titlespacing{\section}{3mm}{*4}{*1}

  % \subsection format
  \titleformat{\subsection}[block]{\normalfont\large}{\thesubsection}{.5em}{\bfseries}
  \titlespacing{\subsection}{3mm}{*4}{*1}

  % \subsubsection format
  \titleformat{\subsubsection}[block]{\normalfont\normalsize}{\thesubsubsection}{.5em}{\bfseries}
  \titlespacing{\subsubsection}{3mm}{*4}{0.5ex}
}






%:-------------------------- page numbers: roman+arabic -----------------------

% ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{
  \setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}
}


{
  \newpage
  \renewcommand{\thepage}{\arabic{page}}
  \setcounter{page}{1}
}


