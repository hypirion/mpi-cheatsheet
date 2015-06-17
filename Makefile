MAIN = main
SUBDIRS = 

all: main.pdf

%.pdf: %.tex
	pdflatex $<

clean:
	for s in $(TEMPS); do rm -f $(MAIN).$$s; done
	for dir in $(SUBDIRS); do $(MAKE) -C $$dir clean; done

purge: clean
	-rm -f $(MAIN).pdf

remake:
	-rm -f $(MAIN).pdf
	$(MAKE) all

repeatedly:
	latexmk -pdf -pdflatex='pdflatex -shell-escape %O %S' -pvc $(MAIN)

.PHONY: repeatedly clean purge
