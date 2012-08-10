# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "bio-gff3"
  s.version = "0.8.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pjotr Prins"]
  s.date = "2012-08-10"
  s.description = "GFF3 (genome browser) information and digest mRNA and CDS sequences.\nOptions for low memory use and caching of records.\nSupport for external FASTA files.\n"
  s.email = "pjotr.prins@thebird.nl"
  s.executables = ["gff3-fetch"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/gff3-fetch",
    "bio-gff3.gemspec",
    "lib/bio-gff3.rb",
    "lib/bio/db/gff/block/gffblockparser.rb",
    "lib/bio/db/gff/digest/gffinmemory.rb",
    "lib/bio/db/gff/digest/gfflrucache.rb",
    "lib/bio/db/gff/digest/gffnocache.rb",
    "lib/bio/db/gff/digest/gffparser.rb",
    "lib/bio/db/gff/file/gfffasta.rb",
    "lib/bio/db/gff/file/gfffileiterator.rb",
    "lib/bio/db/gff/gff3.rb",
    "lib/bio/db/gff/gff3fasta.rb",
    "lib/bio/db/gff/gff3parsefile.rb",
    "lib/bio/db/gff/gff3parserec.rb",
    "lib/bio/db/gff/gffcomponent.rb",
    "lib/bio/db/gff/gffrecord.rb",
    "lib/bio/db/gff/gffsection.rb",
    "lib/bio/db/gff/gffsequence.rb",
    "lib/bio/db/gff/gffvalidate.rb",
    "lib/bio/output/gfffastawriter.rb",
    "lib/bio/output/gfflogger.rb",
    "lib/bio/system/lruhash.rb",
    "spec/gff3_assemble2_spec.rb",
    "spec/gff3_assemble3_spec.rb",
    "spec/gff3_assemble_spec.rb",
    "spec/gff3_fileiterator_spec.rb",
    "spec/gffdb_spec.rb",
    "spec/gffparserec.rb",
    "test/data/gff/MhA1_Contig1133.fa",
    "test/data/gff/MhA1_Contig1133.gff3",
    "test/data/gff/MhA1_Contig125.fa",
    "test/data/gff/MhA1_Contig125.gff3",
    "test/data/gff/m_hapla.WS232.annotations.part.gff3",
    "test/data/gff/m_hapla.WS232.genomic.part.fa",
    "test/data/gff/standard.gff3",
    "test/data/gff/test-cds.gff3",
    "test/data/gff/test-ext-fasta.fa",
    "test/data/gff/test-ext-fasta.gff3",
    "test/data/gff/test.gff3",
    "test/data/regression/test_ext_gff3.rtest",
    "test/data/regression/test_gff3.rtest",
    "test/data/regression/test_lrucache_ext_gff3.rtest",
    "test/data/regression/test_lrucache_gff3.rtest",
    "test/data/regression/test_nocache_ext_gff3.rtest",
    "test/data/regression/test_nocache_gff3.rtest",
    "test/helper.rb",
    "test/regressiontest.rb",
    "test/test_bio-gff3.rb"
  ]
  s.homepage = "https://github.com/pjotrp/bioruby-gff3-plugin"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "GFF3 parser for big data"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bio>, [">= 1.3.1"])
      s.add_runtime_dependency(%q<log4r>, ["> 1.1.6"])
      s.add_runtime_dependency(%q<bio-logger>, ["> 0.8.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1.5"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_development_dependency(%q<rspec>, [">= 2.3.0"])
    else
      s.add_dependency(%q<bio>, [">= 1.3.1"])
      s.add_dependency(%q<log4r>, ["> 1.1.6"])
      s.add_dependency(%q<bio-logger>, ["> 0.8.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.1.5"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_dependency(%q<rspec>, [">= 2.3.0"])
    end
  else
    s.add_dependency(%q<bio>, [">= 1.3.1"])
    s.add_dependency(%q<log4r>, ["> 1.1.6"])
    s.add_dependency(%q<bio-logger>, ["> 0.8.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.1.5"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    s.add_dependency(%q<rspec>, [">= 2.3.0"])
  end
end

