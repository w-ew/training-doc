MARKDOWN=markdown
BROWSER=xdg-open
HIGHLIGHT=pygments
TARGET=TRAINING

SRC = $(TARGET).md
SRC_HTML = header.html footer.html 
SRC_RESOURCES = caja-ssh.png eclipse-debug.png git_freescale_com.png \
                gparted.png MCIMX6UL-EVK-BD_M.jpg nxp_logo.png  \
                yocto-environment-ref.png swiss.css

TMPFILE=/tmp/training.html.tmp

.PHONY: all
all: $(TARGET).html $(TARGET).pdf $(TARGET).zip

$(TARGET).pdf: $(SRC)
	pandoc $(SRC) --number-sections --latex-engine=xelatex --listings -H config.tex -o $(TARGET).pdf

$(TARGET).html: $(SRC) $(SRC_HTML)
	cat header.html > $(TMPFILE)
	#$(MARKDOWN) $< >> $(TMPFILE)
	pandoc --number-sections --highlight-style=$(HIGHLIGHT) $(TARGET).md >> $(TMPFILE)
	cat footer.html >> $(TMPFILE)
	mv $(TMPFILE) $@

$(TARGET).zip: $(TARGET).html $(SRC_RESOURCES)
	rm -rf $(TARGET).zip
	zip $(TARGET).zip $(TARGET).html $(SRC_RESOURCES)


.PHONY: exec_html
exec: $(TARGET).html
	$(BROWSER) $(TARGET).html




.PHONY: clean
clean: 
	rm -rf $(TARGET).html $(TARGET).pdf $(TARGET).zip

