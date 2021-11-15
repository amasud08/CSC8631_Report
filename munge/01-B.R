library("ProjectTemplate")

getwd()
# I was having problems with setting my working directory so I played around with it in the command terminal 
# Eventually managed to set it through getwd() and then copying and pasting that to...

setwd("C:/Users/C1032379-localadmin/OneDrive - Newcastle University/5_CSC8631_Data_Management/Assignment")
create.project("FL_Rproject")
# setwd("FL_Project/reports")  # making errors in spelling and document name
getwd()                      # double checking where I am and then realising my mistake
setwd("FL_Rproject/reports")

tinytex::install_tinytex()

setwd("..")
load.project()
















