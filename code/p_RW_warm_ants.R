#========================================================================================#
# This script reads the raw tree ring width data from the warm ants experiment as measured 
# in ImageJ using the ObjectJ plugin and TreeRings-13 macros. 
#
# All cores are red oaks (Quercus Rubra) measured before the start of the growing season
# in 2017.
#
#----------------------------------------------------------------------------------------#
library ('RColorBrewer')

colours <- c (brewer.pal (name = 'YlOrRd', n = 9), brewer.pal (name = 'PiYG', n = 11) [8], brewer.pal (name = 'BrBG', n = 11) [8]) 
raw <- read.csv ('../data/warm_ants_results_table.csv')
names (raw) <- c ('Year','AA01','H02','H09','AA06?','AA02','H01','AA05','AA04','AA03','AA09','AA08','AA07','H03','H04.2','H04','H05','H06','H07','H08','H10','H12','H11')
str (raw)
treatment <- c ()
data <- cbind (raw$Year,  raw$H01,  raw$H02,  raw$H03,     raw$H04,  raw$H05,   raw$H06,  
               raw$H07,   raw$H08,  raw$H09,  raw$H10,     raw$H11,  raw$H12,  raw$AA01, 
               raw$AA02, raw$AA03, raw$AA04, raw$AA05, raw$`AA06?`, raw$AA07,  raw$AA08, 
               raw$AA09)
colnames (data) <- c ('Year','H01','H02','H03','H04','H05','H06','H07','H08','H09','H10','H11','H12','AA01','AA02','AA03','AA04','AA05','AA06','AA07','AA08','AA09')

plot (x   = data [, 1], # year
      y   = data [, 2], # H01
      typ = 'l',
      col = 'white')
sapply (seq (1920, 2020, by = 10), function (x) abline (v = x, lwd  = 0.5, col = 'grey'))
#sapply (2:13, function (x) lines (x = data [, 1], y = data [, x], lwd = 0.5)) # plot all heated trees
lines (x = data [, 1], y = data [,  2], lwd = 2, col = colours [1])
lines (x = data [, 1], y = data [,  3], lwd = 2, col = colours [2])
lines (x = data [, 1], y = data [,  4], lwd = 2, col = colours [3])
lines (x = data [, 1], y = data [,  5], lwd = 2, col = colours [4])
lines (x = data [, 1], y = data [,  6], lwd = 2, col = colours [5])
lines (x = data [, 1], y = data [,  7], lwd = 2, col = colours [6])
lines (x = data [, 1], y = data [,  8], lwd = 2, col = colours [7])
lines (x = data [, 1], y = data [,  9], lwd = 2, col = colours [8])
lines (x = data [, 1], y = data [, 10], lwd = 2, col = colours [9])
lines (x = data [, 1], y = data [, 11], lwd = 2, col = colours [10])
lines (x = data [, 1], y = data [, 12], lwd = 2, col = colours [10])
lines (x = data [, 1], y = data [, 13], lwd = 2, col = colours [10])
rect (ybottom = 0, xleft = 2009, ytop = 0.30, xright = 2015, col = '#901C3B33', lty = 0)
#========================================================================================#