require_relative "../credit_card_checker.rb"

RSpec.describe '#credit_card_checker' do
  it 'returns "Invalid card number" when passed an empty string' do
    expect(credit_card_checker("")).to eq('Invalid card number')
  end

  it 'returns "Invalid card number" when passed a string with separated by dash' do
    expect(credit_card_checker("4242-4242-4242-4242")).to eq('Invalid card number')
  end

  it 'returns "Valid Visa card number" when passed 4 groups of 4 digitis separated by spaces' do
    expect(credit_card_checker("4242 4242 4242 4242")).to eq("Valid Visa card number")
  end

  it 'returns "Valid Visa card number" when passed 16 digits starting with 4 separated by whatever spaces there might be' do
    expect(credit_card_checker("         4242       4242   4242 4242   ")).to eq('Valid Visa card number')
  end

  it 'returns "Valid Mastercard card number" when passed 16 digits starting with 5 separated by whatever spaces there might be' do
    expect(credit_card_checker("         5242       4242   4242 4242   ")).to eq('Valid Mastercard card number')
  end
end
