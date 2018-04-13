# creating our Satzung with pandoc

Since [libreoffice](https://www.libreoffice.org/) drove us crazy with line 
numbering we decided to use latex. But because a third party requested a 
.doc-document we found out it is really hard to transform latex into an odt /
doc.

So the next attempt is pandoc.

First we transformed out tex-document to md with 
`pandoc -f latex -t markdown -o Satzung.md Satzung.pdf`.

This worked quite well.

Then we decided to use CSS to style the document.

Sadly we found out that only html and pdf (via the wkhtml2pdf program) support
CSS styling.

But we wanted a doc or a odt!

So diving into the [pandoc manual](https://pandoc.org/MANUAL.html) we found the 
`--reference-doc=` option.

[markdow-resume](https://github.com/sdsawtelle/markdown-resume) by [sdawtelle](https://github.com/sdsawtelle) has been quite helpfull as well.

Create the reference file via 
`pandoc --print-default-data-file reference.odt > custom-reference.odt`

Then run `pandoc -f markdown --reference-doc=custom-reference.odt -o style.odt Satzung.md`

Now modify style.odt in libreoffice and save it as style.odt and style.docx.
Verify style.docx looks the way you want as well.

You can now generate your files.
