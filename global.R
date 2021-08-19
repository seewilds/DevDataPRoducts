library(shiny)
library(dplyr)
library(ggplot2)
library(reshape2)

#setwd("~/REE Projects/shiny")


ree_aggregates <- read.csv("ree_aggregates.csv", encoding = "UTF-8")
ree_aggregates$Project<- as.character(ree_aggregates$Project)
ree_aggregates$Owner.s.<- as.character(ree_aggregates$Owner.s.)
ree_aggregates$Confidence<- as.character(ree_aggregates$Confidence)
ree_aggregates$variable<- as.character(ree_aggregates$variable)

ree_aggregates$Project <- iconv(enc2utf8(ree_aggregates$Project), sub = 'byte')
ree_aggregates$Project<- gsub("<e1>", "a", ree_aggregates$Project)
ree_aggregates$Project<- gsub("<e4>", "a", ree_aggregates$Project)
ree_aggregates$Owner.s. <- iconv(enc2utf8(ree_aggregates$Owner.s.), sub = 'byte')
ree_aggregates$Confidence <- iconv(enc2utf8(ree_aggregates$Confidence), sub = 'byte')
ree_aggregates$variable <- iconv(enc2utf8(ree_aggregates$variable), sub = 'byte')
ree_aggregates <- ree_aggregates%>%select(-X)


ree_elements <- read.csv("ree_elements.csv", encoding = "UTF-8")
ree_elements$Project<- as.character(ree_elements$Project)
ree_elements$Owner.s.<- as.character(ree_elements$Owner.s.)
ree_elements$Confidence<- as.character(ree_elements$Confidence)
ree_elements$variable<- as.character(ree_elements$variable)

ree_elements$Project<- iconv(enc2utf8(ree_elements$Project), sub = 'byte')
ree_elements$Project<- gsub("<e1>", "a", ree_elements$Project)
ree_elements$Project<- gsub("<e4>", "a", ree_elements$Project)
ree_elements$Owner.s.<- iconv(enc2utf8(ree_elements$Owner.s.), sub = 'byte')
ree_elements$Confidence<- iconv(enc2utf8(ree_elements$Confidence), sub = 'byte')
ree_elements$variable<- iconv(enc2utf8(ree_elements$variable), sub = 'byte')
ree_elements <- ree_elements%>%select(-X)%>%filter(variable!="Tonnes")

element_uses <- read.csv("element_uses.csv", encoding = "UTF-8")
element_uses$Selected.applications <- as.character(element_uses$Selected.applications)
element_uses$Selected.applications <- iconv(enc2utf8(element_uses$Selected.applications), sub="byte")
element_uses$Selected.applications <- gsub("<a0>", " ", element_uses$Selected.applications)

#element_uses <- enc2native(element_uses)

aggregate_metrics <- read.csv("aggregate_metrics.csv", encoding = "UTF-8")
#aggregate_metrics <- enc2native(aggregate_metrics)