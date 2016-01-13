# specify your main target here:
all: book pod cover

# specify thh main file and all the files that you are including
SOURCE= main.tex chapters/01.tex chapters/02.tex chapters/03.tex\
localbibliography.bib\
LSP/langsci.cls
	 
main.pdf: main.tex $(SOURCE)
	xelatex -no-pdf main 
	bibtex -min-crossrefs=200 main
	xelatex  -no-pdf main
	sed -i s/.*\\emph.*// main.adx #remove titles which biblatex puts into the name index
	sed -i 's/hyperindexformat{\\\(infn {[0-9]*\)}/\1/' main.sdx
	sed -i 's/hyperindexformat{\\\(infn {[0-9]*\)}/\1/' main.adx
	makeindex -o main.and main.adx
	makeindex -o main.lnd main.ldx
	makeindex -o main.snd main.sdx
	xelatex -no-pdf main 
	xelatex main 

#create only the book
book: main.pdf 

#create a png of the cover
cover: main.pdf
	convert main.pdf\[0\] -quality 100 -background white -alpha remove -bordercolor black -border 2  cover.png
	display cover.png

#extract the front cover, back cover and spine from the pdf	
triptychon: main.pdf#output=long has to be used for this to work
	pdftk A=main.pdf cat  A1  output front.pdf 
	pdftk A=main.pdf cat A2 output back.pdf 
	pdftk A=main.pdf cat A3 output spine.pdf

#prepare for print on demand services	
pod: bod createspace

#prepare for submission to BOD
bod: triptychon #output=long has to be used for this to work
	pdftk A=main.pdf B=blank.pdf cat B A4-end output tmp.pdf 
	./filluppages tmp.pdf bod/bodcontent.pdf
	\rm tmp.pdf
	xelatex bodcover.tex
	mv bodcover.pdf bod/

# prepare for submission to createspace
createspace: triptychon #output=long has to be used for this to work
	xelatex createspacecover.tex
	mv createspacecover.pdf createspace
	pdftk A=main.pdf B=blank.pdf cat B A4-end output createspace/createspacecontent.pdf

#housekeeping	
clean:
	rm -f */*.aux *.bak *~ *.backup *.tmp \
	*.adx *.and *.idx *.ind *.ldx *.lnd *.sdx *.snd *.rdx *.rnd *.wdx *.wnd \
	*.log *.blg *.ilg \
	*.aux *.toc *.cut *.out *.tpm *.bbl *-blx.bib *_tmp.bib \
	*.glg *.glo *.gls *.wrd *.wdv *.xdv \
	*.run.xml

realclean: clean
	rm -f *.dvi *.ps *.pdf 
