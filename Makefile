PANDOC = pandoc

.PHONY: index.html

all: index.html

web : index.html

index.html:
	$(PANDOC) -s index.md --template=template.html --email-obfuscation=references -o index.html
