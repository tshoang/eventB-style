default: eventB.pdf sample-eventB.pdf sample-eventB-color.pdf sample-eventB-compact.pdf

eventB.pdf: eventB.sty
	pdflatex eventB.dtx
	makeindex -s gglo.ist -o eventB.gls eventB.glo
	makeindex -s gind.ist -o eventB.ind eventB.idx
	pdflatex eventB.dtx

eventB.sty: eventB.ins eventB.dtx
	pdflatex eventB.ins

sample-eventB.pdf: sample-eventB.tex sample-eventB-main.tex eventB.sty
	pdflatex sample-eventB.tex

sample-eventB-color.pdf: sample-eventB-color.tex sample-eventB-main.tex eventB.sty
	pdflatex sample-eventB-color.tex

sample-eventB-compact.pdf: sample-eventB-compact.tex sample-eventB-main.tex eventB.sty
	pdflatex sample-eventB-compact.tex


clean:
	rm -f *.aux *.bbl *.blg eventB.glo eventB.gls eventB.idx eventB.ilg eventB.ind *.log *.out *.synctex.gz eventB.toc

cleanall: clean
	rm -f eventB.pdf eventB.sty sample-eventB.pdf sample-eventB-color.pdf sample-eventB-compact.pdf

