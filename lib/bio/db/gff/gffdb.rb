#
# = bio/db/gff/gffdb.rb - GFF database class
#
# Copyright::  Copyright (C) 2010
#              Pjotr Prins <pjotr.prins@thebird.nl>
# License::    The Ruby License

# Create db from a GFF file

require 'bio'
require 'bio/db/gff/gffassemble'

module Bio
  class GFF
    class GFFdb
      include MRNA
      # include CDS

      def initialize
        @gffs = []
      end

      # Add a GFF tree
      def add gfftree
        @gffs.push gfftree
      end

    end # GFFdb
  end # GFF
end # Bio

