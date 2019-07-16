
#Relevant files are currently in downloads folder
setwd("/Users/nikaz/Downloads")

#Read in spreadsheet without changing column names
hil = read.csv(file="HIL-Pos_csf_metabolite.csv", header=T, as.is=T, check.names = F)

#Read in spreadsheet with key
library(readxl)
csf = read_excel("CSF project_amino acids_Utrecht.xlsx")
csf = as.data.frame(csf)

#Extract columns with key
key = csf[,c(1,2)]

#Clean up key column names
key = key[-1,]
names(key) = c("CSF", "Plasma")

#Read in ID text file
ids = read.table(file="ids.txt", as.is=T)

#Convert ids into a vector
id_vector = ids[[1]]

#Trim leading zeroes
id_vector[grep("^0", id_vector)] = substring(id_vector[grep("^0", id_vector)],2)

trimmed_hil = hil[,id_vector]

#Extract relevant ids from key
subset(key, key$Plasma %in% id_vector)

##Found no matches between column names and provided ids:
match(id_vector, names(hil))