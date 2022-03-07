npc_data=read.csv(".\Bayesian_npcGPdata_gene.csv",stringsAsFactors=F)
l1k_genes= read.csv(".\l1k_genes.csv",header=F,stringsAsFactors=F)

npc_genes=intersect(npc_data$gene,l1k_genes$V1)
npc_data=subset(npc_data,gene %in% npc_genes)
rownames(npc_data) <- make.names(npc_data$gene, unique = TRUE)
npc_data=subset(npc_data, select=-c(1))


pathwayList<- unique(AllEdges$Pathway)
NPC_PAS <- data.frame(matrix(ncol = length(pathwayList), nrow = length(l1k_genes$V1)))
rownames(NPC_PAS)<-l1k_genes$V1
colnames(NPC_PAS)<-pathwayList

for (path in pathwayList){
  Edge <- AllEdges[AllEdges$Pathway==path,]
  Score <- CalcPathSig(EdgeFrom=Edge[,"GeneSymbol_a"],EdgeTo=Edge[,"GeneSymbol_b"],interaction=Edge[,"Interaction"],data=npc_data,neigen=1)
  topgenes <-sub("\\..*", "", Score$Gene)
  sig <- rep(NA, times=length(l1k_genes))
  names(sig) = l1k_genes
  for (gene in unique(topgenes)){
    g_sig<-mean(Score[which(topgenes==gene),"Signature"])
    NPC_PAS[gene,path]<-g_sig
  }
}

write.csv(NPC_PAS,".\Bayesian_npc_PAS.csv")