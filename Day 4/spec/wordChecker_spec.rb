require_relative "../wordChecker.rb"

RSpec.describe "WordChecker" do
  describe 'Email provider has no strings' do
    it "should return true if no words given" do
      # provider = EmailProviderFake.new([]) # => FAKE
      provider = instance_double("EmailProvider", :get_subjects => []) # => STUB
      checker = WordChecker.new(provider)
      expect(checker.check([])).to eq(true)
    end

    it 'should return true when a word is included in a provider' do
      # provider = EmailProviderFake.new() # => FAKE
      provider = instance_double("EmailProvider", :get_subjects => []) # => STUB
      counter = WordChecker.new(provider)
      expect(counter.check([["hola"]])).to eq(false)
    end
  end

  describe 'Email provider has strings' do
    xit 'should return true when a word is included in a subject' do
      # provider = EmailProviderFake.new(["hola"]) # => FAKE
      provider = instance_double("EmailProvider", :get_subjects => []) # => STUB
      counter = WordChecker.new(provider)
      expect(counter.check([])).to eq(false)
    end
  end
end
