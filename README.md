# OCRtoTXT
A small script that takes PDF scans as input, OCR's them, and outputs said text to a textfile.  

I've successfully used this tool both on Ubuntu 18.04 and MacOS Mojave 10.14.1. With some quick modifications,
this would also be a good tool to power through a large number of scanned PDFs.

But this thing won't work unless you have installed and properly configured Tesseract, ImageMagick, and Ghostscript. 

on Ubuntu, run 

sudo apt-get install imagemagick ghostscript tesseract-ocr


on MacOS, assuming you have Homebrew installed, run 

brew install imagemagick ghostscript tesseract

Next, you need to tell ImageMagick to allocate enough memory for itself. By default it only allocates itslef like 1gig of memory. 
I gave it about 7gigs as a swap file, and boosted other values as well. 
If you skip this step, it will likely stall mid .tiff conversion on long documents, giving you an incomplete OCR.
For info on how to do it, see http://www.imagemagick.org/discourse-server/viewtopic.php?t=34377

On some systemsyou will need to give imagemagick permission to deal with PDFs at all, 
which for security reasons it can't seem to do by default. 
Instructions on how to do that are here: https://stackoverflow.com/questions/52861946/imagemagick-not-authorized-to-convert-pdf-to-an-image
(tl;dr on the above is give read|write access to the PDF pattern whereever it is in your imagemagick policy.xml configuration file

