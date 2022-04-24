library(enrichR)
library(KEGG.db)
setEnrichrSite("Enrichr") # Human genes
dbs <- c("KEGG_2021_Human") 

#gene_list<-read.csv("/path/to/DE_genes.cvs")
#testgenelist<-c("Runx1", "Gfi1", "Gfi1b", "Spi1", "Gata1", "Kdr")



up_gene_list<-read.csv(paste0(dir,"DIR_up_genes.csv"),header=FALSE,stringsAsFactors = FALSE)
down_gene_list<-read.csv(paste0(dir,"DIR_down_genes.csv"),header=FALSE,stringsAsFactors = FALSE)

up_enriched <- enrichr(up_gene_list$V1, dbs)
down_enriched <- enrichr(down_gene_list$V1, dbs)

up_KEGG_enriched_path<-up_enriched[["KEGG_2021_Human"]]
down_KEGG_enriched_path<-down_enriched[["KEGG_2021_Human"]]

up_KEGG_enriched_path<-up_KEGG_enriched_path[up_KEGG_enriched_path$Adjusted.P.value < 0.05,]
down_KEGG_enriched_path<-down_KEGG_enriched_path[down_KEGG_enriched_path$Adjusted.P.value < 0.05,]

write.csv(up_KEGG_enriched_path,file=paste0(dir,"up_KEGG_enriched_DIR.csv"))
write.csv(down_KEGG_enriched_path,file=paste0(dir,"down_KEGG_enriched_DIR.csv"))
#view(enriched[["KEGG_2021_Human"]])


p_cutoff<-0.05
pathways<-KEGG_enriched_path[KEGG_enriched_path$Adjusted.P.value < p_cutoff,1]
name2ID <- as.list(KEGGPATHNAME2ID)
hsaid=c()
for(path in pathways){
  id=name2ID[[path]]
  if (!is.null(id)) {
    hsaid<-c(hsaid,paste0("hsa",id))
  }
}

write.csv(hsaid,file=paste0(dir,"KEGG_hsaid_DIR.csv"))
          










  