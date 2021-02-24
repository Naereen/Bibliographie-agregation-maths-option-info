# Quick Makefile to send files online
SHELL := /bin/bash -o pipefail

send_zamok:
	CP --exclude=.git . ${Szam}/agreg-2020/
	CP --exclude=.git . ${Szam}/publis/Bibliographie-agregation-maths-option-info/

# TODO passer le Makefile avec des wildcards bien propres
pdf:
	strapdown2pdf *.html

autonomize_html:
	strapdown2html *.html
	mv -vf *new.html pages-web-autonomes/

rename:
	for i in pages-web-autonomes/*new.html; do echo mv -vf "$f" "$(echo $f | sed 's/new.html/.html/')"; done
