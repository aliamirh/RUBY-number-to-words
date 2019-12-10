require('rspec')
require('number_to_words')

describe('#NumberWords') do
  it('should return "one" when passed "1"') do
    num_wrd = NumberWords.new('1')
    expect(num_wrd.get_words).to(eq('one'))
  end
  it('should return "one" when passed "1,513,235,432,154"') do
    num_wrd = NumberWords.new('1,513,235,432,154')
    expect(num_wrd.get_words).to(eq('one trillion five hundred thirteen billion two hundred thirty five million four hundred thirty two thousand one hundred fifty four'))
  end
  it('should handle zero in the middle of numbers') do
    num_wrd = NumberWords.new('1,013,035,402,004')
    expect(num_wrd.get_words).to(eq('one trillion thirteen billion thirty five million four hundred two thousand four'))
  end
  it('should handle zero') do
    num_wrd = NumberWords.new('0')
    expect(num_wrd.get_words).to(eq('zero'))
  end
end
