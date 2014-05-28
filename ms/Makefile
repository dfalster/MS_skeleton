TARGETS = MS.pdf
FIGURES_pdf = figs/fig1.pdf
FIGURES_png =  $(FIGURES_pdf:.pdf=.png)

all:  $(TARGETS) figs

figs: $(FIGURES_pdf) $(FIGURES_png)

MS.pdf: MS.md include.tex style.csl figs
	pandoc $< --csl=style.csl --filter pandoc-citeproc --bibliography=refs.bib --template=include.tex --variable mainfont="Times New Roman" --variable sansfont=Arial --variable fontsize=12pt --latex-engine=xelatex -o $@

style.csl:
	curl -k https://raw.githubusercontent.com/citation-style-language/styles/master/the-american-naturalist.csl > $@

figs/fig%.pdf: ../output/fig%.pdf
	mkdir -p figs
	cp $< $@

../output/fig%.pdf:
	make -C .. figs

%.png: %.pdf
	convert -density 300 -background white -resize '1000' $< $@

clean:
	rm -f $(TARGETS) $(FIGURES_pdf) $(FIGURES_png)

.PHONY: all clean
