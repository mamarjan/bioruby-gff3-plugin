# find local plugin installation, and use it when there
rootpath = File.dirname(File.dirname(__FILE__))
bio_logger_path = File.join(rootpath,'..','bioruby-logger','lib')
if File.directory? bio_logger_path
  $: << bio_logger_path
	$stderr.print "bio-logger loaded directly\n"
else
  require "rubygems"
  gem "bio-logger"
end
require 'bio-logger'

Bio::Log::LoggerPlus.new('bio-gff3')

require 'bio'
require 'bio/output/gfflogger'
require 'bio/db/gff/gffvalidate'
require 'bio/db/gff/gffsection'
require 'bio/db/gff/gffcomponent'
require 'bio/db/gff/gffsequence'
require 'bio/db/gff/gffrecord'
require 'bio/db/gff/gff3parserec'
require 'bio/db/gff/gff3parsefile'
require 'bio/db/gff/gff3fasta'
require 'bio/db/gff/file/gfffileiterator'
require 'bio/db/gff/file/gfffasta'
require 'bio/db/gff/digest/gffparser'
require 'bio/db/gff/gff3'

