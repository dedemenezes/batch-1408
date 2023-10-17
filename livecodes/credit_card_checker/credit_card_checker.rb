def credit_card_checker(card_number)
  if card_number == ""
    return "Invalid card number"
  end
  if card_number.match?(/(\d{4} +){3}\d{4}/)
    match_data = card_number.match(/(\d)\d{3} +\d{4} +\d{4} +\d{4}/)
    p match_data
    # p match_data[0] => retrieve the WHOLE STRING that matches the pattern
    # capturing groups start from 1
    if match_data[1] == '4'
      'Valid Visa card number'
    elsif match_data[1] == '5'
      'Valid Mastercard card number'
    end
  else
    return "Invalid card number"
  end
end
