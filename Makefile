PANDOC = pandoc

.PHONY: index.html bibliography.xml

all: index.html

web: index.html

bib: bibliography.xml

index.html: bibliography.xml
	$(PANDOC) -s index.md --template=template.html --email-obfuscation=references -o index.html
	xmllint --xpath '/div' bibliography.xml > tmp.xml
	sed -e '/%bibliography%/r tmp.xml' -e '/%bibliography%/d' < index.html > index_tmp.html
	mv index_tmp.html index.html
	rm -f tmp.xml 

bibliography.xml:
	curl --silent ""https://api.zotero.org/groups/206974/items?format=bib"" > bibliography.xml

clean:
	rm -f bibliography.xml
