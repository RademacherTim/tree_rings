#========================================================================================#
# This script reads the raw tree ring width data from the warm ants experiment as measured 
# in ImageJ using the ObjectJ plugin and TreeRings-13 macros. 
#
# All cores are red oaks (Quercus Rubra) measured before the start of the growing season
# in 2017.
#
# Assuming AA1 was treated but either H07 or H08 was not.
# Treatments:
#   - AA01 = 3.0 degC
#   - H01  = 0.0 degC
#   - H02  = 5.0 degC
#   - H03  = 1.5 degC
#   - H04  = 0.0 degC
#   - H05  = 2.0 degC
#   - H06  = 5.5 degC
#   - H07  = 4.0 degC or not treated - code assumes not treated
#   - H08  = 4.0 degC or not treated - code assumes 4.0 degC
#   - H09  = 0.0 degC
#   - H10  = 2.5 degC
#   - H11  = 4.5 degC
#   - H12  = 3.5 degC
#----------------------------------------------------------------------------------------#
library ('RColorBrewer')
library ('dplR')

colours <- c (rev (brewer.pal (name = 'YlOrRd', n = 9)  [2:9]),  # Colours for heated plots  
              brewer.pal (name = 'PiYG',   n = 11) [8],          # Colour for original controls
              brewer.pal (name = 'BrBG',   n = 11) [8])          # Colour for additional controls
raw <- read.csv ('../data/warm_ants_results_table.csv')
names (raw) <- c ('Year','AA01','H02','H09','AA06?','AA02','H01','AA05','AA04','AA03','AA09','AA08','AA07','H03','H04.2','H04','H05','H06','H07','H08','H10','H12','H11')
str (raw)
data <- cbind (raw$Year,  raw$H06,  raw$H02,  raw$H11,     raw$H08,  raw$H12,  raw$AA01,  
               raw$H10,   raw$H05,  raw$H03,  raw$H01,     raw$H04,  raw$H09,   raw$H07, 
               raw$AA02, raw$AA03, raw$AA04, raw$AA05, raw$`AA06?`, raw$AA07,  raw$AA08, 
               raw$AA09)
colnames (data) <- c ('Year','5p5degC','4p5degC','4p0degC','3p5degC','3p0degC','2p5degC',
                      '2p0degC','1p5degC','0degC.1','0degC.2','0degC.3','0degC.4',
                      '0degC.5','0degC.6','0degC.7','0degC.8','0degC.9','0degC.10',
                      '0degC.11','0degC.12','0degC.13')
# Plot the RW
plot (x    = data [, 1], # year
      y    = data [, 2], # H01
      typ  = 'l',
      col  = 'white',
      xlab = 'time (year A.D.)',
      ylab = 'ring width (cm)',
      ylim = c (0, 0.25))
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
lines (x = data [, 1], y = data [, 11], lwd = 2, col = colours [9])
lines (x = data [, 1], y = data [, 12], lwd = 2, col = colours [9])
lines (x = data [, 1], y = data [, 13], lwd = 2, col = colours [9])
rect (ybottom = 0, xleft = 2009, ytop = 0.30, xright = 2015, col = '#901C3B33', lty = 0)

# Plot from 1989 onwards
plot (x    = data [, 1], # year
      y    = data [, 2], # H01
      typ  = 'l',
      col  = 'white',
      xlab = 'time (year A.D.)',
      ylab = 'ring width (cm)',
      ylim = c (0, 0.25),
      xlim = c (1989, 2016))
sapply (seq (1920, 2016, by = 10), function (x) abline (v = x, lwd  = 0.5, col = 'grey'))
#sapply (2:13, function (x) lines (x = data [, 1], y = data [, x], lwd = 0.5)) # plot all heated trees
lines (x = data [, 1], y = data [,  2], lwd = 2, col = colours [1])
lines (x = data [, 1], y = data [,  3], lwd = 2, col = colours [2])
lines (x = data [, 1], y = data [,  4], lwd = 2, col = colours [3])
lines (x = data [, 1], y = data [,  5], lwd = 2, col = colours [4])
lines (x = data [, 1], y = data [,  6], lwd = 2, col = colours [5]) 
lines (x = data [, 1], y = data [,  7], lwd = 2, col = colours [6]) 
lines (x = data [, 1], y = data [,  8], lwd = 2, col = colours [7])
lines (x = data [, 1], y = data [,  9], lwd = 2, col = colours [8])
lines (x = data [, 1], y = data [, 10], lwd = 2, col = colours [9]) # Awfully off, except for 1998
lines (x = data [, 1], y = data [, 11], lwd = 2, col = colours [9])
lines (x = data [, 1], y = data [, 12], lwd = 2, col = colours [9])
lines (x = data [, 1], y = data [, 13], lwd = 2, col = colours [9])
rect (ybottom = -10, xleft = 2009, ytop = 0.30, xright = 2015, col = '#901C3B33', lty = 0)
#========================================================================================#
