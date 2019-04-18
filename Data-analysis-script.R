#############UNIX Commands for File Splitting#############
# awk '/Interval/{x="EXPFIVE"++i;}{print > x;}' EXP.txt
# unix2dos EXPFIVE*

##############Parameters Initialise#######################
FS <- 100000     # Hz Sampling Frequency
SKIP <- 0        # s skip the first SKIP seconds
DIV <- 20        # Choose 1/DIV of the total points
ButterOder <- 3   # Order of the filter
CutFreq <- 1/100  # Cut-off frequncy (0-1) 1:Nyquist Frequency
N1 <- 10         # Replace NAN in 1 Channel with N1
N2 <- -10000     #
startT <- 0.04
endT <- 0.06 # interested interval in s

###################################################
#############Read Splitted Files####################
###################################################
DataTable <- read.table(file.choose(), skip=9)

#Table 2 Vector
T <- DataTable[,1]
Chan1 <- DataTable[,2]
Chan2 <- DataTable[,3]
Chan3 <- DataTable[,4]
Chan4 <- DataTable[,5]

#Optional: Saturation NAN Replacement
Chan1[is.nan(Chan1)] <- N1
Chan2[is.nan(Chan2)] <- N2

#Subset
sub1 <- Chan1[(SKIP*FS+1):(length(Chan1)/DIV)] 
sub2 <- Chan2[(SKIP*FS+1):(length(Chan1)/DIV)] 
sub3 <- Chan3[(SKIP*FS+1):(length(Chan1)/DIV)] 
sub4 <- Chan4[(SKIP*FS+1):(length(Chan1)/DIV)] 

#Filter
bf <- butter(ButterOder, CutFreq, type = "low")
z <- filter(bf, sub1)
plot(T[1:length(sub1)],z, type="l",xlim=c(startT,endT),xlab="Time(s)",ylab="Amplitude(V)",main="After Filtering")

# Row Data
dev.new()
plot(T[1:length(sub1)],sub1, type="l",xlim=c(startT,endT),xlab="Time(s)",ylab="Amplitude(V)",main="Real Time Waveform")

#averaging
loc <- which(sub4>1)

??







# FFT od the signal, maybe spectrum() is better
# fop1 <- fft(sub1,inverse = FALSE)
# fop1 <- abs(fop1)/length(sub1)
# F <- seq(from=0,to=100000/2,by=100000/length(sub1))
# dev.new()
# plot(F[1:(length(fop1)/2)],fop1[1:(length(fop1)/2)],type='l',xlim=c(0,1000))
# ac=acf(subop1,lag.max=100000)
# plot(T[1:length(ac$acf)],ac$acf,type='l',xlim=c(0.04,0.06))
