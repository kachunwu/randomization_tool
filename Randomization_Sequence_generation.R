library(blockrand)

# By providing the size of each stratum, the package create a randomization sequence for that stratum.

###################
# Assuming we want to balance two variables, each of these variable has two levels.
# We will have 2x2 strata. Let's assume we want to have a maximum of 20 participants in each strata.
#       1       2
# A   n = 20  n = 20
# B   n = 20  n = 20
####################

# Randomization sequence of A1
PrFe <- blockrand(n = 16,
                  num.levels = 2,
                  levels = c("Exp","Con"),
                  stratum = "A1",
                  id.prefix = "A1",
                  block.sizes = c(1, 2, 3),
                  block.prefix = "A1")

# Randomization sequence of A2
PuFe <- blockrand(n = 25,
                  num.levels = 2,
                  levels = c("Exp","Con"),
                  stratum = "A2",
                  id.prefix = "A2",
                  block.sizes = c(1, 2, 3),
                  block.prefix = "A2")

# Randomization sequence of B1
PuTr <- blockrand(n = 11,
                  num.levels = 2,
                  levels = c("Exp","Con"),
                  stratum = "B1",
                  id.prefix = "B1",
                  block.sizes = c(1, 2, 3),
                  block.prefix = "B1")

# Randomization sequence of B2
UnFe <- blockrand(n = 1,
                  num.levels = 2,
                  levels = c("Exp","Con"),
                  stratum = "B2",
                  id.prefix = "B2",
                  block.sizes = c(1, 2, 3),
                  block.prefix = "B2")

# Combine them into a list and export it as a .csv file
List <- rbind(PrFe,PuFe,PuTr,UnFe)
write.csv(List, "rand_seq.csv", row.names=TRUE)
