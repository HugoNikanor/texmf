.PHONY: all

TEXMFHOME=$$(kpsewhich --var-value TEXMFHOME)

% : %.sty
	-mkdir -p $(TEXMFHOME)/tex/latex/$@
	cp $< $(TEXMFHOME)/tex/latex/$@/$<

all : keyword quot
