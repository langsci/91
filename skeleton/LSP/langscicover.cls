\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LSP/langsci}[2014/11/27 Language Science Press]

% Default values:
\usepackage{xspace}
\newcommand{\lsp}{Language Science Press\xspace}
\newcommand{\lsSeriesNumber}{??}
\newcommand{\lsISSN}{??}
\newcommand{\lsISBN}{000-0-000000-00-0}
\newcommand{\lsURL}{http://langsci-press.org/catalog}
\newcommand{\lsSeries}{eotms}
\newcommand{\lsSpineBreadth}{20mm}
\newcommand{\lsOutput}{long}
\newcommand{\lsFontsize}{11pt}
\newcommand{\lsCopyright}{CC-BY}
\newcommand{\lsBiblatexBackend}{bibtex}
\newif\iflsDraft \lsDraftfalse
\newif\iflsIndex \lsIndextrue
\newif\iflsBiblatex \lsBiblatexfalse
\newif\iflsCollection \lsCollectionfalse
\newif\iflsCollectionChapter \lsCollectionChapterfalse
\newif\iflsCollectionTOCLong \lsCollectionTOCLongfalse
\newif\iflsNewtxmath \lsNewtxmathfalse


% Option handling:
\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=langsci,
	prefix=langsci@ }
\DeclareStringOption{number}[??]
	\define@key{langsci}{number}{%
		\renewcommand{\lsSeriesNumber}{#1}}
\DeclareStringOption{issn}[??]
	\define@key{langsci}{issn}{%
		\renewcommand{\lsISSN}{#1}}
\DeclareStringOption{isbn}[000-0-000000-00-0]
	\define@key{langsci}{isbn}{%
		\renewcommand{\lsISBN}{#1}}
\DeclareStringOption{url}[http://langsci-press.org/catalog]
	\define@key{langsci}{url}{%
		\renewcommand{\lsURL}{#1}}
\DeclareStringOption{series}[eotms]
	\define@key{langsci}{series}{%
		\renewcommand{\lsSeries}{#1}}
\DeclareStringOption{output}[long]
	\define@key{langsci}{output}{%
		\renewcommand{\lsOutput}{#1}}
\DeclareStringOption{copyright}[CC-BY]
	\define@key{langsci}{copyright}{%
		\renewcommand{\lsCopyright}{#1}}
\DeclareStringOption{biblatexbackend}[bibtex]
	\define@key{langsci}{biblatexbackend}{%
		\renewcommand{\lsBiblatexBackend}{#1}}
\DeclareVoidOption{blackandwhite}{
	\newcommand{\blackandwhite}{}}
\DeclareVoidOption{long}{
	\renewcommand{\lsOutput}{long}}
\DeclareVoidOption{smallfont}{  			
	\renewcommand{\lsFontsize}{10pt}}
\DeclareVoidOption{draftmode}{	% 'draftmode' instead of 'draft' due to undesirable side efects	
	 \lsDrafttrue
	 \overfullrule=5pt	}	% to indicate overfull hboxes
\DeclareVoidOption{noindex}{  			
	\lsIndexfalse }
\DeclareVoidOption{biblatex}{  			
	\lsBiblatextrue}
\DeclareVoidOption{newtxmath}{  			
	\lsNewtxmathtrue}
\DeclareVoidOption{collection}{  			
	\lsCollectiontrue}
\DeclareVoidOption{collectionchapter}{  			
	\lsCollectiontrue
	\lsCollectionChaptertrue}
\DeclareVoidOption{collectiontoclong}{  			
	\lsCollectiontrue
	\lsCollectionTOCLongtrue}
\ProcessKeyvalOptions{langsci}

\LoadClass[
	fontsize=\lsFontsize, % default is 11pt
	footnotes=multiple,
	numbers=noenddot,		% no point after last number of chapters/sections
	toc=bibliographynumbered,
	index=totoc,
	%chapterprefix=true,
	%draft=yes,
	]{scrbook}


\usepackage{etex}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Page size and text area:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  
% \usepackage[ 
% 	papersize={170mm,240mm}
% 	,top=27.4mm % TODO nachgemessen, nach Vermassung eigentlich 30mm-16pt = 25.8mm
% 	,inner=20.5mm, 
% 	,outer=24.5mm
% 	%,showframe,pass
% 	,marginparwidth=50pt
% 	]{geometry}
% 			

\usepackage[
	absolute 		% for absolute positioning in titlepage
	%,showboxes
	]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm}

\usepackage{pbox}   % boxes with maximum width
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Fonts, language and graphics:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{xstring} 	% for manipulating strings
\usepackage{ifxetex}
\ifxetex\else\ClassError{LSP/langsci}{Please use XeLaTeX!}{}\fi
	
\usepackage{amssymb} % has to be loaded before other stuff
\usepackage{dtklogos}\newcommand{\xelatex}{\XeLaTeX\xspace}	% the XeLaTeX symbol			
\usepackage{fontspec}
\newcommand{\fontpath}{./LSP/lsp-fonts/}

\setsansfont[
	%Ligatures={TeX,Common},		% not supported by ttf
	Scale=MatchLowercase,
	Path=\fontpath,
	BoldFont = Arimo-Bold_B.ttf ,
	ItalicFont = Arimo-Italic_B.ttf ,				
	BoldItalicFont = Arimo-BoldItalic_B.ttf 		
	]{Arimo_B.ttf}
		
\setmonofont[
	Ligatures={TeX},Scale=MatchLowercase,Path=\fontpath,
	BoldFont = FreeMonoBold_B.otf ,
	SlantedFont = FreeMonoOblique_B.otf ,				
	BoldSlantedFont = FreeMonoBoldOblique_B.otf 		
	]{FreeMono_B.otf}


\setmainfont[
	Ligatures={TeX,Common},
	Path=\fontpath,
	PunctuationSpace=0,							
	%Numbers={OldStyle,Proportional},				% for tables use \addfontfeatures{Numbers={Monospaced,Lining}}
	Numbers={Proportional},	% normal numbers			% for tables use \addfontfeatures{Numbers={Monospaced,Lining}}
	BoldFont = LinLibertine_RZ_B.otf ,				% semi-bold
	ItalicFont = LinLibertine_RI_B.otf ,			
	BoldItalicFont = LinLibertine_RZI_B.otf 		% semi-bold
	]{LinLibertine_R_B.otf}			

\iflsNewtxmath							% some users have problems when installing newtxmath
	\usepackage[libertine]{newtxmath}
\fi 	

\let\oldtabular\tabular	% number in tabulars
\let\endoldtabular\endtabular
\renewenvironment{tabular}{\normalfont\addfontfeatures{Numbers=Lining}\selectfont\oldtabular}{\endoldtabular}
 
  %\usepackage{polyglossia}		% TODO remove this?
  %\setdefaultlanguage{british}

%\frenchspacing			
\usepackage[final]{microtype}
\usepackage{graphicx}

  \newcommand{\lsCoverTitleFont}[1]{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{52pt}{16.75mm}\selectfont #1}
  \newcommand{\lsCoverSubTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
  \newcommand{\lsCoverAuthorFont}{\fontsize{25pt}{12.5mm}\selectfont}
  \newcommand{\lsCoverSeriesFont}{\sffamily\fontsize{17pt}{7.5mm}\selectfont}			% fontsize?
  \newcommand{\lsCoverSeriesHistoryFont}{\sffamily\fontsize{10pt}{5mm}\selectfont}
  \newcommand{\lsInsideFont}{}	% obsolete, see \setmainfont
  \newcommand{\lsDedicationFont}{\fontsize{15pt}{10mm}\selectfont}
  \newcommand{\lsBackTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
  \newcommand{\lsBackBodyFont}{\lsInsideFont}
  \newcommand{\lsSpineAuthorFont}{\fontsize{16pt}{14pt}\selectfont}
  \newcommand{\lsSpineTitleFont}{\sffamily\fontsize{18pt}{14pt}\selectfont}

\setkomafont{sectioning}{\normalcolor\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Colors:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{xcolor}
\definecolor{lsLightBlue}{cmyk}{0.6,0.05,0.05,0}
\definecolor{lsMidBlue}{cmyk}{0.75,0.15,0,0}
\definecolor{lsMidDarkBlue}{cmyk}{0.9,0.4,0.05,0}
\definecolor{lsDarkBlue}{cmyk}{0.9,0.5,0.15,0.3}
\definecolor{lsNightBlue}{cmyk}{1,0.47,0.22,0.68}
\definecolor{lsYellow}{cmyk}{0,0.25,1,0}
\definecolor{lsLightOrange}{cmyk}{0,0.50,1,0}
\definecolor{lsMidOrange}{cmyk}{0,0.64,1,0}
\definecolor{lsDarkOrange}{cmyk}{0,0.78,1,0}
\definecolor{lsRed}{cmyk}{0.05,1,0.8,0}
\definecolor{lsLightWine}{cmyk}{0.3,1,0.6,0}
\definecolor{lsMidWine}{cmyk}{0.54,1,0.65,0.1}
\definecolor{lsDarkWine}{cmyk}{0.58,1,0.70,0.35}
\definecolor{lsSoftGreen}{cmyk}{0.32,0.02,0.72,0}
\definecolor{lsLightGreen}{cmyk}{0.4,0,1,0}
\definecolor{lsMidGreen}{cmyk}{0.55,0,0.9,0.1}
\definecolor{lsRichGreen}{cmyk}{0.6,0,0.9,0.35}
\definecolor{lsDarkGreen1}{cmyk}{0.85,0.02,0.95,0.38}
\definecolor{lsDarkGreen2}{cmyk}{0.85,0.05,1,0.5}
\definecolor{lsNightGreen}{cmyk}{0.88,0.15,1,0.66}
\definecolor{lsLightGray}{cmyk}{0,0,0,0.17}
\definecolor{lsGuidelinesGray}{cmyk}{0,0.04,0,0.45}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Special commands for authors:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% defaults:
\newcommand{\lsBackBody}{Europan lingues es membres del sam familie. Lor separat existentie es un
myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li
lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe
al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores.}
\newcommand{\lsBackTitle}{Back Title}

\newcommand{\BackTitle}[1]{\renewcommand{\lsBackTitle}{#1}}
\newcommand{\BackBody}[1]{\renewcommand{\lsBackBody}{#1}} 

\newcommand{\newlineCover}{\\}	% \newline only on cover
\newcommand{\newlineSpine}{\\}	% \newline only on spine
\newcommand{\newlineTOC}{\\}		% \newline only in TOC entry

\newcommand{\lsSpineTitle}{\@title}
\newcommand{\lsSpineAuthor}{\@author}
\newcommand{\SpineTitle}[1]{\renewcommand{\lsSpineTitle}{#1}}
\newcommand{\SpineAuthor}[1]{\renewcommand{\lsSpineAuthor}{#1}} 

\def\translator#1{\gdef\@translator{#1}}
\translator{}
\def\typesetter#1{\gdef\@typesetter{#1}}
\typesetter{}
\def\proofreader#1{\gdef\@proofreader{#1}}
\proofreader{}
%\def\@author{\@latex@warning@no@line{No \noexpand\author given}}


\newcommand{\ISBN}[1]{\renewcommand{\lsISBN}{#1}}
\newcommand{\URL}[1]{\renewcommand{\lsURL}{#1}}
\newcommand{\Series}[1]{\renewcommand{\lsSeries}{#1}}
\newcommand{\SeriesNumber}[1]{\renewcommand{\lsSeriesNumber}{#1}}

% for papers of collections:
\newcommand{\lsCollectionPaperAbstract}{Put abstract here with \string\abstract.}
\newcommand{\abstract}[1]{\renewcommand{\lsCollectionPaperAbstract}{#1}}

\def\epigram#1{\gdef\@epigram{#1}}			% needs to be defined this way to check emptiness
\epigram{}
\def\epigramsource#1{\gdef\@epigramsource{#1}}
\epigramsource{}

% inside \author
\renewcommand{\and}{}				
\newcommand{\lastand}{}
\newcommand{\affiliation}[1]{}	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Series information:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\eotms}{eotms}
\newcommand{\eotmsig}{eotmsig}
\newcommand{\sidl}{sidl}
\newcommand{\algad}{algad}
\newcommand{\tmnlp}{tmnlp}
\newcommand{\nc}{nc}		%Niger Congo
\newcommand{\lnls}{lnls}	%Lecture Notes in Language Sciences
\newcommand{\silp}{silp}	%Studies in Laboratory Phonology
\newcommand{\tdgi}{tdgi}	%Topics at the Discourse Grammar Interface
\newcommand{\cmle}{cmle}	%Computational Models of Language Evolution
\newcommand{\cfls}{cfls}	%Conceptual Foundation of the Language Sciences
\newcommand{\lv}{lv}		%Language Variation
\newcommand{\dummyseries}{dummyseries}
\newcommand{\guidelines}{guidelines}
\newcommand{\lsSeriesFontColor}{white}

\AtBeginDocument{
\ifx\lsSeries\eotms
	\newcommand{\lsSeriesTitle}{Empirically Oriented Theoretical \newlineCover Morphology and Syntax~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\eotmsig
	\newcommand{\lsSeriesTitle}{Implemented Grammars~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\sidl
	\newcommand{\lsSeriesTitle}{Studies in Diversity Linguistics~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsRichGreen}
	\renewcommand{\lsISSN}{2363-5568}
\fi
\ifx\lsSeries\algad
	\newcommand{\lsSeriesTitle}{African Language Grammars \newlineCover and Dictionaries~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsLightOrange}
\fi
\ifx\lsSeries\scl
	\newcommand{\lsSeriesTitle}{Studies in Caribbean Languages~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsDarkOrange}
\fi
\ifx\lsSeries\tmnlp
	\newcommand{\lsSeriesTitle}{Translation and Multilingual Natural \newlineCover Language Processing~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsDarkBlue}
\fi
\ifx\lsSeries\lnls
	\newcommand{\lsSeriesTitle}{Lecture Notes in Language Sciences~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsYellow}
\fi	
\ifx\lsSeries\nc
	\newcommand{\lsSeriesTitle}{Monographs on Comparative Niger-Congo~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsRed}
\fi	
\ifx\lsSeries\silp
	\newcommand{\lsSeriesTitle}{Studies in Laboratory Phonology~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsLightWine}
	\renewcommand{\lsISSN}{2363-5576}
\fi	
\ifx\lsSeries\tdgi
	\newcommand{\lsSeriesTitle}{Topics at the Discourse Grammar Interface~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidDarkBlue}
\fi	
\ifx\lsSeries\cmle
	\newcommand{\lsSeriesTitle}{Computational Models of Language Evolution~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsNightBlue}
\fi	
\ifx\lsSeries\cfls
	\newcommand{\lsSeriesTitle}{Conceptual Foundations of \newlineCover Language Science~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsNightGreen}
\fi	
\ifx\lsSeries\lv
	\newcommand{\lsSeriesTitle}{Language Variation~\lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsDarkWine}
\fi	
\ifx\lsSeries\dummyseries
	\newcommand{\lsSeriesTitle}{~}
	\newcommand{\lsSeriesColor}{lsNightGreen}
\fi
\ifx\lsSeries\guidelines
	\newcommand{\lsSeriesTitle}{Language Science Press Guidelines}
	\newcommand{\lsSeriesColor}{lsGuidelinesGray}
	\renewcommand{\lsCoverFontColor}{black}
\fi
}	

% \@ifundefined{blackandwhite}
% 	{}
% 	{\renewcommand{\lsSeriesColor}{black}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Cover:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\usepackage[ISBN=\lsISBN,SC4]{ean13isbn}	% for generating bar codes; remove this?
\usepackage{pst-barcode}					% for generating bar codes
\newcommand{\logopath}{./LSP/lsp-logos}
\newcommand{\lsCoverFontColor}{white}
\newcommand{\lsCoverBlockColor}{\lsSeriesColor}
\newcommand{\lsEditorPrefix}{}
\newcommand{\lsEditorSuffix}{}   

\iflsCollection  	% for collections: set \lsEditorSuffix depending on \@author
\AtBeginDocument{	
	\IfSubStr{\@author}{\&}	 	% if \@author contains \&
		{\renewcommand{\lsEditorSuffix}{(eds.)}}
		{\IfSubStr{\@author}{,}	% if \@author contains ,
			{\renewcommand{\lsEditorSuffix}{(eds.)}}
			{\renewcommand{\lsEditorSuffix}{(ed.)}}}
}
\else
\fi

\newcommand{\lsCoverBlock}{
	\begin{textblock}{155}(7.6,7.5)
	\color{\lsCoverBlockColor}
	\raggedright\rule{155mm}{225mm}
	\end{textblock}
	\iflsDraft
	   \begin{textblock}{155}(30,80)
		 \color{lsLightGray}
		 \rotatebox{40}{
			\begin{tabular}{c}
			\scalebox{10}{DRAFT}\\
			of \today, \currenttime
			\end{tabular}}
	   \end{textblock}
	\fi}

\newcommand{\lsCoverTitleAuthor}{
	\renewcommand{\newlineCover}{\\}
	\renewcommand{\newlineSpine}{}
	\lsCoverBlock

	\begin{textblock}{140}(15,17.5)
	\color{\lsCoverFontColor}
	\raggedright
	{\lsCoverTitleFont{\@title\\}}

	\ifx\@subtitle\empty
	\else \vspace{8mm} {\lsCoverSubTitleFont \@subtitle\\}
	\fi

	\vspace{11.2mm} % 20mm - 25pt
 
	\raggedright
	{\lsCoverAuthorFont 
		\lsEditorPrefix\@author\\}
	\end{textblock}}

\newcommand{\lsCoverSeries}{
	\begin{textblock}{95}(7.4,209)
	\color{white}
	\raggedright\rule{3.6mm}{3.5mm}
	\color{\lsCoverFontColor}
	\hspace{3mm}\parbox[t]{85mm}{\raggedright\lsCoverSeriesFont   
		\lsSeriesTitle\\}
	\end{textblock}}

\newcommand{\lsCoverLogo}{		
	\begin{textblock}{33}(124.6,205)
		\raggedright\IfFileExists{\logopath/langsci_logo_nocolor.pdf}{\includegraphics{\logopath/langsci_logo_nocolor.pdf}}{langsci logo}  
	\end{textblock}}

\newcommand{\lsFrontPage}{		% Front page
	\lsCoverBlock
	\lsCoverTitleAuthor
	\lsCoverSeries
	\lsCoverLogo}


\newcommand{\lsBackPage}{		% Back page
	\lsCoverBlock

	\begin{textblock}{115}(15,24)  % 30mm-6mm
	\color{white}
	{\raggedright
	 \lsBackTitleFont 
	 \lsBackTitle \\ \null} 

	\lsBackBodyFont

	\noindent 
	\lsBackBody
	\end{textblock}

	\begin{textblock}{40}(105,200)
	\lsBackBodyFont\sffamily
	\colorbox{white}{%
	\begin{pspicture}(0,0)(4.1,1in)
	\psbarcode[transx=0.4,transy=0.3]{\lsISBN}{includetext height=0.7}{isbn}
	\end{pspicture}
	%\EANisbn%			% remove this?
	%{\EAN \lsISBN }  	% bar code without isbn line
	}%	
	\end{textblock}}

\newcommand{\lsSpine}{			% Book spine
	\renewcommand{\newlineSpine}{\\}
	\renewcommand{\newlineCover}{}
	\begin{textblock}{40}(65,0)
	\rotatebox{90}{\color{black}\begin{minipage}[c][\lsSpineBreadth][c]{\paperheight}
		\color{\lsSeriesColor}
		\hspace{7.5mm}
		\IfFileExists{\logopath/langsci_spinelogo_nocolor.pdf}{$\vcenter{\hbox{\includegraphics[angle=-90,origin=c]{\logopath/langsci_spinelogo_nocolor.pdf}}}$}{logo}
		\hspace{15mm} 
		{\lsSpineTitleFont
			\rotatebox[origin=c]{180}{\pbox[c]{150mm}{\lsSpineTitle}}}
		\hspace{13mm}
		{\lsSpineAuthorFont 
			\rotatebox[origin=c]{180}{\pbox[c]{100mm}{\lsSpineAuthor\if\lsEditorSuffix\empty\else\ \lsEditorSuffix\fi}}}
	\end{minipage}} 
	\end{textblock}}

	
\newcommand{\lsCreateSpace}{%
\begin{tabularx}{\totalwidth}{p{\seitenbreite}p{\spinewidth}p{\seitenbreite}}
% \lsFrontPage 
1
& 
% \lsSpine 
2 
&
% \lsBackPage
3
\end{tabularx} 
}
 
\endinput
