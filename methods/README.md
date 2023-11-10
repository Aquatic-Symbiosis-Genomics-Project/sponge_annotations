# Methods
Using singularity images if possible.
Generally moving the working directory onto a fast storage system and copying the results back is advisable.

# Repeats
Using: [TETools](https://github.com/Dfam-consortium/TETools)

## where
* the current directory is the working directory (where the input fasta needs to reside)
* $SPECIES is the species id (ToLID)
* $THREADS is the number of threads
* $IMG is the singularity image converted from docker

```
singularity exec --bind `pwd`:$HOME $IMG BuildDatabase -name $SPECIES $INFILE
singularity exec --bind `pwd`:$HOME $IMG RepeatModeler -database $SPECIES -LTRStruct -threads $THREADS
singularity exec --bind `pwd`:$HOME $IMG RepeatMasker -lib ${SPECIES}-families.fa $INFILE -xsmall -pa $THREADS
```

# RNASeq
Using: [VARUS](https://github.com/Gaius-Augustus/VARUS)

Installed locally, as there is no Docker image yet.

## where
* VARUSparameters.txt contains the config
* species.txt contains the species of choice (latin_name; fasta_name)

`runVARUS.pl --aligner=HISAT --readFromTable=1 --createindex=1`

# Gene Predictions
Using: [BRAKER3](https://hub.docker.com/r/teambraker/braker3) / [GALBA](https://github.com/Gaius-Augustus/GALBA)

## where
* $DB is a protein FASTA to train
* $THREADS is the number of threads
* $SPECIES is the species id (ToLID)
* $FASTA is the softmasked genome
* working directory is current dir (all input files should be there, but you can mount additional dirs as needed)
* $BRAKER/$GALBA is the braker/galba .sif
* $BAM is the varus.bam

## BRAKER3
currently set to use 22 cores / 48G RAM for sponges
```
singularity exec --bind `pwd`:$HOME $BRAKER braker.pl --genome=$FASTA --prot_seq=$DB --threads=$THREADS --bam=$BAM --workingdir=BRAKER3 --species=$SPECIES
```
## GALBA
currently set to use 8 cores / 20G RAM for sponges
```
singularity exec --bind `pwd`:$HOME $GALBA galba.pl --species=$SPECIES --genome $FASTA --prot $DB --threads $THREADS
```
