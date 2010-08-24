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
  module GFFbrowser
    class GFFdb
      include MRNA
      # include CDS

      def initialize gff
        @gff = gff
      end

    end # GFFdb
  end # GFFbrowser
end # Bio
