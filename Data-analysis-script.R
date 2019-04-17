# R script to analyse data from nerve recording experiments
# Code by Leonardo Silvestri and Yuan Wei 

# Packages
#library(ggplot2)
#library(signal)

# Input variables
dataDir <- "2019_04_12_Rabbit_experiment_5"
dataFilename <- "Optical.txt"

# Read data from file (assumes a certain format)
inputFile<- paste(dataDir,"/",dataFilename,sep="")
infoString <- read.table(inputFile,skip=0, nrows = 9, sep="=", header=FALSE, stringsAsFactors = FALSE) # Read first 9 lines
dataTime <- strptime(strsplit(infoString[[2]][[2]],"\t")[[1]][[3]],format="%d/%m/%Y %H:%M:%S") # Reads time data was collected
channelNames <- tail(strsplit(infoString$V2[[5]],"\t")[[1]],-1) 
dataTable <- read.table(inputFile,skip=9, sep="\t", header=FALSE)
timeData <- dataTable$V1
optrodeData <- dataTable$V2
electrodeData <- dataTable$V3
tempData <- dataTable$V4
channel4Data <- dataTable$V5
plot(timeData,optrodeData,type="l",xlim=c(0.045,0.055))
lines(timeData,-electrodeData/1000,col="red")
