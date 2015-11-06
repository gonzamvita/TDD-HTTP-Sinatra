require 'rspec'

class WordChecker
  def initialize(subjectProvider)
    @subjectProvider = subjectProvider
  end

  def check(subjects)
    true
  end
end
