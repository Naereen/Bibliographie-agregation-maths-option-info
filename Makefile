# Quick Makefile to send files online
SHELL := /bin/bash -o pipefail

all:	build send

# senders
send:	send_zamok
send_zamok:
	CP --exclude=.git . ${Szam}/agreg-2020/
	CP --exclude=.git . ${Szam}/publis/Bibliographie-agregation-maths-option-info/

# builders
build:	all_pdfs all_autonom

FICHES_HTML=$(wildcard *.html)
PDFS=$(FICHES_HTML:.html=.pdf)
AUTONOM_HTML=$(FICHES_HTML:.html=.autonom.html)
AUTONOM_HTML=$(pages-web-autonomes/AUTONOM_HTML)

listes: liste_fiches liste_pdfs liste_autonom
liste_fiches:
	@echo "Liste des fiches HTML"
	@echo $(FICHES_HTML)
	@ls -larth $(FICHES_HTML)
liste_pdfs:
	@echo "Liste des PDF"
	@echo $(PDFS)
	@ls -larth $(PDFS)
liste_autonom:
	@echo "Liste des fiches autonomes HTML"
	@echo $(AUTONOM_HTML)
	@ls -larth $(AUTONOM_HTML)

all_pdfs:	$(PDFS)
all_autonom:	$(AUTONOM_HTML)

autonomize_html:	all_autonom
	mv -vf *autonom.html pages-web-autonomes/

%.pdf:	%.html
	strapdown2pdf "$<"

%.autonom.html:	%.ipynb
	strapdown2pdf "$<"
