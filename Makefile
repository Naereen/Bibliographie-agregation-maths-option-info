# Quick Makefile to send files online
SHELL := /bin/bash -o pipefail

send_zamok:
	CP --exclude=.git . ${Szam}/agreg-2020/
	CP --exclude=.git . ${Szam}/publis/Bibliographie-agregation-maths-option-info/

pdf:
	strapdown2pdf *.html

autonomize_html:
	strapdown2html *.html
