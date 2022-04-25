library(enrichR)
library(KEGG.db)
setEnrichrSite("Enrichr") # Human genes
dbs <- c("KEGG_2021_Human") 


#testgenelist<-c("Runx1", "Gfi1", "Gfi1b", "Spi1", "Gata1", "Kdr")

#dir="/path/to/gene_lists/"

up_gene_list<-read.csv(paste0(dir,"up_genes.csv"),header=FALSE,stringsAsFactors = FALSE)
down_gene_list<-read.csv(paste0(dir,"down_genes.csv"),header=FALSE,stringsAsFactors = FALSE)

up_enriched <- enrichr(up_gene_list$V1, dbs)
down_enriched <- enrichr(down_gene_list$V1, dbs)

up_KEGG_enriched_path<-up_enriched[["KEGG_2021_Human"]]
down_KEGG_enriched_path<-down_enriched[["KEGG_2021_Human"]]

p_cutoff<-0.05
up_KEGG_enriched_path<-up_KEGG_enriched_path[up_KEGG_enriched_path$Adjusted.P.value < p_cutoff,]
down_KEGG_enriched_path<-down_KEGG_enriched_path[down_KEGG_enriched_path$Adjusted.P.value < p_cutoff,]

write.csv(up_KEGG_enriched_path,file=paste0(dir,"up_KEGG_enriched_DIR.csv"))
write.csv(down_KEGG_enriched_path,file=paste0(dir,"down_KEGG_enriched_DIR.csv"))



name2ID <- as.list(KEGGPATHNAME2ID)
up_pathways<-up_KEGG_enriched_path[,1]
down_pathways<-down_KEGG_enriched_path[,1]

up_hsaid=c()
for(path in up_pathways){
  id=name2ID[[path]]
  if (!is.null(id)) {
    up_hsaid<-c(up_hsaid,paste0("hsa",id))
  }
}

down_hsaid=c()
for(path in down_pathways){
  id=name2ID[[path]]
  if (!is.null(id)) {
    down_hsaid<-c(down_hsaid,paste0("hsa",id))
  }
}

write.csv(up_hsaid,file=paste0(dir,"KEGG_up_hsaid.csv"))
write.csv(down_hsaid,file=paste0(dir,"KEGG_down_hsaid.csv"))
          










  