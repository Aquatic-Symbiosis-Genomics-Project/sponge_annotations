# sponge_annotations
collected annotations of the ASG porifera

currently created using [TE Tools](https://github.com/Dfam-consortium/TETools) => [VARUS](https://github.com/Gaius-Augustus/VARUS) => [BRAKER3](https://github.com/Gaius-Augustus/BRAKER) / [GALBA](https://github.com/Gaius-Augustus/GALBA) => [OMArk](https://github.com/DessimozLab/OMArk) => [MakeHub](https://github.com/Gaius-Augustus/MakeHub)

# folder structure
## results/
### tolID/
* protein fasta file (braker.aa or galba.aa)
* GTF file (braker.gtf or galba.tpf)
* description of additional files of interest (RNASeq libraries / genome sequences / repeat libraries)
## protein_sets/
* description of the origin of the sequences used to train BRAKER3/GALBA
## methods/
* process used to create the annotations
