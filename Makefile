.PHONY: all

TEXMFHOME := $(shell kpsewhich --var-value TEXMFHOME)

IFILES := $(wildcard *.sty *.cls)
OFILES := $(basename $(IFILES))

all : $(OFILES)

# These two rules are identical, and should preferably
# be merged.

% : %.sty
	-mkdir -p $(TEXMFHOME)/tex/latex/$@
	cp $< $(TEXMFHOME)/tex/latex/$@/$<

% : %.cls
	-mkdir -p $(TEXMFHOME)/tex/latex/$@
	cp $< $(TEXMFHOME)/tex/latex/$@/$<

