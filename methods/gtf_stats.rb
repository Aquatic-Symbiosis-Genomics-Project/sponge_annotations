#!/bin/env ruby
# gtf_stats.rb <GTF>

transcripts = 0
genes       = 0
exons       = 0

ARGF.each_line{|line|
  columns = line.split
  case columns[2]
  when "gene"
    genes += 1
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
