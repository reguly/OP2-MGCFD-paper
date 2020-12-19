#!/bin/bash

#run skript with 
# ./script gnu_file.gnu figurename.pdf
# example 
# ./script.sh roofline_skylake.gnu Roofline_SkyLake.pdf
gnuplot $1; ps2pdf roofline.ps roofline.pdf; pdfcrop roofline.pdf roofline.pdf; mv roofline.pdf $2; evince $2
rm roofline.ps

#./script.sh roofline_v100.gnu Roofline_V100.pdf;./script.sh roofline_radeonii.gnu Roofline_RadionII.pdf;./script.sh roofline_p100.gnu Roofline_P100.pdf;./script.sh roofline_isambard.gnu Roofline_Isambard.pdf;./script.sh roofline_skylake.gnu Roofline_SkyLake.pdf
