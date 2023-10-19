require_relative '../citizen'

describe Citizen do
  describe "#can_vote?" do
    it "returns true if the citizen is older than 18" do
      citizen = Citizen.new("john", "doe", 19)
      expect(citizen.can_vote?).to eq(true)
    end

    it "returns false if the citizen is too young" do
      citizen = Citizen.new("mary", "doe", 15)
      expect(citizen.can_vote?).to eq(false)
    end

  end
end
