# RSpec for BioRuby-GFF3-Plugin. Run with something like:
#
#   rspec -I ../bioruby/lib/ spec/gffdb_spec.rb 
#
# Copyright (C) 2010 Pjotr Prins <pjotr.prins@thebird.nl>
#
$: << "../lib"


require 'bio-gff3'

include Bio::GFFbrowser

describe FastLineParser, "GFF3 Fast line parser" do
  include Bio::GFFbrowser::FastLineParser

  it "should parse attributes" do 
    parse_attributes_fast("id=1").should == { "id"=>"1" }
    parse_attributes_fast("id=1;parent=45").should == { "id"=>"1", "parent" => "45" }
  end
  it "should parse escaped attributes" do 
    parse_attributes_fast("id%3D1=1").should == { "id%3D1"=>"1" }
    parse_attributes_fast("id=1%3Bparent=45").should == { "id"=>"1%3Bparent=45" }
  end
  it "should parse records" do 
    parse_line_fast("ctg123\t.\tCDS\t1201\t1500\t.\t+\t0\tID=cds00001;Parent=mRNA00001;Name=edenprotein.1").should == ["ctg123", ".", "CDS", "1201", "1500", ".", "+", "0", "ID=cds00001;Parent=mRNA00001;Name=edenprotein.1"]
  end
  it "should handle a Record interface" do
    fields = 
    parse_line_fast("ctg123\t.\tCDS\t1201\t1500\t.\t+\t0\tID=cds00001;Parent=mRNA00001;Name=edenprotein.1")
    rec = Bio::GFFbrowser::FastLineRecord.new(fields)
    rec.seqname.should == "ctg123"
    rec.id.should == "cds00001"
    rec.phase.should == 0
    rec.start.should == 1201
    rec.end.should == 1500
    rec.score.should == 0.0
    rec.strand.should == '+'
    rec.feature.should == 'CDS'
    rec.source.should == '.'
  end
end


