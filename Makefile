all: figs ms

ms: figs
	make -C ms

figs: output output/fig1.pdf

output:
	mkdir -p output

output/fig1.pdf: analysis.R
	Rscript $<

clean:
	rm output/*
	make -C ms clean

.PHONY: all clean
