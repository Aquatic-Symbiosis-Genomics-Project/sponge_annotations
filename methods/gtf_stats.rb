#!/bin/env ruby
# ruby gtf_stats.rb <GTF>
# zcat <GTF.gz> | ruby gtf_stats.rb

require 'yaml'

transcripts = 0
genes       = 0
exons       = 0
gene_biotypes = Hash.new(0)
total_gene_length = 0
total_exon_length = 0

ARGF.each_line{|line|
  columns = line.split

  case columns[2]
  when "gene"
    genes += 1
    gene_biotypes["#{$1}"] +=1 if /gene_biotype\s+"(\w+)"/.match(line)
    total_gene_length+=(columns[4].to_i-columns[3].to_i+1)
  when "transcript"
    transcripts += 1
  when "exon"
    exons += 1
    total_exon_length+=(columns[4].to_i-columns[3].to_i+1)
  end
}

stats=Hash.new
stats["genes"] = genes
stats["average_gene_length"] = total_gene_length / genes
stats["transcripts_per_gene"] = transcripts.to_f / genes
stats["average_transcript_length"] = total_exon_length / transcripts 
stats["exons_per_transcript"] = exons.to_f / transcripts
stats["average_exon_length"] = total_exon_length / exons

puts stats.to_yaml

# gene_biotypes.each{|k,v|
#     puts "#{k} => #{v}"
# }
