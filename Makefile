# Licensed under the Tumbolia Public License. See footer for details.

.PHONY: orig cards icons vendor

all: help

#-------------------------------------------------------------------------------
watch: 
	@node_modules/.bin/wr "make build" \
		src \
		web/index.html \
		web/main.css

#-------------------------------------------------------------------------------
build: 
	@echo "running build"

	@mkdir -p tmp
	@-rm      tmp/*

	@node_modules/.bin/coffee --bare --compile --output tmp src/*

	@node_modules/.bin/browserify \
		--outfile web/modules.js \
		--insert-globals \
		tmp/main.js

#-------------------------------------------------------------------------------
vendor: \
	vendor-init \
	vendor-bootstrap \
	vendor-jquery

#-------------------------------------------------------------------------------
vendor-bootstrap:

	@mkdir -p web/vendor/bootstrap
	@curl -o  web/vendor/bootstrap/bootstrap.zip $(BOOTSTRAP_URL)
	@unzip    web/vendor/bootstrap/bootstrap.zip -d web/vendor/bootstrap
	@mv       web/vendor/bootstrap/bootstrap/*      web/vendor/bootstrap
	@rm       web/vendor/bootstrap/bootstrap.zip
	@rmdir    web/vendor/bootstrap/bootstrap

BOOTSTRAP_URL = http://twitter.github.com/bootstrap/assets/bootstrap.zip

#-------------------------------------------------------------------------------
vendor-jquery:
	curl -o web/vendor/jquery.min.js  $(JQUERY_URL).min.js
	curl -o web/vendor/jquery.js      $(JQUERY_URL).js

JQUERY_URL = http://code.jquery.com/jquery-1.9.0

#-------------------------------------------------------------------------------
vendor-init:
	@-rm -rf  web/vendor
	@mkdir -p web/vendor

#-------------------------------------------------------------------------------
icons:
	@echo converting icons

	@mkdir -p web/icons
	@-rm      web/icons/*

	@convert -resize 057x057 orig/TLineIcon.jpg web/icons/icon-057.png
	@convert -resize 072x072 orig/TLineIcon.jpg web/icons/icon-072.png
	@convert -resize 114x114 orig/TLineIcon.jpg web/icons/icon-114.png
	@convert -resize 144x144 orig/TLineIcon.jpg web/icons/icon-144.png

	@convert -resize 032x032 orig/TLineIcon.jpg web/icons/icon-032.png
	@convert -resize 064x064 orig/TLineIcon.jpg web/icons/icon-064.png
	@convert -resize 128x128 orig/TLineIcon.jpg web/icons/icon-128.png


#-------------------------------------------------------------------------------
cards:
	@echo converting cards from PDFs to PNGs

	@mkdir -p tmp
	@-rm      tmp/*

	@convert -density 300 orig/TLineBacks.pdf    tmp/TLineBacks.png
	@convert -density 300 orig/TLineCards.pdf[0] tmp/TLineCards-1.png
	@convert -density 300 orig/TLineCards.pdf[1] tmp/TLineCards-2.png
	@convert -density 300 orig/TLineCards.pdf[2] tmp/TLineCards-3.png
	@convert -density 300 orig/TLineCards.pdf[3] tmp/TLineCards-4.png
	@convert -density 300 orig/TLineCards.pdf[4] tmp/TLineCards-5.png
	@convert -density 300 orig/TLineCards.pdf[5] tmp/TLineCards-6.png


#---------------------------------------------------------------------------
# 188, 3186 - 862, 3186   938, 3186 
# 188, 2122
#
# 188, 2136
#
# card width    =  862 -  188 =  674
# card height   = 3186 - 2212 =  974
# next offset x =  938 -  188 =  750
# next offset y = 3186 - 2136 = 1050
#
# height = 3300 - 3186 = 114
#---------------------------------------------------------------------------

	@echo extracting cards

	@mkdir -p web/cards 
	@-rm      web/cards/*

	@convert -extract 674x974+0188+0114 -resize 200x288 tmp/TLineBacks.png   web/cards/card-b01.png

	@convert -extract 674x974+0188+0114 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p01.png
	@convert -extract 674x974+0938+0114 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p02.png
	@convert -extract 674x974+1688+0114 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p03.png
	@convert -extract 674x974+0188+1164 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p04.png
	@convert -extract 674x974+0938+1164 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p05.png
	@convert -extract 674x974+1688+1164 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p06.png
	@convert -extract 674x974+0188+2214 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p07.png
	@convert -extract 674x974+0938+2214 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p08.png
	@convert -extract 674x974+1688+2214 -resize 200x288 tmp/TLineCards-1.png web/cards/card-p09.png

	@convert -extract 674x974+0188+0114 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p10.png
	@convert -extract 674x974+0938+0114 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p11.png
	@convert -extract 674x974+1688+0114 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p12.png
	@convert -extract 674x974+0188+1164 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p13.png
	@convert -extract 674x974+0938+1164 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p14.png
	@convert -extract 674x974+1688+1164 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p15.png
	@convert -extract 674x974+0188+2214 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p16.png
	@convert -extract 674x974+0938+2214 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p17.png
	@convert -extract 674x974+1688+2214 -resize 200x288 tmp/TLineCards-2.png web/cards/card-p18.png

	@convert -extract 674x974+0188+0114 -resize 200x288 tmp/TLineCards-3.png web/cards/card-p19.png
	@convert -extract 674x974+0938+0114 -resize 200x288 tmp/TLineCards-3.png web/cards/card-p20.png
	@convert -extract 674x974+1688+0114 -resize 200x288 tmp/TLineCards-3.png web/cards/card-p21.png
	@convert -extract 674x974+0188+1164 -resize 200x288 tmp/TLineCards-3.png web/cards/card-p22.png
	@convert -extract 674x974+0938+1164 -resize 200x288 tmp/TLineCards-3.png web/cards/card-p23.png
	@convert -extract 674x974+1688+1164 -resize 200x288 tmp/TLineCards-3.png web/cards/card-s01.png
	@convert -extract 674x974+0188+2214 -resize 200x288 tmp/TLineCards-3.png web/cards/card-e01.png
#	@convert -extract 674x974+0938+2214 -resize 200x288 tmp/TLineCards-3.png web/cards/card-p08.png
#	@convert -extract 674x974+1688+2214 -resize 200x288 tmp/TLineCards-3.png web/cards/card-p09.png

	@convert -extract 674x974+0188+0114 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p24.png
	@convert -extract 674x974+0938+0114 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p25.png
	@convert -extract 674x974+1688+0114 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p26.png
	@convert -extract 674x974+0188+1164 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p27.png
	@convert -extract 674x974+0938+1164 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p28.png
	@convert -extract 674x974+1688+1164 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p29.png
	@convert -extract 674x974+0188+2214 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p30.png
	@convert -extract 674x974+0938+2214 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p31.png
	@convert -extract 674x974+1688+2214 -resize 200x288 tmp/TLineCards-4.png web/cards/card-p32.png

	@convert -extract 674x974+0188+0114 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p33.png
	@convert -extract 674x974+0938+0114 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p34.png
	@convert -extract 674x974+1688+0114 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p35.png
	@convert -extract 674x974+0188+1164 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p36.png
	@convert -extract 674x974+0938+1164 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p37.png
	@convert -extract 674x974+1688+1164 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p38.png
	@convert -extract 674x974+0188+2214 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p39.png
	@convert -extract 674x974+0938+2214 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p40.png
	@convert -extract 674x974+1688+2214 -resize 200x288 tmp/TLineCards-5.png web/cards/card-p41.png

	@convert -extract 674x974+0188+0114 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p42.png
	@convert -extract 674x974+0938+0114 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p43.png
	@convert -extract 674x974+1688+0114 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p44.png
	@convert -extract 674x974+0188+1164 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p45.png
	@convert -extract 674x974+0938+1164 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p46.png
#	@convert -extract 674x974+1688+1164 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p06.png
#	@convert -extract 674x974+0188+2214 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p07.png
#	@convert -extract 674x974+0938+2214 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p08.png
#	@convert -extract 674x974+1688+2214 -resize 200x288 tmp/TLineCards-6.png web/cards/card-p09.png

#-------------------------------------------------------------------------------
orig:
	@mkdir -p orig
	@-rm      orig/*

	@echo downloading Timeline media

	@wget -O orig/TLineRules.pdf http://www.cheapass.com/sites/default/files/TLineRules.pdf
	@wget -O orig/TLineCards.pdf http://www.cheapass.com/sites/default/files/TLineCards.pdf
	@wget -O orig/TLineBacks.pdf http://www.cheapass.com/sites/default/files/TLCardBacks.pdf
	@wget -O orig/TLineIcon.jpg  http://www.cheapass.com/sites/default/files/TimeLineBug.jpg

#-------------------------------------------------------------------------------
help:
	@echo "targets:"
	@echo "   build  - run a build"
	@echo "   watch  - watch for source changes, then run a build"
	@echo "   vendor - download 3rd party files"
	@echo "   orig   - download the original media"
	@echo "   cards  - generate card images from the original media"
	@echo "   icons  - generate icons from the original media" 

	@echo "You'll need to run orig before cards and before icons."

#-------------------------------------------------------------------------------
# Copyright (c) 2013 Patrick Mueller
#
# Tumbolia Public License
#
# Copying and distribution of this file, with or without modification, are
# permitted in any medium without royalty provided the copyright notice and
# this notice are preserved.
#
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#   0. opan saurce LOL
#-------------------------------------------------------------------------------