require 'rspec'
require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'creates an INSTANCE of Animal class' do
      animal = Animal.new('Babe')
      expect(animal).to be_an(Animal)
      # expect(animal.class).to eq(Animal)
    end
  end

  describe '#name' do
    it "returns the animal's name" do
      animal = Animal.new('Babe')
      expect(animal.name).to eq('Babe')
    end
  end
end
