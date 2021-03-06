# = bio/db/gff/gfffasta.rb - Fetch records from a file in FASTA format
#
# Copyright::  Copyright (C) 2010
#              Pjotr Prins <pjotr.prins@thebird.nl>
# License::    The Ruby License
#
# This requires a special implementation as it uses an open file and we 
# retain file seek positions.

module Bio

  class GFF

    # Read FASTA records from file and store seek positions, which are
    # used to retrieve the records. Note, this implementation merely retains
    # records in memory (FIXME)
    class FastaReader
      def initialize fh, io_seek=nil
        @fh = fh
        @h = {}
        parse
      end

      def parse
        # read FASTA records
        header = nil
        seqs   = []
        @fh.each_line do | line |
          line = line.strip
          next if line =~ /^#/
          if line =~ /^>/  # FASTA record header
            add(header,seqs)
            header = line
            seqs   = []
          else
            seqs << line.gsub(/\s+/,'')
          end
        end
        add(header,seqs)
      end

      def [] index
        @h[index]
      end

      def each 
        @h.each do | k,v |
          yield k, v
        end
      end

    private
       def add header, seqs
         if header
           id, fastarec = fasta_rec(header, seqs)
           @h[id] = fastarec.data.strip
         end
       end

      def fasta_rec header, buf
        fst = Bio::FastaFormat.new(header+"\n"+buf.join(''))
        return fst.definition, fst
      end

    end

  end # GFF
end # Bio
