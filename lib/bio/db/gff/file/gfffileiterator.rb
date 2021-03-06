#
# = bio/db/gff/gfffileiterator.rb - Fetch records from a GFF3 file
#
# Copyright::  Copyright (C) 2010
#              Pjotr Prins <pjotr.prins@thebird.nl>
# License::    The Ruby License

module Bio

  class GFF

    class GFF3

      # FileRecord inherits from the BioRuby Record, but
      # adds the file seek position.
      class BioRubyFileRecord < Record
        attr_accessor :io_seek
        def initialize io_seek, buf
          @io_seek = io_seek
          super(buf)
        end
      end

      class FastParserFileRecord < GFFbrowser::FastLineRecord
        attr_accessor :io_seek

        include Bio::GFFbrowser::FastLineParser 
        def initialize io_seek, buf
          @io_seek = io_seek
          super(parse_line_fast(buf))
        end
      end

      # GFF3::FileIterator takes a file and yields GFF3 records with their
      # seek position included in the record.
      class FileIterator
        attr_accessor :fh
        attr_reader :fasta_io_seek

        def initialize filename
          @fh = File.open(filename)
        end

        # Iterate over every record in the file, yielding the seekpos
        # and line containing the record
        def each_rec
          @fh.seek(0)
          fpos = 0
          @fh.each_line do | line |
            line = line.strip
            if line == "##FASTA"
              @fasta_io_seek = fpos
              break
            end
            if line.size != 0 and line !~ /^#/
              lastpos = @fh.tell
              yield fpos, line
              @fh.seek(lastpos) # reset filepos, just in case it changed
            end
            fpos = @fh.tell
          end
        end

        # Iterate over all contained FASTA sequences, yielding the ID
        # and sequence as a FASTA record. Normally call each_rec first and 
        # you can test for existing FASTA records if fasta_io_seek != nil
        def each_sequence
          if @fasta_io_seek == nil
            # Find the FASTA location first
            @fh.each_line do | line |
              break if line.strip == "##FASTA"
            end
          else
            @fh.seek(@fasta_io_seek)
          end
          fasta = Bio::GFF::FastaReader.new(@fh)
          fasta.each do | id, fastarec |
            yield id, fastarec
          end
        end
      end
    end # GFF3
  end # GFF
end # Bio

    


