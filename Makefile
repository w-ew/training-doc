MARKDOWN=markdown
BROWSER=xdg-open
HIGHLIGHT=pygments
TARGET=TRAINING

SRC = $(TARGET).md
SRC_HTML = header.html footer.html

TMPFILE=/tmp/training.html.tmp

.PHONY: all
all: $(TARGET).html $(TARGET).pdf

$(TARGET).pdf: $(SRC)
	pandoc $(SRC) --number-sections --latex-engine=xelatex --highlight-style=$(HIGHLIGHT) -o $(TARGET).pdf

$(TARGET).html: $(SRC) $(SRC_HTML)
	cat header.html > $(TMPFILE)
	#$(MARKDOWN) $< >> $(TMPFILE)
	pandoc --number-sections --highlight-style=$(HIGHLIGHT) $(TARGET).md >> $(TMPFILE)
	cat footer.html >> $(TMPFILE)
	mv $(TMPFILE) $@




.PHONY: exec_html
exec: $(TARGET).html
	$(BROWSER) $(TARGET).html




.PHONY: clean
clean: 
	rm -rf $(TARGET).html $(TARGET).pdf

