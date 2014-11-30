all: compile

compile:
	touch cv.bbl
	rm *.bbl
	pdflatex cv.tex
	bibtex cv
	pdflatex cv.tex
	pdflatex cv.tex
