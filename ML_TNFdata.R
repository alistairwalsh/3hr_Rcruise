# Data from Man Lyang: TNF ELISA results ----------------------------------

# Extra Info from ML
# Standard Curve: Top = 2000 pg/ml --> serial 2-fold dilutions
# Triplicate Wells of Samples, Samples were diluted 3-fold

# Current Workflow:
# Copy and Paste Raw Data into Prism to generate Standard Curve
# Manually estimate the Concentration of TNF in each Sample based on the OD readings vs Concentration (Prism Graph)
# Enter estimated concentrations into Excel 
# Multiple estimated concentrations x3 to give the Absolute Concentrations of TNF in each well
# Copy and Paste Results into Prism
# Perform Statistical Analysis in Prism and Plot Results

# time consuming and many chances of accidental errors (although ML is meticulously careful so not too worried about this for him!)

# Now Let's Try R!

# Store Raw Data 
TNF_rawdata <- read.csv(file="/Users/keeble.j/Desktop/MK20151030_TNF.csv", header = FALSE)
TNF_rawdata

# Select Cells of Interest (samples and std curve OD readings)
TNF_OD <- TNF_rawdata[c(2:4,8),2:10]
rownames(TNF_OD) <- c("replicate_1","replicate_2","replicate_3","std")
TNF_OD

# Generate Standard Curve
### this could be improved - how to define a sequence that has serial 2-fold dilution?
TNF_conc <- c(2000,1000,500,250,125,62.5,31.25,15.625,7.8125)

# Need to make them numeric!!
TNF_stdcurve <- data.frame(logTNF_conc, t(TNF_OD[4,])

plot(log2(TNF_conc),t(TNF_OD[4,]), ylab= "OD Reading", xlim=c(2,15), ylim =c(0,1), main = "TNF Standard Curve")
cor(log2(TNF_conc),t(TNF_OD[4,]))
help(plot)

# Create Dataframe holding Sample_ID, Sample_OD, Est_log2(TNF_conc), Est_TNF, Absolute_TNF i.e. 27 rows x 5 columns
TNF_rawdata

Sample_OD <- c(TNF_rawdata[2:4,2],TNF_rawdata[2:4,3],TNF_rawdata[2:4,4],TNF_rawdata[2:4,5])

TNF_Results <- data.frame("Sample_ID" = TNF_rawdata[10:36,2], "Sample_OD" = (TNF_rawdata[c(2:4),2],TNF_rawdata[c(2:4),3],TNF_rawdata[c(2:4),3],TNF_rawdata[c(2:4),4],TNF_rawdata[c(2:4),5],TNF_rawdata[c(2:4),6]TNF_rawdata[c(2:4),7],TNF_rawdata[c(2:4),8],TNF_rawdata[c(2:4),9],TNF_rawdata[c(2:4),10]), "Est_log2(TNF_conc)","Est_TNF","Absolute_TNF")
TNF_Results
