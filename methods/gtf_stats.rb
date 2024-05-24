#!/bin/env ruby
# gtf_stats.rb <GTF>
# zcat <GTF.gz> | ruby gtf_stats.rb

transcripts = 0
genes       = 0
exons       = 0
gene_biotypes = Hash.new(0)

ARGF.each_line{|line|
  columns = line.split

  case columns[2]
  when "gene"
    genes += 1
    gene_biotypes["#{$1}"] +=1 if /gene_biotype\s+"(\w+)"/.match(line)
  when "transcript"
    transcripts += 1
  when "exon"
    exons += 1
  end
}

puts <<-HERE
genes: #{genes}
transcripts: #{transcripts}
transcripts / gene: #{transcripts.to_f/genes}
exons / transcript: #{exons.to_f/transcripts}

HERE

gene_biotypes.each{|k,v|
    puts "#{k} => #{v}"
}
