#!/usr/bin/env ruby
require 'bio'

ids = []
Bio::FlatFile.auto(ARGF) do |ff|
  ff.each do |entry|
    id = entry.definition.split()[0].split('|')[-1]
    if /\*\w/.match(entry.seq)
      STDERR.puts "skipping #{entry.entry_id} for in-frame stops"
    elsif ids.include?(id)
      STDERR.puts "skipping #{entry.entry_id} as duplicate id"
    else
      puts entry.seq.gsub('*','').to_fasta(id)
      ids << id
    end
  end
end
