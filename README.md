# pathway_repurposing
Screen L1000 dataset for drug candidates with pathway.

## RNA-seq data processing 
After getting RNA-seq data, first quantify them with [Salmon](https://github.com/COMBINE-lab/salmon). You will need a FASTA file containing your reference transcripts and a (set of) FASTA/FASTQ file(s) containing your reads to run Salmon.

In R(DE_Deseq_AD.r),install"tximeta" and "DESeq2". Import the quantified data from Salmon and process them into differential expression profiles. See [guide](https://bioc.ism.ac.jp/packages/2.14/bioc/vignettes/DESeq2/inst/doc/beginner.pdf) to Deseq2 for more information.

Top differential expressed genes can then be used in next step for pathway analysis. 

## Pathway analysis
With the differential expressed genes we can do pathway analysis with [DAVID](https://david.ncifcrf.gov/). 

Also, DAVID provids useful online tools for [gene ID conversion](https://david.ncifcrf.gov/conversion.jsp).

## L1000 data
### Summary
The Library of Integrated Cellular Signatures ([LINCS](https://lincsproject.org/LINCS/)) is an NIH program which funds the generation of perturbational profiles across multiple cell and perturbation types, as well as read-outs, at a massive scale. We build a pipeline, in parallel with L1000 group, to process raw fluorescent intensity data into *z*-scores as perturbagen signatures, available at [L1000-bayesian](https://github.com/njpipeorgan/L1000-bayesian). Our Level 4 and Level 5 data are equivalent to Level 4 and Level 5 data provided by L1000. Pre-computed datasets covering a majority of LINCS L1000 Phase I and Phase II is available in [Zenodo](https://zenodo.org/record/5559183#.YWJS39rMKUk).

### Pathsig form L1000-Bayesian
The screening with Pathsig is cell line specific. 

## Drug screening with interested pathways
Note that any KEGG pathways you are interested in can be used as pathway feature for drug screening.

## Citation
123