##
## Programmer:    Craig Stuart Sapp <craig@ccrma.stanford.edu>
## Creation Date: Wed Dec 25 21:47:38 PST 2024
## Last Modified: Wed Dec 25 21:47:41 PST 2024
## Syntax:        GNU Makefile
## Filename:      Makefile
## vim:           ts=3
##
## Description: Makefile to run tasks for Kolberg EsAC repository.
##

BINDIR = bin
EDIR   = esac
HDIR   = humdrum

.PHONY: $(EDIR) $(HDIR)

##############################
##
## make/make all == Listk available make targets.
##

all:
	@echo "make split    == split EsAC melodies into separate files";
	@echo "make volumes  == Join individual EsAC melodies into volume files";



##############################
##
## make split == Split input file into separate records, with filenames
##               based on the KEY/SIG IDs, which must be unique.
##

e: split
s: split
esac: split
EsAC: split
split:
	-rm -rf $(EDIR)/*
	cat input/dwok-20240831.txt | $(BINDIR)/splitByVolumeAndRecord



##############################
##
## make volumes == Merge individual files in esac subdirectories into volume files.
##

v: volumes
volume: volumes
volumes:
	$(BINDIR)/makeVolumes



##############################
##
## make humdrum == Convert EsAC files into Humdrum files.
##

k: humdrum
kern: humdrum
h: humdrum
hum: humdrum
humdrum:
	-rm -rf $(HDIR)/*
	$(BINDIR)/makeHumdrumFiles



