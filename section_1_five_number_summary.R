library(statnet)
library(UserNetR)
library(ggplot2)
data(Moreno)


gender <- Moreno %v% "gender"
plot(Moreno, vertex.col = gender, vertex.cex = 1)

network.size(Moreno)

summary(Moreno)

components(Moreno)

# diameter
lgc <- component.largest(Moreno, result = "graph")
gd <- geodist(lgc)
max(gd$gdist)

# transitivity
gtrans(Moreno, mode = "graph")


# creating a network objectin statnet
netmat1 <- rbind(c(0,1,1,0,0),
                 c(0,0,1,1,0),
                 c(0,1,0,0,0),
                 c(0,0,0,0,0),
                 c(0,0,1,0,0))
rownames(netmat1) <- LETTERS[1:5]
colnames(netmat1) <- LETTERS[1:5]
net1 <- network(netmat1, matrix.type = "adjacency")
class(net1)

gplot(net1, vertex.col = 2, displaylabels = TRUE)

netmat2 <- rbind(c(1,2),
                 c(1,3),
                 c(2,3),
                 c(2,4),
                 c(3,2),
                 c(5,3))
net2 <- network(netmat2,matrix.type="edgelist")
network.vertex.names(net2) <- c("A","B","C","D","E")
summary(net2)

as.sociomatrix(net1)
