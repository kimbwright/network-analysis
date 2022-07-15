

library(readr)
library(tidygraph)
library(ggraph)
library(dplyr)

teacher_nodes <- read.csv("lab-1/data/dlt1-nodes.csv")
teacher_edges <- read.csv("lab-1/data/dlt1-edges.csv")

teacher_network <- tbl_graph(edges = teacher_edges,
                             nodes = teacher_nodes, 
                             directed = TRUE)

plot(teacher_network)

autograph(teacher_network)

autograph(teacher_network,
          node_label = UID,
          node_colour = role1)

teacher_network %>%
  activate(nodes) %>%
  filter(grades == "middle") %>%
ggraph(layout = "fr") + 
  geom_edge_link(arrow = arrow(length = unit(1, 'mm')), 
                 end_cap = circle(1, 'mm'),
                 start_cap = circle(1, 'mm'),
                 alpha = .1) +
  geom_node_point(aes(size = local_size(),
                      color = experience2)) +
  geom_node_text(aes(label = UID),
                 repel=TRUE) +
  theme_graph()
