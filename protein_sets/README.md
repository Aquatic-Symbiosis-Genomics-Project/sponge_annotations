# protein sets
## braker_porifera.fa.xz
From a first round of running BRAKER on the collected ASG porifera genomes. For use with braker/galba they were reheadered to braker3_(increasing number)

## porifera_uniprot_30_01_2024.fa.xz
All porifera proteins of UniProt as of 30th of January 2024

## Aphrocallistes_vastus.prot.fr.fasta.xz
From ["The genome of the reef-building glass sponge Aphrocallistes vastus provides insights into silica biomineralization"
Warren R. Francis†, Michael Eitel†, Sergio Vargas, Catalina A. Garcia-Escudero, Nicola Conci, Fabian Deister, Jasmine L. Mah, Nadège Guiglielmoni, Stefan Krebs, Helmut Blum, Sally P. Leys and Gert Wörheide](https://royalsocietypublishing.org/doi/10.1098/rsos.230423)

## O_lobularis_transdecoder.fa.xz
From ["Evolution of mechanisms controlling epithelial morphogenesis across animals: new insights from dissociation-reaggregation experiments in the sponge Oscarella lobularis" Amélie Vernale, Maria Mandela Prünster, Fabio Marchianò, Henry Debost, Nicolas Brouilly, Caroline Rocher, Dominique Massey-Harroche, Emmanuelle Renard, André Le Bivic, Bianca H. Habermann & Carole Borchiellin](https://bmcecolevol.biomedcentral.com/articles/10.1186/s12862-021-01866-x)

## filter_fasta.rb
small script to 
* clean up the headers
* skip entries with duiplicate IDs
* skip proteins with in-frame stops
* remove trailing stops
