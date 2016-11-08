SRCARTICLE=article.tex commands.tex title.tex
SRCSLIDES=slides_packages.tex commands.tex slides_section1.tex slides_section2and3.tex slides_section4and5.tex slides_section6.tex
SRCTIKZ=tikz/tikz_env.tex tikz/tikz_arch.tex tikz/tikz_arm.tex tikz/tikz_ctrl.tex tikz/tikz_arm_space.tex tikz/tikz_qops.tex tikz/tikz_slides_arm_space.tex tikz/tikz_qopslqp.tex tikz/tikz_lqp.tex tikz/tikz_qops2.tex

all: article.pdf slides.pdf

article.pdf: $(SRCARTICLE) $(SRCTIKZ) article.aux
	pdflatex article.tex
	pdflatex article.tex

article.aux: article.bib
	pdflatex article.tex
	bibtex article

slides.pdf: $(SRCSLIDES) $(SRCTIKZ) slides.tex
	pdflatex slides.tex
	pdflatex slides.tex

slides_handout.pdf: $(SRCSLIDES) $(SRCTIKZ) slides_handout.tex
	pdflatex slides_handout.tex
	pdflatex slides_handout.tex

bib.pdf: bib.tex bib.aux
	pdflatex bib.tex
	pdflatex bib.tex

bib.aux: article.bib
	pdflatex bib.tex
	bibtex bib

clean:
	@echo "suppression des fichiers de compilation"
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.out *.nav *.snm *.bbl *.blg

init: clean
	@echo "suppression des fichiers cibles"
	@rm -f *.pdf
