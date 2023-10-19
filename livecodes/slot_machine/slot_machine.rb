# class SlotMachine
# reel has 3 symbols

# play method => chooses 3 symbols in our reel
# score method => return the points
class SlotMachine
  attr_reader :reels
  def initialize
    @reels = []
  end

  def play
    symbols = %w[joker star bell seven cherry]

    3.times do
      @reels << symbols.sample
    end
  end

  def score

    @score = 0
    if @reels.uniq.size == 1
      case @reels.uniq[0]
      when 'joker'
        @score = 50
      when 'star'
        @score = 40
      when 'bell'
        @score = 30
      when 'seven'
        @score = 20
      when 'cherry'
        @score = 10
      end
    elsif @reels.count('star') == 2 && @reels.include?('joker')
      @score = 20
    elsif @reels.count('joker') == 2
      @score = 25
    elsif @reels.count('bell') == 2 && @reels.include?('joker')
      @score = 15
    elsif @reels.count('seven') == 2 && @reels.include?('joker')
      @score = 10
    elsif @reels.count('cherry') == 2 && @reels.include?('joker')
      @score = 5
    else
      @score = 0
    end
  end
end

slot = SlotMachine.new

slot.play

p slot.reels

p slot.score
