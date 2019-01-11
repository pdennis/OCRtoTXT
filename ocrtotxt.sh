#!/bin/sh
#If you're going to set this up on a new machine, you need to do a few things. First of all, you will need to install imagemagick and tesseract, of course. You also need to install Ghostscript 

#Next, you need to tell ImageMagick to allocate enough memory for itself. By default it only allocates itslef like 1gig of memory. I gave it about 7gigs as a swap file, and boosted other values as well. 
#Otherwise it will stall mid .tiff conversion.
#for info on how to do that, see http://www.imagemagick.org/discourse-server/viewtopic.php?t=34377

#also, you will need to give imagemagick permission to even deal with PDFs at all, which for security reasons it can't seem to do by default. 
#instructions on how to do that are here: https://stackoverflow.com/questions/52861946/imagemagick-not-authorized-to-convert-pdf-to-an-image
#(tl;dr on the above is give read|write access to the PDF pattern whereever it is in your imagemagick policy.xml configuration file


echo "usage: ocrtotxt [PDF Location] [output file name]"

UNIQUE=$(date +%s) #make a unique directory for these files to live in
DIR=$2$UNIQUE
mkdir ./$DIR

convert -density 300 $1 -depth 8 -strip -background white -alpha off ./$DIR/$2.tiff

tesseract ./$DIR/$2.tiff $2

rm -r ./$DIR

echo file $2.txt created