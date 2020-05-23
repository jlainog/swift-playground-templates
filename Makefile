dir = $(HOME)/Library/Developer/Xcode/Templates/File\ Templates/

install: $(dir)
	cp -R Playground $(dir)
	cp -R Source $(dir)
	cp -R User\ Interface $(dir)

$(dir):
	mkdir -p $(dir)

.PHONY = install
