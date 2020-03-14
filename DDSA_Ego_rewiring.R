library(igraph)

mastodon_data <- read.csv("C:/Users/JORGE/Documents/MIIS_UPF/Data-Driven Social Analysis/Mini-project/mastodon_growth_from_1_16_to_3_16_anonim.csv",header=FALSE)

#Directed graph
mastodon_digraph <- graph.data.frame(mastodon_data,directed=TRUE)

#Undirected
mastodon_ungraph <- graph.data.frame(mastodon_data,directed=FALSE)

#Find the node with highest degree
V(mastodon_digraph)$name[degree(mastodon_digraph)==max(degree(mastodon_digraph))]

#Calculate the Assorsativity  https://igraph.org/r/doc/assortativity.html
assortativity_degree(mastodon_digraph,directed=TRUE)

#direct neighbors
neighbors(mastodon_digraph, v=which(V(mastodon_digraph)$name=="73@pawoo.net"))

#n-neighbors away
ego(mastodon_digraph, order=2, nodes=which(V(mastodon_digraph)$name=="73@pawoo.net"))


# mean distance of the original graph
mean_distance(mastodon_digraph)

#node rewiring 0.05
mastodon_digraph_rewired <- rewire(mastodon_digraph, each_edge(prob = 0.05))
mean_distance(mastodon_digraph_rewired)

#Assortativity after rewiring 0.05
assortativity_degree(mastodon_digraph_rewired,directed=TRUE)

#node rewiring 0.5
mastodon_digraph_rewired_2 <- rewire(mastodon_digraph, each_edge(prob = 0.5))

#Assortativity after rewiring 0.5
assortativity_degree(mastodon_digraph_rewired_2,directed=TRUE)
mean_distance(mastodon_digraph_rewired_2)

