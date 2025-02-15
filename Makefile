# STOLEN FROM: https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: odt docx pdf html

# CUSTOM BUILD RULES

odt:
	pandoc -f markdown --reference-doc=styles/style.odt -o Satzung.odt Satzung.md -s -N

docx: odt
	libreoffice --headless --convert-to docx Satzung.odt

pdf: odt
	libreoffice --headless --convert-to pdf Satzung.odt

html:
	pandoc -f markdown -o Satzung.html Satzung.md -s

clean:
	rm -f Satzung.docx
	rm -f Satzung.pdf
	rm -f Satzung.odt
	rm -f Satzung.html
