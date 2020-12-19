#!/usr/bin/gnuplot -persist
#
#    
#    	G N U P L O T
#    	Version 4.2 patchlevel 6 
#    	last modified Sep 2009
#    	System: Linux 2.6.32-55-generic
#    
#    	Copyright (C) 1986 - 1993, 1998, 2004, 2007 - 2009
#    	Thomas Williams, Colin Kelley and many others
#    
#    	Type `help` to access the on-line reference manual.
#    	The gnuplot FAQ is available from http://www.gnuplot.info/faq/
#    
#    	Send bug reports and suggestions to <http://sourceforge.net/projects/gnuplot>
#    
unset clip points
set clip one
unset clip two
set bar 1.000000
set xdata
set ydata
set zdata
set x2data
set y2data
set boxwidth
set style fill  empty border
set dummy x,y
set format x "% g"
set format y "% g"
set format x2 "% g"
set format y2 "% g"
set format z "% g"
set format cb "% g"
set angles radians
set grid nopolar
set grid xtics mxtics ytics mytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   linetype 0 linewidth 1.000,  linetype 0 linewidth 1.000
set key title ""
set key off
unset label
unset arrow
unset style line
unset style arrow
unset logscale
set logscale x 10
set logscale y 10
set offsets 0, 0, 0, 0
set pointsize 1
set encoding default
unset polar
unset parametric
unset decimalsign
set view 60, 30, 1, 1  
set samples 1000, 1000
set isosamples 10, 10
set surface
unset contour
set clabel '%8.3g'
set mapping cartesian
set datafile separator whitespace
unset hidden3d
set cntrparam order 4
set cntrparam linear
set cntrparam levels auto 5
set cntrparam points 5
set size 1,1
set origin 0,0
set style data lines
set style function lines
set xzeroaxis linetype -2 linewidth 1.000
set yzeroaxis linetype -2 linewidth 1.000
set x2zeroaxis linetype -2 linewidth 1.000
set y2zeroaxis linetype -2 linewidth 1.000
set ticslevel 0.5
set mxtics 10
set mytics 10
set mztics default
set mx2tics default
set my2tics default
set mcbtics default
set xtics autofreq
set ytics autofreq
set ztics autofreq
set nox2tics
set noy2tics
set cbtics autofreq
#set title "Empirical Roofline Graph (Results.cori.nersc.gov.01/Run.002)" 
set timestamp bottom 
set timestamp "" 
set rrange [ * : * ] noreverse nowriteback  # (currently [0.00000:10.0000] )
set trange [ * : * ] noreverse nowriteback  # (currently [-5.00000:5.00000] )
set urange [ * : * ] noreverse nowriteback  # (currently [-5.00000:5.00000] )
set vrange [ * : * ] noreverse nowriteback  # (currently [-5.00000:5.00000] )
set xlabel "FLOPs / Byte" 
set x2label "" 
set xrange [1.000000e-02 : 1.000000e+02] noreverse nowriteback
set x2range [ * : * ] noreverse nowriteback  # (currently [-10.0000:10.0000] )
set ylabel "GFLOPs / sec" 
set y2label "" 
set yrange [1.000000e+01 : 1600] noreverse nowriteback
set y2range [ * : * ] noreverse nowriteback  # (currently [-10.0000:10.0000] )
set zlabel "" 
set zrange [ * : * ] noreverse nowriteback  # (currently [-10.0000:10.0000] )
set cblabel "" 
set cbrange [ * : * ] noreverse nowriteback  # (currently [-10.0000:10.0000] )
set zero 1e-08
set lmargin  -1
set bmargin  -1
set rmargin  -1
set tmargin  -1
set locale "C"
set pm3d explicit at s
set pm3d scansautomatic
set palette positive nops_allcF maxcolors 0 gamma 1.5 color model RGB 
set palette rgbformulae 7, 5, 15
set colorbox default
set loadpath 
set fit noerrorvariables

set term postscript solid color rounded
set output "roofline.ps"

# Plotting goes after this...
set label '1150.4 GFLOPs/sec (FP64 Maximum)' at 2.0000000e+00,1.3805280e+03 left textcolor rgb '#000080'
set label 'L1 - 4090.8 GB/s' at 4.2504707e-02,2.1039166e+02 left rotate by 53 textcolor rgb '#800000'
set label 'L2 - 2646.9 GB/s' at 5.2841135e-02,1.6923625e+02 left rotate by 53 textcolor rgb '#800000'
set label 'DRAM - 109.3 GB/s' at 2.2921938e-01,3.0326045e+01 left rotate by 53 textcolor rgb '#800000'

set object circle at 5.6,195.45 size 1.1 fc rgb '#472c7a' fillstyle solid 0.7
set label "MPI" at 5.6 - 2.50,195.45 front font "Arial,15"

set object circle at 5.6,273.49 size 1.1 fc rgb "blue" fillstyle solid 0.7
set label "MPI+SIMD" at 5.6 + 1.0,273.49 front font "Arial,15"

set object circle at 5.6,191.44 size 1.1 fc rgb '#f89441' fillstyle solid 0.7
set label "OMP" at 5.6 + 1,191.44 front font "Arial,15"

set object circle at 5.6,144.63 size 1.1 fc rgb "red" fillstyle solid 0.7
set label "SYCL" at 5.6 + 1.0,144.63 front font "Arial,15"



plot \
     (x <= 2.8122754e-01 ? 4.0907800e+03 * x : 1/0) lc 1 lw 2,\
     (x <= 4.3463839e-01 ? 2.6468900e+03 * x : 1/0) lc 1 lw 2,\
     (x <= 1.0521676e+01 ? 1.0934000e+02 * x : 1/0) lc 1 lw 2,\
     (x >= 2.8122754e-01 ? 1.1504400e+03 : 1/0) lc 3 lw 2
