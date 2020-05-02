library(cooccur)

beads <- rep(c("red","blue"), times = c(2,3)) #create an urn with 2 reds, 3 blues
beads #view beads object
sample(beads,1) #sample 1 bead at random

B <- 15000  #number of times to draw 1 bead
events <- replicate(B, sample(beads,1))   #draw 1 bead for B times
tab <- table(events)  #make a table of outcome counts
tab
prop.table(tab)   #view table of outcome proportions

