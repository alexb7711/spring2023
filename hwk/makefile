# MAKEFILE FOR DOCS

##===============================================================================
# Variables
IMGDIR = ./img
SRC   := $(shell find . -type f -name "*.org")					# Source files
PDF   := $(patsubst %.org, %.pdf, $(SRC))

##===============================================================================
# Recipes

##-------------------------------------------------------------------------------
#
all: $(PDF) $(SRC)

##-------------------------------------------------------------------------------
#
clean:
	rm -f $(PDF) $(PNG)

##===============================================================================
# Helper

##-------------------------------------------------------------------------------
#
%.pdf: %.org
	emacs -Q --script build-paper.el
