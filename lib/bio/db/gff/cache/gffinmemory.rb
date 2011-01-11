#
# = bio/db/gff/gffinmemory.rb - Assemble mRNA and CDS from GFF in RAM
#
# Copyright::  Copyright (C) 2010
#              Pjotr Prins <pjotr.prins@thebird.nl>
# License::    The Ruby License
#
# Fetch information from a GFF file

module Bio
  module GFFbrowser

    module Digest

      class InMemory
        include Parser
        include Gff3Sequence
        attr_reader :sequencelist

        def initialize filename, options
          @options = options
          # Invoke the BioRuby in memory parser
          @gff = Bio::GFF::GFF3.new(File.read(filename))
        end

        # Digest mRNA from the GFFdb and store in Hash
        # Next yield(id, seq) from Hash
        def parse 
          info "---- Digest DB and store data in mRNA Hash"
          @count_ids          = Counter.new   # Count ids
          @count_seqnames     = Counter.new   # Count seqnames
          @componentlist      = {} # Store containers, like genes, contigs
          @orflist            = LinkedRecs.new
          @mrnalist           = LinkedRecs.new   # Store linked mRNA records
          @cdslist            = LinkedRecs.new
          @exonlist           = LinkedRecs.new
          @sequencelist       = {}
          @unrecognized_features = {}
          @gff.records.each do | rec |
            store_record(rec)
          end
          @gff.sequences.each do | bioseq |
            id = bioseq.entry_id
            @sequencelist[id] = bioseq.to_s # in Bio::Sequence with contained Bio::FastaFormat
          end
          validate_mrnas
          validate_cdss 
          show_unrecognized_features 
          @genelist      = @count_ids.keys 
          read_fasta
        end

        def each_item list
          list.each do | id, recs |
            seqid = recs[0].seqname
            component = find_component(recs[0])
            yield id, recs, component
          end
        end
        
      end
    end
  end
end