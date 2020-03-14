library(igraph)

mastodon_data <- read.csv("C:/Users/JORGE/Documents/MIIS_UPF/Data-Driven Social Analysis/Mini-project/mastodon_growth_from_1_16_to_3_16_anonim.csv",header=FALSE)

#Directed graph
mastodon_digraph <- graph.data.frame(mastodon_data,directed=TRUE)

#Assortativity of the graph
assortativity_degree(mastodon_digraph,directed=TRUE)

# mean distance of the Graph
mean_distance(mastodon_digraph)

#-------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------#

#node rewiring 0.05
mastodon_digraph_rewired <- rewire(mastodon_digraph, each_edge(prob = 0.05))

#mean distance after rewiring 0.05
mean_distance(mastodon_digraph_rewired)

#Assortativity after rewiring 0.05
assortativity_degree(mastodon_digraph_rewired,directed=TRUE)

#node rewiring 0.5
mastodon_digraph_rewired_2 <- rewire(mastodon_digraph, each_edge(prob = 0.5))

#Assortativity after rewiring 0.5
assortativity_degree(mastodon_digraph_rewired_2,directed=TRUE)

#mean distance after rewiring 0.5
mean_distance(mastodon_digraph_rewired_2)

