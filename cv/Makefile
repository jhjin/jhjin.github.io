# LaTex Makefile dependency
#   brew update
#   brew cask install mactex

SRC_FULLNAME=$(wildcard *.tex)
SRC_BASENAME=$(basename $(SRC_FULLNAME))

all:
	pdflatex $(SRC_FULLNAME)
	bibtex $(SRC_BASENAME)
	pdflatex $(SRC_FULLNAME)
	pdflatex $(SRC_FULLNAME)

clean:
	rm -f *.aux *.bbl *.blg *.log *.pdf
