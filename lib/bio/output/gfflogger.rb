
module Bio
  module GFFbrowser

    module Helpers

      module Error
        include Bio::Log

        def debug str, id=''
          log = LoggerPlus['bio-gff3']
          log.debug str+" <#{id}>"
        end

        def info str, id=''
          log = LoggerPlus['bio-gff3']
          log.info str+" <#{id}>"
        end

        def warn str, id=''
          log = LoggerPlus['bio-gff3']
          log.warn str+" <#{id}>"
        end

        def error str, id=''
          log = LoggerPlus['bio-gff3']
          log.error_(str+" <#{id}>",:act => FailOnError.new)

        end
      end
    end
  end
end
